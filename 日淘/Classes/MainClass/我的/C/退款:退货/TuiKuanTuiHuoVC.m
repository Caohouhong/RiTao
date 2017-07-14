//
//  TuiKuanTuiHuoVC.m
//  日淘
//
//  Created by 李强 on 2017/2/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "TuiKuanTuiHuoVC.h"
#import "TuiKuanTuiHuoCell.h"
#import "TuiKuanTuiHuoCell2.h"
#import "TuiKuanTuiHuoCell3.h"
#import "ShengQingTuiKuanVC.h"
#import "TuiKuanJingDuVC.h"
#import "AfterSaleListModel.h"

@interface TuiKuanTuiHuoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) AfterSaleListModel *model;

@end

@implementation TuiKuanTuiHuoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"退货/退款";
    
    [self drawView];
    
    [self requestData];
}

- (void)drawView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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
}


#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.model.AfterSaleSheetCollection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TuiKuanTuiHuoCell *cell = [TuiKuanTuiHuoCell cellWithTableView:tableView];
        cell.model = self.model.AfterSaleSheetCollection[indexPath.section];
        return cell;
    }
    
    if (indexPath.row == 1) {
        TuiKuanTuiHuoCell2 *cell = [TuiKuanTuiHuoCell2 cellWithTableView:tableView];
        cell.model = self.model.AfterSaleSheetCollection[indexPath.section];
        return cell;
    }
    
    if (indexPath.row == 2) {
        TuiKuanTuiHuoCell3 *cell = [TuiKuanTuiHuoCell3 cellWithTableView:tableView];
        cell.model = self.model.AfterSaleSheetCollection[indexPath.section];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 45;
    }
    
    if (indexPath.row == 1) {
        return 90;
    }
    
    if (indexPath.row == 2) {
        return 60;
    }
    
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuiKuanJingDuVC *vc = [[TuiKuanJingDuVC alloc] init];
    
    vc.model = self.model.AfterSaleSheetCollection[indexPath.section];
    
    [DCURLRouter pushViewController:vc animated:YES];
    
}

#pragma mark - ===========网络==========
-(void)requestData {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberAfterSaleSheetCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberAfterSaleSheetCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.model = [AfterSaleListModel mj_objectWithKeyValues:responseObject];
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


@end
