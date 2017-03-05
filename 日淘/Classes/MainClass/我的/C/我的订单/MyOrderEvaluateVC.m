//
//  MyOrderEvaluateVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyOrderEvaluateVC.h"
#import "MyOrderEvaluateCell.h"
#import "EvaluationVC.h"
#import "ModelMainWoOrder.h"
#import "ModelWfxSaleOrderCollection.h"
#import "ModelSaleOrderGoodsDetailCollection.h"

@interface MyOrderEvaluateVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MyOrderEvaluateVC

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    [self requestGetSaleOrderCollectionAction];
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
        
        for(NSDictionary *dic in model.WfxSaleOrderCollection)
        {
            ModelWfxSaleOrderCollection *salemodel  = [ModelWfxSaleOrderCollection mj_objectWithKeyValues:dic];
            for (ModelSaleOrderGoodsDetailCollection *modelmodel in salemodel.SaleOrderGoodsDetailCollection)
            {
                modelmodel.SaleOrderGuid = salemodel.SaleOrderGuid;
                [self.dataArray addObject:modelmodel];
            }
        }
        
        [self.tableView reloadData];
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
//    tableview.tableHeaderView = [self headerView];
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}

-(UIView *)headerView
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    
    UIImageView *iconimageview = [[UIImageView alloc]init];
    iconimageview.backgroundColor = [UIColor grayColor];
    [headView addSubview:iconimageview];
    
    iconimageview.sd_layout
    .leftSpaceToView(headView,0)
    .rightSpaceToView(headView,0)
    .topSpaceToView(headView,10)
    .bottomSpaceToView(headView,0);
    
    return headView;
}


#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyOrderEvaluateCell *cell = [MyOrderEvaluateCell cellWithTableview:tableView];
    cell.model = self.dataArray[indexPath.row];
    __weak typeof(self) WeakSelf = self;
    cell.shaidanBlock = ^(ModelSaleOrderGoodsDetailCollection *model) {
        EvaluationVC *evaVC = [[EvaluationVC alloc]init];
        evaVC.model = model;
        [WeakSelf.navigationController pushViewController:evaVC animated:YES];
        
        evaVC.didPingJiaSuccessBlock = ^(){
            [WeakSelf requestGetSaleOrderCollectionAction];
        };
        
    };
    return cell;
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


@end
