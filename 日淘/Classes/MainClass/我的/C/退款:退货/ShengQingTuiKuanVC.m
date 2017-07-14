//
//  ShengQingTuiKuanVC.m
//  日淘
//
//  Created by 李强 on 2017/2/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ShengQingTuiKuanVC.h"
#import "ACSelectMediaView.h"
#import "TuiKuanJingDuVC.h"
#import "ModelCancleOrder.h"

@interface ShengQingTuiKuanVC ()
@property (weak, nonatomic) IBOutlet UITextView *resonTextView;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet ACSelectMediaView *photoView;
@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableArray *imageArray;

@end

@implementation ShengQingTuiKuanVC

- (NSMutableArray *)listArray
{
    if (!_listArray){
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}

- (NSMutableArray *)imageArray
{
    if (!_imageArray){
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = HEXCOLOR(0xeeeeee);
    
    self.title = @"退款";
    
    [self drawView];
}

- (void)drawView
{
    //1、得到默认布局高度（唯一获取高度方法）
    CGFloat height = [ACSelectMediaView defaultViewHeight];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 280, ScreenWidth - 40, height)];
    
    //2、初始化
    ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
    //3、选择媒体类型：是否仅选择图片或者其他的等
    mediaView.type = ACMediaTypePhotoAndCamera;
    mediaView.photoMaxNum = 3;
    //4、随时获取新的布局高度
    [mediaView observeViewHeight:^(CGFloat value) {
        bgView.height = value;
    }];
    //5、随时获取已经选择的媒体文件
    
    __weak typeof(self) weakSelf =self;
    [mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
        
        [weakSelf.listArray removeAllObjects];
        [weakSelf.listArray addObjectsFromArray:list];
        
    }];
    [bgView addSubview:mediaView];
    [self.view addSubview:bgView];
    
    //退款金额
    self.priceTextField.text = self.payMoney;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"提交申请" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = COLOR_Red2;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(comit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(bgView,25)
    .heightIs(30)
    .widthIs(200);
}

- (void)comit
{
    [self.imageArray removeAllObjects];
    if (self.resonTextView.text.length <1){
        [LCProgressHUD showMessage:@"请填写退款原因"];
        return;
    }
    
    for (ACMediaModel *model in self.listArray){
        [self.imageArray addObject:model.image];
    }
    //H 测试  图片格式传入出错
//    NSData *imageData = [NSData ]
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CreateAfterSaleSheetResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CreateAfterSaleSheetAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.SaleOrderGuid forKey:@"SaleOrderGoodsGuid"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:self.resonTextView.text forKey:@"RemarkFromMember"]; //退款原因
//    [params setValue:self.imageArray forKey:@"PictureList"]; //退款图片
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelCancleOrder *model = [ModelCancleOrder mj_objectWithKeyValues:responseObject];
        
        if (model.IsSuccessful)
        {
            [LCProgressHUD showSuccess:@"已成功申请退货"];
            
            TuiKuanJingDuVC *vc = [TuiKuanJingDuVC new];
            [DCURLRouter pushViewController:vc animated:YES];
            
        }else{
            [LCProgressHUD showFailure:model.ResponseMessage];
        }
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
