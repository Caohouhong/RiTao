//
//  LogisticsDetailsVC.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LogisticsDetailsVC.h"
#import "LogisticsStateCell.h"
#import "LogisticsDetailCell.h"
#import "LogisticsDetailTopCell.h"
#import "LogisticsDetailCenterCell.h"
#import "LogisticsDetailBottomCell.h"

#import "ModelMainWuliu.h"
#import "ModelSaleOrderLogisticsDetail.h"
#import "ModelLogisticsSheetDetailTable.h"

@interface LogisticsDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) ModelSaleOrderLogisticsDetail *Ordermodel;
@property (nonatomic, strong) NSMutableArray *cellsArray;

@end

@implementation LogisticsDetailsVC

- (NSMutableArray *)cellsArray
{
    if (!_cellsArray) {
        _cellsArray = [NSMutableArray array];
    }
    
    return _cellsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"订单追踪";
    
    
    [self requestGetLogisticHistoryCollectionAction];
    [self drawView];
    [self updataCells];
}

-(void)requestGetLogisticHistoryCollectionAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetLogisticHistoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetLogisticHistoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:self.SaleOrderGuid forKey:@"SaleOrderGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelMainWuliu *model = [ModelMainWuliu mj_objectWithKeyValues:responseObject];
        self.Ordermodel = model.SaleOrderLogisticsDetail;
        
        [self updataCells];
        
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
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
//    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}


- (void)updataCells
{
    self.cellsArray = [NSMutableArray array];
    
    NSDictionary *dic1 = @{kCell:@"LogisticsStateCell"};
    NSDictionary *dic2 = @{kCell:@"LogisticsDetailCell",kValue:[BaseModel new]};
    [self.cellsArray addObject:dic1];
    [self.cellsArray addObject:dic2];
    
    int i = 0;
    for(ModelLogisticsSheetDetailTable *model in self.Ordermodel.LogisticsSheetDetailTable) {
        
        if(i == 0) {
            NSDictionary *dic3 = @{kCell:@"LogisticsDetailTopCell",kValue:model};
            [self.cellsArray addObject:dic3];
        }else if ( i > 0){
            NSDictionary *dic4 = @{kCell:@"LogisticsDetailCenterCell",kValue:model};
            [self.cellsArray addObject:dic4];
        }
        i ++;
    }
    
//    NSDictionary *dic3 = @{kCell:@"LogisticsDetailTopCell",kValue:[BaseModel new]};
//    NSDictionary *dic4 = @{kCell:@"LogisticsDetailCenterCell",kValue:[BaseModel new]};
//    NSDictionary *dic5 = @{kCell:@"LogisticsDetailBottomCell",kValue:[BaseModel new]};
    

    
    
    //[self.cellsArray addObject:dic5];
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"LogisticsStateCell"])
    {
        LogisticsStateCell *cell = [LogisticsStateCell cellWithTableView:tableView];
        cell.model = self.Ordermodel;
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailCell"])
    {
        LogisticsDetailCell *cell = [LogisticsDetailCell cellWithTableView:tableView];
        cell.model = self.Ordermodel;
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailTopCell"])
    {
        LogisticsDetailTopCell *cell = [LogisticsDetailTopCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailCenterCell"])
    {
        LogisticsDetailCenterCell *cell = [LogisticsDetailCenterCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailBottomCell"])
    {
        LogisticsDetailBottomCell *cell = [LogisticsDetailBottomCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"LogisticsStateCell"])
    {
        return 57;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailCell"])
    {
        return 85;
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailTopCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"model" cellClass:[LogisticsDetailTopCell class] contentViewWidth:ScreenWidth];
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailCenterCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"model" cellClass:[LogisticsDetailCenterCell class] contentViewWidth:ScreenWidth];
    }
    
    if ([dic[kCell] isEqualToString:@"LogisticsDetailBottomCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"model" cellClass:[LogisticsDetailBottomCell class] contentViewWidth:ScreenWidth];
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
