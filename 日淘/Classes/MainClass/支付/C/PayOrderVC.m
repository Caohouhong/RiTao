//
//  PayOrderVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PayOrderVC.h"
#import "PayOrderFirstCell.h"
#import "PayOrderSecondCell.h"
#import "PayOrderHeaderCell.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "MainMyOrderVC.h"

@interface PayOrderVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIButton *btn;
@property (nonatomic, assign) int PaymentMethod;
@end

@implementation PayOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"支付订单";
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(DidClickBack)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    self.PaymentMethod = 1;
    
    [self initView];
    [self upDataCell];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.tableFooterView = [self footerView];
    [self.view addSubview:tableview];
    self.tableView = tableview;

    tableview.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
}

-(UIView *)footerView {
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    
    UIButton *payBtn = [UIButton createButtonWithTitle:@"去支付"
                                                   backgroupColor:COLOR_Red2
                                                   titleColor:COLOR_White
                                                   font:13 target:self
                                                   action:@selector(payClick)];
    [footView addSubview:payBtn];
    
    payBtn.sd_layout
    .topSpaceToView(footView,20)
    .centerXEqualToView(footView)
    .widthIs(180).heightIs(30);
    
    return footView;
}

-(void)upDataCell
{
    
}

-(void)payClick
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RequestPaymentResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RequestPaymentAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:[NSString stringWithFormat:@"%d",self.PaymentMethod] forKey:@"PaymentMethod"];
    [params setValue:self.model.SaleOrderID forKey:@"SaleOrderID"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在跳转支付..." success:^(id responseObject) {
        
        ModelPayOrder *modelmodel = [ModelPayOrder mj_objectWithKeyValues:responseObject];
        
        if (self.PaymentMethod == 1)
        {
            NSString *sign = modelmodel.OrderString;
            
            [[AlipaySDK defaultService] payOrder:sign fromScheme:alipat_appScheme callback:^(NSDictionary *resultDic) {
                NSLog(@"reslut = %@",resultDic);
            }];
        }else{
            
            //需要创建这个支付对象
            PayReq *req   = [[PayReq alloc] init];
            //由用户微信号和AppID组成的唯一标识，用于校验微信用户
            req.openID = modelmodel.appId;
            
            // 商家id，在注册的时候给的
            req.partnerId = modelmodel.PartnerID;
            
            // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
            req.prepayId = modelmodel.PrepayID;
            
            // 根据财付通文档填写的数据和签名
            //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
            req.package = @"Sign=WXPay";
            
            // 随机编码，为了防止重复的，在后台生成
            req.nonceStr  = modelmodel.NonceStr;
            
            // 这个是时间戳，也是在后台生成的，为了验证支付的
            NSString * stamp = modelmodel.TimeStamp;
            req.timeStamp = stamp.intValue;
            
            // 这个签名也是后台做的
            req.sign = modelmodel.Sign;
            
            //发送请求到微信，等待微信返回onResp
            [WXApi sendReq:req];
            DLog(@"%i",[WXApi sendReq:req]);
        }
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    }
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        PayOrderFirstCell *cell = [PayOrderFirstCell cellWithTableview:tableView];
        cell.model = self.model;
        return cell;
    }
    if(indexPath.row == 0) {
        PayOrderHeaderCell *cell = [PayOrderHeaderCell cellWithTableview:tableView];
        return cell;
    }
    PayOrderSecondCell *cell = [PayOrderSecondCell cellWithTableview:tableView];
    cell.iconimageView.image = GETIMAGE(iconArray[indexPath.row-1]);
    cell.shangLabel.text = TopArray[indexPath.row-1];
    cell.xiaLabel.text = BottomArray[indexPath.row-1];
    [cell.selectBtn addTarget:self action:@selector(clickTag:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectBtn.tag = indexPath.row;
    if(indexPath.row == 1) {
        cell.selectBtn.selected = YES;
        self.btn = cell.selectBtn;
    }
    return cell;
}

-(void)clickTag:(UIButton *)btn {
    self.btn.selected = NO;
    btn.selected = YES;
    self.btn = btn;
    self.PaymentMethod = (int)btn.tag;
    
    NSLog(@"=======>%d",self.PaymentMethod);
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
        if(indexPath.row == 0) {
            return 30;}}
    return 50;
}

- (void)DidClickBack
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"取消订单" message:@"您确认取消订单吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        vc.type = 1;
        [DCURLRouter pushViewController:vc animated:YES];
        
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
