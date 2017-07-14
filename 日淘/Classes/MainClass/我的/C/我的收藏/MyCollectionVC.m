//
//  MyCollectionVC.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyCollectionVC.h"
#import "MyCollectionCell.h"
#import "MyCollectiomMainModel.h"
#import "ModelMasterSaleProductCollection.h"
#import "MyCollectiomMainModel.h"
#import "ProductDetailsVC.h"

@interface MyCollectionVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) int StartIndex;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MyCollectionVC

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的收藏";
    
//    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightBar)];
//    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.StartIndex = 0;
    
    [self drawView];
    [self requestData];
}

- (void)drawView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
    tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}

- (void)headerRefersh
{
    self.StartIndex = 0;
    [self requestData];
}

- (void)footerRefersh
{
    self.StartIndex ++;
     [self requestData];
    
}

- (void)didClickRightBar
{

}



#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary  dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForFavoriteAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@(self.StartIndex) forKey:@"StartIndex"];
    [params setValue:@(10) forKey:@"Count"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        if(self.StartIndex == 0) {
            self.dataArray = [[NSMutableArray alloc]init];
        }

        MyCollectiomMainModel *model = [MyCollectiomMainModel mj_objectWithKeyValues:responseObject];
        for(NSDictionary *dic in model.MasterSaleProductCollection) {
            ModelMasterSaleProductCollection *mastmodel = [ModelMasterSaleProductCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:mastmodel];
        }
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } successBackfailError:^(id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionCell *cell = [MyCollectionCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelMasterSaleProductCollection *model = self.dataArray[indexPath.row];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.guid = model.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];

    
}

@end
