//
//  MyOrderVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyOrderVC.h"
#import "OrderFootCell.h"
#import "OrderHeadCell.h"
#import "OrderProductCell.h"
#import "NinaPagerView.h"
#import "ModelMainWoOrder.h"
#import "ModelWfxSaleOrderCollection.h"
#import "ModelSaleOrderGoodsDetailCollection.h"
#import "OrderDetailsVC.h"

@interface MyOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) NinaPagerView * ninaPagerView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MyOrderVC

-(NSMutableArray *)cellsArray {
    if(!_cellsArray) {
        _cellsArray = [[NSMutableArray alloc]init];
    }
    return _cellsArray;
}

-(NSMutableArray *)dataArray {
    if(!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initView];
    [self requestGetSaleOrderCollectionAction];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickSOSUO:) name:@"sousuo111" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)clickSOSUO:(NSNotification *)obj {
    NSLog(@"------%@", obj.object);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleOrderCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleOrderCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.guid forKey:@"SearchOrderState"];
    [params setValue:obj.object forKey:@"SearchContent"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelMainWoOrder *model = [ModelMainWoOrder mj_objectWithKeyValues:responseObject];
        
        self.dataArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *dic in model.WfxSaleOrderCollection) {
            ModelWfxSaleOrderCollection *salemodel  = [ModelWfxSaleOrderCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:salemodel];
        }
        
        [self updataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)requestGetSaleOrderCollectionAction {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleOrderCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleOrderCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.guid forKey:@"SearchOrderState"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
    
        ModelMainWoOrder *model = [ModelMainWoOrder mj_objectWithKeyValues:responseObject];
        
        self.dataArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *dic in model.WfxSaleOrderCollection) {
            ModelWfxSaleOrderCollection *salemodel  = [ModelWfxSaleOrderCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:salemodel];
        }
        
        [self updataCells];
       
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,44);
}

-(void)updataCells {
    
    self.cellsArray = [NSMutableArray array];
    
    for(ModelWfxSaleOrderCollection *model in self.dataArray) {
        NSMutableArray *arry = [NSMutableArray array];
        NSDictionary *dic1_1 = @{kCell:@"OrderHeadCell",kValue:model};
        [arry addObject:dic1_1];
        
        for(ModelSaleOrderGoodsDetailCollection *ordermodel in model.SaleOrderGoodsDetailCollection) {
            NSDictionary *dic1_2 = @{kCell:@"OrderProductCell",kValue:ordermodel};
            [arry addObject:dic1_2];
        }
        
        NSDictionary *dic1_3 = @{kCell : @"OrderFootCell",kValue:model};
        [arry addObject:dic1_3];
        [self.cellsArray addObject:arry];
    }
    
//    NSMutableArray *arry1 = [NSMutableArray array];
//    NSDictionary *dic1_1 = @{kCell : @"OrderHeadCell"};
//    NSDictionary *dic1_2 = @{kCell : @"OrderProductCell"};
//    NSDictionary *dic1_3 = @{kCell : @"OrderProductCell"};
//    NSDictionary *dic1_4 = @{kCell : @"OrderFootCell"};
//    [arry1 addObject:dic1_1];
//    [arry1 addObject:dic1_2];
//    [arry1 addObject:dic1_3];
//    [arry1 addObject:dic1_4];
//    [self.cellsArray addObject:arry1];
//    
//    NSMutableArray *arry2 = [NSMutableArray array];
//    NSDictionary *dic2_1 = @{kCell : @"OrderHeadCell"};
//    NSDictionary *dic2_2 = @{kCell : @"OrderProductCell"};
//    NSDictionary *dic2_3 = @{kCell : @"OrderFootCell"};
//    [arry2 addObject:dic2_1];
//    [arry2 addObject:dic2_2];
//    [arry2 addObject:dic2_3];
//    [self.cellsArray addObject:arry2];
    
    [self.tableView reloadData];
    
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellsArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *arr = self.cellsArray[section];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if([dic[kCell] isEqualToString:@"OrderHeadCell"]) {
        OrderHeadCell *cell = [OrderHeadCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell] isEqualToString:@"OrderProductCell"]) {
        OrderProductCell *cell = [OrderProductCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    if([dic[kCell] isEqualToString:@"OrderFootCell"]) {
        OrderFootCell *cell = [OrderFootCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        
        __weak typeof(self) weakSelf = self;
        cell.cancleOrderSuccessBlock = ^(){
            [weakSelf requestGetSaleOrderCollectionAction];
        };
        
        return cell;
    }
    return [UITableViewCell new];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if([dic[kCell] isEqualToString:@"OrderHeadCell"]) {
        return 40;
    }
    if([dic[kCell] isEqualToString:@"OrderProductCell"]) {
        return 70;
    }
    if([dic[kCell] isEqualToString:@"OrderFootCell"]) {
        return 70;
    }
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array.lastObject;
    ModelWfxSaleOrderCollection *model = dic[kValue];
    
    OrderDetailsVC *vc = [[OrderDetailsVC alloc] init];
    vc.SaleOrderGuid = model.SaleOrderGuid;
    [DCURLRouter pushViewController:vc animated:YES];

}

@end
