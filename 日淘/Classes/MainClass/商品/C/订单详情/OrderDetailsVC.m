//
//  OrderDetailsVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsVC.h"
#import "OrderDetailsFaHuoCell.h"
#import "OrderDetailsQianShouCell.h"
#import "OrderDetailsShouJianCell.h"
#import "OrderDetailsProductCell.h"
#import "OrderDetailsXinXiCell.h"
#import "ModelWfxSaleOrderDetail.h"
#import "ProductDetailsVC.h"

@interface OrderDetailsVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) ModelWfxSaleOrderDetail *model;

@end

@implementation OrderDetailsVC

- (NSMutableArray *)cellsArray {
    if (!_cellsArray) {
        _cellsArray = [NSMutableArray array];
    }
    return _cellsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"订单详情";
    
    
    [self initView];
    [self requestGetSaleOrderAction];
}


-(void)requestGetSaleOrderAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetWfxSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleOrderAction" forKey:@"Action"];
    [params setValue:self.SaleOrderGuid forKey:@"SaleOrderGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
       LQModelWfxSaleOrderDetail *lqModelWfxSaleOrderDetail = [LQModelWfxSaleOrderDetail mj_objectWithKeyValues:responseObject];
        self.model = lqModelWfxSaleOrderDetail.WfxSaleOrderDetail;
        [self upDataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
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
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);

}

-(void)upDataCells {
    self.cellsArray = [NSMutableArray array];
    
    NSDictionary *dic1 = @{kCell:@"OrderDetailsFaHuoCell",kValue:self.model};
    [self.cellsArray addObject:dic1];
    NSDictionary *dic2 = @{kCell:@"OrderDetailsQianShouCell",kValue:self.model.LastLogisticsSheetDetail};
    [self.cellsArray addObject:dic2];
    NSDictionary *dic3 = @{kCell:@"OrderDetailsShouJianCell",kValue:self.model};
    [self.cellsArray addObject:dic3];
    
    for (ModelSaleOrderGoodsDetailCollection *modelmodel in self.model.SaleOrderGoodsDetailCollection)
    {
        NSDictionary *dic4 = @{kCell:@"OrderDetailsProductCell",kValue:modelmodel};
        [self.cellsArray addObject:dic4];
    }
    
    NSDictionary *dic5 = @{kCell:@"OrderDetailsXinXiCell",kValue:self.model};
    [self.cellsArray addObject:dic5];
    
    [self.tableView reloadData];
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
    if([dic[kCell]isEqualToString:@"OrderDetailsFaHuoCell"]) {
        OrderDetailsFaHuoCell *cell = [OrderDetailsFaHuoCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsQianShouCell"]) {
        OrderDetailsQianShouCell *cell = [OrderDetailsQianShouCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsShouJianCell"]) {
        OrderDetailsShouJianCell *cell = [OrderDetailsShouJianCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsProductCell"]) {
        OrderDetailsProductCell *cell = [OrderDetailsProductCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsXinXiCell"]) {
        OrderDetailsXinXiCell *cell = [OrderDetailsXinXiCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    return [UITableViewCell new];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellsArray[indexPath.row];
    if([dic[kCell]isEqualToString:@"OrderDetailsFaHuoCell"]) {
        return 80;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsQianShouCell"]) {
        return 60;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsShouJianCell"]) {
        return 80;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsProductCell"]) {
        return 60;
    }
    if([dic[kCell]isEqualToString:@"OrderDetailsXinXiCell"]) {
        return 130;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if([dic[kCell] isEqualToString:@"OrderDetailsProductCell"]) {
        
        
        ModelSaleOrderGoodsDetailCollection *model = dic[kValue];
        
        ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
        vc.guid = model.ProductGuid;
        vc.hidesBottomBarWhenPushed = YES;
        [DCURLRouter pushViewController:vc animated:YES];
        
    }
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
