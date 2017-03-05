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

@interface TuiKuanTuiHuoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation TuiKuanTuiHuoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"退货/退款";
    
    [self drawView];
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
    
//    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}




#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TuiKuanTuiHuoCell *cell = [TuiKuanTuiHuoCell cellWithTableView:tableView];
        return cell;
    }
    
    if (indexPath.row == 1) {
        TuiKuanTuiHuoCell2 *cell = [TuiKuanTuiHuoCell2 cellWithTableView:tableView];
        return cell;
    }
    
    if (indexPath.row == 2) {
        TuiKuanTuiHuoCell3 *cell = [TuiKuanTuiHuoCell3 cellWithTableView:tableView];
        return cell;
    }
    
    return [UITableViewCell new];
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
    ShengQingTuiKuanVC *vc = [[ShengQingTuiKuanVC alloc] init];
    [DCURLRouter pushViewController:vc animated:YES];
    
}

@end
