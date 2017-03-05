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

@interface ShengQingTuiKuanVC ()
@property (weak, nonatomic) IBOutlet UITextView *resonTextView;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet ACSelectMediaView *photoView;

@end

@implementation ShengQingTuiKuanVC

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
        
        
//        if (weakSelf.haveChoosePhotoBlock) {
//            weakSelf.haveChoosePhotoBlock(list);
//        }
        
    }];
    
    [bgView addSubview:mediaView];
    [self.view addSubview:bgView];
    
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
    TuiKuanJingDuVC *vc = [TuiKuanJingDuVC new];
    [DCURLRouter pushViewController:vc animated:YES];
}

@end
