//
//  TaoKeCenterVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TaoKeCenterVC.h"
#import "TaoKeProductOneCell.h"
#import "TaoKeProductTwoCell.h"
#import "TaoKeProductThreeCell.h"
#import "PaymentDetailsVC.h"

#import "ModelMainTaoKe.h"

@interface TaoKeCenterVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) ModelMainTaoKe *model;
@end

@implementation TaoKeCenterVC

-(NSMutableArray *)cellArray {
    if(_cellArray == nil) {
        _cellArray = [[NSMutableArray alloc]init];
    }
    return _cellArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"淘客中心";

    [self requestGetMemberCenterAction];
    [self initNav];
    [self initView];
    [self upDataCells];
}

-(void)requestGetMemberCenterAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeCenterResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTaoKeCenterAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.model = [ModelMainTaoKe mj_objectWithKeyValues:responseObject];
        
        [self upDataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}


-(void)initNav {

    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithTitle:@"收支明细" style:UIBarButtonItemStylePlain target:self action:@selector(shouzhimingxi)];
    self.navigationItem.rightBarButtonItem = rightBar;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName, nil] forState:UIControlStateNormal];
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
    self.cellArray = [NSMutableArray array];
    
    NSDictionary *dic1_1 = @{kCell:@"TaoKeProductOneCell"};
    NSDictionary *dic1_2 = @{kCell:@"TaoKeProductTwoCell"};
    NSDictionary *dic1_3 = @{kCell:@"TaoKeProductThreeCell"};
    [self.cellArray addObject:dic1_1];
    [self.cellArray addObject:dic1_2];
    [self.cellArray addObject:dic1_3];

    [self.tableView reloadData];
}

-(void)shouzhimingxi {
    PaymentDetailsVC *mentVC = [[PaymentDetailsVC alloc]init];
    [self.navigationController pushViewController:mentVC animated:YES];
}

#pragma mark - tableView 代理和数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = self.cellArray[indexPath.row];
    if([dic[kCell] isEqualToString:@"TaoKeProductOneCell"]) {
        TaoKeProductOneCell *cell = [TaoKeProductOneCell cellWithTableview:tableView];
        cell.model = self.model.TaoKeCenter;
        return cell;
    }
    if([dic[kCell] isEqualToString:@"TaoKeProductTwoCell"]) {
        TaoKeProductTwoCell *cell = [TaoKeProductTwoCell cellWithTableview:tableView];
         cell.model = self.model.TaoKeCenter;
        return cell;
    }
    if([dic[kCell] isEqualToString:@"TaoKeProductThreeCell"]) {
        TaoKeProductThreeCell *cell = [TaoKeProductThreeCell cellWithTableview:tableView];
         cell.model = self.model.TaoKeCenter;
        return cell;
    }
    return [UITableViewCell new];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellArray[indexPath.row];
    if([dic[kCell] isEqualToString:@"TaoKeProductOneCell"]) {
        return 90;
    }
    if([dic[kCell] isEqualToString:@"TaoKeProductTwoCell"]) {
        return 180;
    }
    if([dic[kCell] isEqualToString:@"TaoKeProductThreeCell"]) {
        return 90;
    }
    return 0;
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
