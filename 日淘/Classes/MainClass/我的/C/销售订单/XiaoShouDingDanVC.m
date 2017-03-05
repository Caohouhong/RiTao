//
//  XiaoShouDingDanVC.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "XiaoShouDingDanVC.h"
#import "XiaoShouDingDanOneLevelCell.h"
#import "XiaoShouDingDanOneLevelCell_1.h"
#import "XiaoShouDingDanOneLevelCell_2.h"
#import "XiaoShouDingDanOneLevelCell_3.h"

#import "ModelMainTaoKe.h"
#import "ModelTaoKeSaleOrderCollection.h"

@interface XiaoShouDingDanVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *xiaoshouArray;
@property (nonatomic, strong) ModelTaoKeSaleOrderCollection *model;
@property (nonatomic, assign) NSInteger myindex;
@end

@implementation XiaoShouDingDanVC

-(NSMutableArray *)xiaoshouArray {
    if(_xiaoshouArray == nil) {
        _xiaoshouArray = [[NSMutableArray array]init];
    }
    return _xiaoshouArray;
}

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

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
    
    self.navigationItem.title = @"销售订单";
    
    [self requestGetTaoKeSaleOrderCollectionAction];
    [self drawView];
    [self updataCell];
}

-(void)requestGetTaoKeSaleOrderCollectionAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeSaleOrderCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeSaleOrderCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelMainTaoKe *model = [ModelMainTaoKe mj_objectWithKeyValues:responseObject];
        for(NSDictionary *dic in model.TaoKeSaleOrderCollection) {
            ModelTaoKeSaleOrderCollection *mo = [ModelTaoKeSaleOrderCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:mo];
        }
        
        
        [self.tableView reloadData];
        //[self updataCell];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}


- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.backgroundColor = HEXCOLOR(0xeeeeee);
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

- (void)updataCell
{
    self.cellsArray = [NSMutableArray array];
    
    for (int i = 0; i < self.dataArray.count; i ++)
    {
        ModelTaoKeSaleOrderCollection *model = self.dataArray[i];
        
//        if (i == 0)
//        {
//            NSMutableArray *array = [NSMutableArray array];
//            NSDictionary *dic1 = @{kCell:@"XiaoShouDingDanOneLevelCell",kValue:model};
//            NSDictionary *dic2 = @{kCell:@"XiaoShouDingDanOneLevelCell_1"};
//            NSDictionary *dic3 = @{kCell:@"XiaoShouDingDanOneLevelCell_2"};
//            NSDictionary *dic4 = @{kCell:@"XiaoShouDingDanOneLevelCell_3"};
//            [array addObject:dic1];
//            [array addObject:dic2];
//            [array addObject:dic3];
//            [array addObject:dic4];
//            [self.cellsArray addObject:array];
//        }
//        else
//        {
            NSMutableArray *array = [NSMutableArray array];
            NSDictionary *dic1 = @{kCell:@"XiaoShouDingDanOneLevelCell",kValue:model};
            [array addObject:dic1];
            [self.cellsArray addObject:array];
        }
//    }
    
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
    //NSArray *array = self.cellsArray[section];
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *array = self.cellsArray[indexPath.section];
//    NSDictionary *dic = array[indexPath.row];
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell"])
//    {
        XiaoShouDingDanOneLevelCell *cell = [XiaoShouDingDanOneLevelCell cellWithTableView:tableView];
        cell.model = self.dataArray[indexPath.row];
    
    if(self.xiaoshouArray.count) {
        if(indexPath.row == self.myindex) {
            cell.model2 = self.xiaoshouArray[0];
        }
    }
        return cell;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_1"])
//    {
//        XiaoShouDingDanOneLevelCell_1 *cell = [XiaoShouDingDanOneLevelCell_1 cellWithTableView:tableView];
//        return cell;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_2"])
//    {
//        XiaoShouDingDanOneLevelCell_2 *cell = [XiaoShouDingDanOneLevelCell_2 cellWithTableView:tableView];
//        return cell;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_3"])
//    {
//        XiaoShouDingDanOneLevelCell_3 *cell = [XiaoShouDingDanOneLevelCell_3 cellWithTableView:tableView];
//        return cell;
//    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *array = self.cellsArray[indexPath.section];
//    NSDictionary *dic = array[indexPath.row];
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell"])
//    {
//        return 65;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_1"])
//    {
//        return 35;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_2"])
//    {
//        return 80;
//    }
//    
//    if ([dic[kCell] isEqualToString:@"XiaoShouDingDanOneLevelCell_3"])
//    {
//        return 75;
//    }
    
    ModelTaoKeSaleOrderCollection *model = self.dataArray[indexPath.row];
    if(model.IsClearing) {
        return 65+35+80+75;
    }
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ModelTaoKeSaleOrderCollection *model = self.dataArray[indexPath.row];
    self.model.IsClearing = NO;
    model.IsClearing = YES;
    self.model = model;
    
    self.myindex = indexPath.row;
    NSLog(@"===========>%ld",(long)self.myindex);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeSaleOrderDetailResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeSaleOrderDetailAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:model.Guid forKey:@"SaleOrderGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.xiaoshouArray = [NSMutableArray array];
        ModelMainTaoKe *model = [ModelMainTaoKe mj_objectWithKeyValues:responseObject];
        [self.xiaoshouArray addObject:model.TaoKeSaleOrderDetail];
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

    
}

@end
