//
//  MeMainVC.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MeMainVC.h"
#import "ReceiptAddressVC.h"
#import "AuthenticationVC.h"
#import "CouponsVC.h"
#import "SpecialDetailsVC.h"
#import "FeedbackVC.h"
#import "LogisticsDetailsVC.h"
#import "MyUserVC.h"
#import "LoginVC.h"
#import "MyCollectionVC.h"
#import "XiaoShouDingDanVC.h"
#import "PayOrderVC.h"
#import "MainMyOrderVC.h"
#import "AboutRiTaoVC.h"
#import "ProductListVC.h"
#import "EvaluationPageVC.h"
#import "SettingVC.h"
#import "TaoKeCenterVC.h"
#import "BrowsingHistoryVC.h"
#import "OrderDetailsVC.h"
#import "SettlementCenterVC.h"
#import "ChongZhiMiMaVC.h"
#import "WangJiMiMaVC.h"
#import "EvaluationVC.h"


#import "MeMainCell_1.h"
#import "MeMainCell_2.h"
#import "MeMainCell_3.h"
#import "MeMainCell_4.h"
#import "MeMainCell_5.h"
#import "MeMainCell_7.h"
#import "MeMainCell_8.h"

#import "ModelMainMe.h"
#import "ModelMemberCenter.h"
#import "ModelPicture.h"
#import "RiTaoHelper.h"
#import "BaseNavigationController.h"

@interface MeMainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) ModelMainMe *model;

@property (nonatomic, strong) ModelPicture *picModel;

@end

@implementation MeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self drawView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestGetMemberCenterAction];
    [self requestMemberCenterPicture];
    
    //H 测试 登录
//    if ([RiTaoHelper IsLogin]){
//        [self requestGetMemberCenterAction];
//        [self requestMemberCenterPicture];
//    }else {
//     
//        LoginVC *VC = [[LoginVC alloc]init];
//        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:VC];
//        [self presentViewController:nav animated:YES completion:nil];
////        [self.navigationController pushViewController:VC animated:YES];
//    }
        //加上这行代码，侧滑返回时上面的navigationBar 不会瞬间隐藏，有个动画效果。
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)requestGetMemberCenterAction {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberCenterResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberCenterAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.model = [ModelMainMe mj_objectWithKeyValues:responseObject];
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)requestMemberCenterPicture {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetUserCenterPictureResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetUserCenterPictureAction" forKey:@"Action"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
       self.picModel =[ModelPicture mj_objectWithKeyValues:responseObject];
        
        NSArray *postiton = @[[NSIndexPath indexPathForRow:5 inSection:0]];
        [self.tableView reloadRowsAtIndexPaths:postiton withRowAnimation:UITableViewRowAnimationNone];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = HEXCOLOR(0xf5f2f7);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,48);
    
    UIView *navView = [[UIView alloc]init];
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    navView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(55);
    
    UIButton *setBtn = [[UIButton alloc] init];
    [setBtn setImage:GETIMAGE(@"设置") forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(clicksetbtn) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:setBtn];

    UIButton *messageBtn = [[UIButton alloc] init];
    [messageBtn setImage:GETIMAGE(@"xiaoxi") forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(clickmessagebtn) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:messageBtn];
    
    setBtn.sd_layout
    .leftSpaceToView(navView,15)
    .topSpaceToView(navView,30)
    .heightIs(20)
    .widthIs(20);

    messageBtn.sd_layout
    .rightSpaceToView(navView,15)
    .topSpaceToView(navView,30)
    .heightIs(20)
    .widthIs(20);
    
    
}

-(void)clicksetbtn
{
    SettingVC *setVC = [[SettingVC alloc]init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}

-(void)clickmessagebtn {
    
    if ([RiTaoHelper IsLogin]){
        [LCProgressHUD showInfoMsg:[NSString stringWithFormat:@"已经登录了,id是%@",[RiTaoHelper getMemberGuid]]];
        
    }else {
        //H 测试
        LoginVC *VC = [[LoginVC alloc]init];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
    }
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MeMainCell_1 *cell = [MeMainCell_1 cellWithTableView:tableView];
        cell.model = self.model.MemberCenter;
        return cell;
    }
    if (indexPath.row == 1) {
        MeMainCell_2 *cell = [MeMainCell_2 cellWithTableView:tableView];
        return cell;
    }
    if (indexPath.row == 2) {
        MeMainCell_3 *cell = [MeMainCell_3 cellWithTableView:tableView];
        cell.model = self.model.MemberCenter;
        return cell;
    }
    if (indexPath.row == 3) {
        MeMainCell_4 *cell = [MeMainCell_4 cellWithTableView:tableView];
        
        return cell;
    }
    if (indexPath.row == 4) {
        MeMainCell_5 *cell = [MeMainCell_5 cellWithTableView:tableView];
        
        return cell;
    }
    if (indexPath.row == 5) {
        MeMainCell_7 *cell = [MeMainCell_7 cellWithTableView:tableView];
        
        cell.model = self.picModel;
        
        return cell;
    }
    if (indexPath.row == 6) {
        MeMainCell_8 *cell = [MeMainCell_8 cellWithTableView:tableView];
        
        return cell;
    }
    
    return [UITableViewCell new];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        vc.type = 0;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3) {
        TaoKeCenterVC *vc = [[TaoKeCenterVC alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 280;
    }
    if (indexPath.row == 1) {
        return 45;
    }
    if (indexPath.row == 2) {
        return ScreenWidth/5 + 20;
    }
    if (indexPath.row == 3) {
        return 50;
    }
    if (indexPath.row == 4) {
        return (ScreenWidth - 30)/4;
    }
    if (indexPath.row == 5) {
        return ScreenWidth/5 + 20;
    }
    if (indexPath.row == 6) {
        return 40;
    }
    
    return 30;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}


- (void)pingjia
{
    EvaluationVC *vc = [[EvaluationVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)wangjimima
{
    WangJiMiMaVC *vc = [[WangJiMiMaVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)chongzhimima
{
    ChongZhiMiMaVC *vc = [[ChongZhiMiMaVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)fahuoshuoming
{
    WebViewVC *vc = [[WebViewVC alloc] init];
    vc.navigationItem.title = @"发货说明";
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)yunfeishuoming
{
    WebViewVC *vc = [[WebViewVC alloc] init];
    vc.navigationItem.title = @"运费说明";
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)tuihuoshuoming
{
    WebViewVC *vc = [[WebViewVC alloc] init];
    vc.navigationItem.title = @"退货说明";
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)jiesuanzhongxin {
    SettlementCenterVC *VC = [[SettlementCenterVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)dingdanxiangBtn {
    OrderDetailsVC *VC = [[OrderDetailsVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)liulanjilu {
    BrowsingHistoryVC *broVC = [[BrowsingHistoryVC alloc]init];
    broVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:broVC animated:YES];
}

-(void)ketao {
    TaoKeCenterVC *setVC = [[TaoKeCenterVC alloc]init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}

-(void)shezhi {
    SettingVC *setVC = [[SettingVC alloc]init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}


-(void)pinglunyemian {
    EvaluationPageVC *vc = [[EvaluationPageVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)shangpingliebiao
{
    ProductListVC *vc = [ProductListVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)guanyuritao {
    AboutRiTaoVC *vc = [[AboutRiTaoVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)wodedingdan {
    MainMyOrderVC *VC = [[MainMyOrderVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)xiaoshoudingdan
{
    XiaoShouDingDanVC *VC = [[XiaoShouDingDanVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)login {
    LoginVC *VC = [[LoginVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)wodeyonghu {
    MyUserVC *userVC = [[MyUserVC alloc]init];
    userVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userVC animated:YES];
}

-(void)yijianfankui {
    FeedbackVC *feeVC = [[FeedbackVC alloc]init];
    feeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:feeVC animated:YES];
}

-(void)dingdanxiangqing {
    LogisticsDetailsVC *vc = [LogisticsDetailsVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)wodeshoucang {
    MyCollectionVC *vc = [MyCollectionVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)special {
    SpecialDetailsVC *VC = [[SpecialDetailsVC alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)address {
    ReceiptAddressVC *addvc = [[ReceiptAddressVC alloc]init];
    addvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addvc animated:YES];
}

-(void)name {
    AuthenticationVC *thenVC = [[AuthenticationVC alloc]init];
    thenVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:thenVC animated:YES];
}

-(void)coupons {
    CouponsVC *coupVC = [[CouponsVC alloc]init];
    coupVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:coupVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
