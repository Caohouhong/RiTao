//
//  SettlementCenterVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementCenterVC.h"
#import "SettlementShouhuoCell.h"
#import "SettlementShengfenCell.h"
#import "SettlementCangkuCell.h"
#import "SettlementProductCell.h"
#import "SettlementYunfeiCell.h"
#import "SettlementYouhuiCell.h"
#import "SettlementHejiCell.h"
#import "ModelWfxPrepareSaleOrder.h"
#import "ReceiptAddressVC.h"
#import "CouponsVC.h"
#import "AuthenticationVC.h"
#import "PayOrderVC.h"
#import "ModelPayOrder.h"
#import "SettlementLiuYanCell.h"

@interface SettlementCenterVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) ModelWfxPrepareSaleOrder *model;
@property (nonatomic, weak) UIView *footerView ;
@property (nonatomic, weak) UILabel *gongLabel;
@property (nonatomic, weak) UILabel *jiageLabel;
@property (nonatomic, copy) NSString *ReceiverAddressGuid;
@property (nonatomic, copy) NSString *MemberSaleCouponGuid;
@property (nonatomic, strong) ModelIDCardCollection *modelIDCardCollection;

@end

@implementation SettlementCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"结算中心";

    [self drawFooterView];
    [self initView];
    [self requestData];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.footerView,0);
    
}

- (void)drawFooterView
{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:footerView];
    self.footerView = footerView;
    
    UILabel *gongLabel = [[UILabel alloc]init];
    gongLabel.text = @"共2件商品";
    gongLabel.font = TFont(11);
    //gongLabel.textColor = [UIColor grayColor];
    [self.footerView addSubview:gongLabel];
    self.gongLabel = gongLabel;
    
    UILabel *jiageLabel = [[UILabel alloc]init];
    jiageLabel.text = @"合计:";
    jiageLabel.font = TFont(11);
    //jiageLabel.textColor = [UIColor grayColor];
    [self.footerView addSubview:jiageLabel];
    self.jiageLabel = jiageLabel;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HEXCOLOR(0xeeeeee);
    [footerView addSubview:lineView];
    
    UIButton *orderBtn = [[UIButton alloc]init];
    orderBtn.backgroundColor = COLOR_Red;
    orderBtn.titleLabel.font = TFont(13);
    [orderBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [orderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderBtn addTarget:self action:@selector(commitOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:orderBtn];

    footerView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(45);
    
    gongLabel.sd_layout
    .leftSpaceToView(footerView,15)
    .topSpaceToView(footerView,5)
    .widthIs(100)
    .heightIs(20);
    
    jiageLabel.sd_layout
    .leftSpaceToView(footerView,15)
    .bottomSpaceToView(footerView,5)
    .widthIs(100)
    .heightIs(20);
    
    orderBtn.sd_layout
    .topSpaceToView(footerView,0)
    .bottomSpaceToView(footerView,0)
    .rightSpaceToView(footerView,0)
    .widthIs(ScreenWidth/2);
    
    lineView.sd_layout
    .leftSpaceToView(footerView,0)
    .topSpaceToView(footerView,0)
    .rightSpaceToView(footerView,0)
    .heightIs(0.5);
}

-(void)upDataCells
{
    self.cellsArray = [NSMutableArray array];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.model.MemberShopCartDetailCollection];
    NSMutableArray *dateMutablearray = [@[] mutableCopy];
    
    for (int i = 0; i < array.count; i ++)
    {
        ModelMemberShopCartDetailCollection *modelmodel = array[i];
        
        if (!modelmodel.IsSelected)
        {
            continue;
        }
        
        NSMutableArray *tempArray = [@[] mutableCopy];
        
        [tempArray addObject:modelmodel];
        
        for (int j = i+1; j < array.count; j ++)
        {
            ModelMemberShopCartDetailCollection *modelmodelmodel = array[j];
            
            if([modelmodel.WarehouseGuid isEqualToString:modelmodelmodel.WarehouseGuid])
            {
                
                [tempArray addObject:modelmodelmodel];
                
                [array removeObjectAtIndex:j];
                j -= 1;
            }
        }
        
        [dateMutablearray addObject:tempArray];
    }
    
    NSDictionary *dic1 = @{kCell:@"SettlementShouhuoCell",kValue:self.model};
    [self.cellsArray addObject:dic1];
    
    NSDictionary *dic2 = @{kCell:@"SettlementShengfenCell",kValue:self.modelIDCardCollection?self.modelIDCardCollection:self.model};
    [self.cellsArray addObject:dic2];
    
    for (NSMutableArray *array in dateMutablearray)
    {
        NSDictionary *dic3 = @{kCell:@"SettlementCangkuCell",kValue:[array firstObject]};
        [self.cellsArray addObject:dic3];
        
        for (ModelMemberShopCartDetailCollection *modelmodel in array)
        {
            NSDictionary *dic4 = @{kCell:@"SettlementProductCell",kValue:modelmodel};
            [self.cellsArray addObject:dic4];
        }
    }
    
    NSDictionary *dic5 = @{kCell:@"SettlementYunfeiCell",kValue:self.model};
    [self.cellsArray addObject:dic5];
    NSDictionary *dic6 = @{kCell:@"SettlementYouhuiCell",kValue:self.model};
    [self.cellsArray addObject:dic6];
    NSDictionary *dic7 = @{kCell:@"SettlementHejiCell",kValue:self.model};
    [self.cellsArray addObject:dic7];
    NSDictionary *dic8 = @{kCell:@"SettlementLiuYanCell"};
    [self.cellsArray addObject:dic8];
    
    [self.tableView reloadData];
    
    
    
    self.gongLabel.text = [NSString stringWithFormat:@"共%@件商品",self.model.TotalQuantity];
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"合计:" attributes:@{NSForegroundColorAttributeName:HEXCOLOR(0x333333),NSFontAttributeName:TFont(11)}];
    [att appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",self.model.TotalAmount.MoneySymbol,self.model.TotalAmount.Value] attributes:@{NSForegroundColorAttributeName:COLOR_Red2,NSFontAttributeName:TFont(13)}]];
    
    self.jiageLabel.attributedText = att;
}

- (void)commitOrder
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CreateSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CreateSaleOrderAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.MemberSaleCouponGuid forKey:@"MemberSaleCouponGuid"];
    [params setValue:self.ReceiverAddressGuid forKey:@"MemberAddressGuid"];
    [params setValue:self.modelIDCardCollection?self.modelIDCardCollection.Guid:self.model.MemberCustomClearIDCardGuid forKey:@"MemberCustomClearIDCardGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在提交..." success:^(id responseObject) {
        
        ModelPayOrder *modelmodel = [ModelPayOrder mj_objectWithKeyValues:responseObject];
        
        PayOrderVC *vc = [[PayOrderVC alloc] init];
        vc.model = modelmodel;
        [DCURLRouter pushViewController:vc animated:YES];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.PrepareSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.PrepareSaleOrderAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    if (self.ReceiverAddressGuid)
    {
        [params setValue:self.ReceiverAddressGuid forKey:@"MemberAddressGuid"];
    }
    
    if (self.MemberSaleCouponGuid)
    {
        [params setValue:self.MemberSaleCouponGuid forKey:@"MemberSaleCouponGuid"];
    }
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        LQModelWfxPrepareSaleOrder *lqModelWfxPrepareSaleOrder = [LQModelWfxPrepareSaleOrder mj_objectWithKeyValues:responseObject];
        self.model = lqModelWfxPrepareSaleOrder.WfxPrepareSaleOrder;
        self.ReceiverAddressGuid = self.model.ReceiverAddressGuid;
        self.MemberSaleCouponGuid = self.model.MemberSaleCouponGuid;
        [self upDataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellsArray[indexPath.row];
    if([dic[kCell]isEqualToString:@"SettlementShouhuoCell"]) {
        SettlementShouhuoCell *cell = [SettlementShouhuoCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementShengfenCell"]) {
        SettlementShengfenCell *cell = [SettlementShengfenCell cellWithTableview:tableView];
        
        if (self.modelIDCardCollection) {
            cell.model2 = dic[kValue];
        }else{
            cell.model = dic[kValue];
        }
        
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementCangkuCell"]) {
        SettlementCangkuCell *cell = [SettlementCangkuCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementProductCell"]) {
        SettlementProductCell *cell = [SettlementProductCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementYunfeiCell"]) {
        SettlementYunfeiCell *cell = [SettlementYunfeiCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementYouhuiCell"]) {
        SettlementYouhuiCell *cell = [SettlementYouhuiCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementHejiCell"]) {
        SettlementHejiCell *cell = [SettlementHejiCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"SettlementLiuYanCell"]) {
        SettlementLiuYanCell *cell = [SettlementLiuYanCell cellWithTableView:tableView];
        return cell;
    }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellsArray[indexPath.row];
    if([dic[kCell]isEqualToString:@"SettlementShouhuoCell"]) {
        return 60;
    }
    if([dic[kCell]isEqualToString:@"SettlementShengfenCell"]) {
        return 80;
    }
    if([dic[kCell]isEqualToString:@"SettlementCangkuCell"]) {
        return 30;
    }
    if([dic[kCell]isEqualToString:@"SettlementProductCell"]) {
        return 60;
    }
    if([dic[kCell]isEqualToString:@"SettlementYunfeiCell"]) {
        return 35;
    }
    if([dic[kCell]isEqualToString:@"SettlementYouhuiCell"]) {
        return 35;
    }
    if([dic[kCell]isEqualToString:@"SettlementHejiCell"]) {
        return 35;
    }
    if([dic[kCell]isEqualToString:@"SettlementLiuYanCell"]) {
        return 35;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    if([dic[kCell]isEqualToString:@"SettlementShouhuoCell"])
    {
        ReceiptAddressVC *vc = [[ReceiptAddressVC alloc] init];
        vc.isFromSettlementCenterVC = YES;
        [DCURLRouter pushViewController:vc animated:YES];
        
        __weak typeof(self) weakSelf = self;
        vc.didChooseAddressBlock = ^(NSString *addressGuid){
            weakSelf.ReceiverAddressGuid = addressGuid;
            [weakSelf requestData];
        };
    }
    if([dic[kCell]isEqualToString:@"SettlementYouhuiCell"])
    {
        CouponsVC *vc = [[CouponsVC alloc] init];
        vc.isFromSettlementCenterVC = YES;
        [DCURLRouter pushViewController:vc animated:YES];
        
        
        __weak typeof(self) weakSelf = self;
        vc.didChooseYouHuiQuanBlock = ^(NSString *youHuiQuanGuid){
            weakSelf.MemberSaleCouponGuid = youHuiQuanGuid;
            [weakSelf requestData];
        };
    }
    if([dic[kCell]isEqualToString:@"SettlementShengfenCell"])
    {
        AuthenticationVC *vc = [[AuthenticationVC alloc] init];
        vc.isFromSettlementCenterVC = YES;
        [DCURLRouter pushViewController:vc animated:YES];
        
        __weak typeof(self) weakSelf = self;
        vc.didChooseAuthenticationBlock = ^(ModelIDCardCollection *model){
            weakSelf.modelIDCardCollection = model;
            [weakSelf upDataCells];
        };
        
    }
    
}
@end
