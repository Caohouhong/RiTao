//
//  CouponsVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "CouponsVC.h"
#import "CouponsCell.h"
#import "CouponsCellTypeTwo.h"
#import "YouHuiJuanModel.h"
#import "ModelMemberSaleCouponCollection.h"

@interface CouponsVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIButton *WeiuseBtn;
@property (nonatomic, weak) UIButton *YiuseBtn;
@property (nonatomic, weak) UIButton *ExpiredBtn;
@property (nonatomic, weak) UIView *lineView;

@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *weiArray;
@property (nonatomic, strong) NSMutableArray *yiArray;
@property (nonatomic, strong) NSMutableArray *guoArray;
@end

@implementation CouponsVC

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(NSMutableArray *)weiArray {
    if(_weiArray == nil) {
        _weiArray = [NSMutableArray array];
    }
    return _weiArray;
}

-(NSMutableArray *)yiArray {
    if(_yiArray == nil) {
        _yiArray = [NSMutableArray array];
    }
    return _yiArray;
}

-(NSMutableArray *)guoArray {
    if(_guoArray == nil) {
        _guoArray = [NSMutableArray array];
    }
    return _guoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"我的优惠卷";
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"]; //yyyy-MM-dd'T'HH:mm:ss.SSSXXX
    NSDate *EndinputDate = [inputFormatter dateFromString:@"2000-01-01T08:00:00+08:00"];
    NSTimeInterval  endintervl = [EndinputDate timeIntervalSince1970];
    NSLog(@"-----%f---",endintervl);
   

    self.type = 2;
    [self initData];
    [self initHeaderView];
    [self initView];
    
    
}

-(void)initData {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberSaleCouponCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberSaleCouponCollectionAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@(self.type) forKey:@"SaleCouponStatus"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [self.dataArray removeAllObjects];
        
        YouHuiJuanModel *model = [YouHuiJuanModel mj_objectWithKeyValues:responseObject];
        for(NSDictionary *dic in model.MemberSaleCouponCollection) {
            ModelMemberSaleCouponCollection * salemodel = [ModelMemberSaleCouponCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:salemodel];
        }
    
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}


-(void)initHeaderView {

    UIButton *WeiuseBtn = [self createButtonWithTitle:@"未使用" target:self action:@selector(weiuseBtn)];
    self.WeiuseBtn = WeiuseBtn;
    
    UIButton *YiuseBtn = [self createButtonWithTitle:@"已使用" target:self action:@selector(yiuseBtn)];
    self.YiuseBtn = YiuseBtn;
    
    UIButton *ExpiredBtn = [self createButtonWithTitle:@"已过期" target:self action:@selector(expiredBtn)];
    self.ExpiredBtn = ExpiredBtn;
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = COLOR_LineViewColor;
    
    UIView *lineView = [self createlineView];
    self.lineView = lineView;
    
    [self.view sd_addSubviews:@[WeiuseBtn, YiuseBtn, ExpiredBtn,lineView1,lineView]];
    
    WeiuseBtn.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .widthIs(ScreenWidth/3).heightIs(40);
    
    YiuseBtn.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(WeiuseBtn,0)
    .widthIs(ScreenWidth/3).heightIs(40);
    
    ExpiredBtn.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(YiuseBtn,0)
    .widthIs(ScreenWidth/3).heightIs(40);
    
    lineView1.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,38)
    .widthIs(ScreenWidth).heightIs(2);
    
    lineView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,38)
    .widthIs(ScreenWidth/3).heightIs(2);
    
}

-(void)initView {
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,40).bottomSpaceToView(self.view,0);
}


-(void)weiuseBtn {
    self.lineView.x = CGRectGetMinX(self.WeiuseBtn.frame);
    
    self.type = 2;
    [self initData];
}

-(void)yiuseBtn {
    self.lineView.x = CGRectGetMinX(self.YiuseBtn.frame);
    
    self.type = 1;
    [self initData];
}

-(void)expiredBtn {
    self.lineView.x = CGRectGetMinX(self.ExpiredBtn.frame);
    
    self.type = 3;
    [self initData];
}


#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.type == 2) {
        return self.dataArray.count;
    }
    if(self.type == 1) {
        return self.dataArray.count;
    }
    if(self.type == 3) {
        return self.dataArray.count;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.type == 2)
    {
        CouponsCell *cell = [CouponsCell cellWithTableview:tableView];
        cell.model = self.dataArray[indexPath.section];
        return cell;
    }
    if (self.type == 1)
    {
        CouponsCellTypeTwo *cell = [CouponsCellTypeTwo cellWithTableview:tableView];
        cell.model = self.dataArray[indexPath.section];
        return cell;
    }
    if (self.type == 3)
    {
        CouponsCellTypeTwo *cell = [CouponsCellTypeTwo cellWithTableview:tableView];
        cell.model = self.dataArray[indexPath.section];
        return cell;
    }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(UIButton *)createButtonWithTitle:(NSString *)title target:(id)targe action:(SEL)action{
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = TFont(15);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(UIView *)createlineView {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 2)
    {
        if (self.isFromSettlementCenterVC)
        {
            if (self.didChooseYouHuiQuanBlock)
            {
                ModelMemberSaleCouponCollection *model =  self.dataArray[indexPath.section];
                self.didChooseYouHuiQuanBlock(model.SaleCouponGuid);
                [DCURLRouter popViewControllerAnimated:YES];
            }
        }
    }
    
}

@end
