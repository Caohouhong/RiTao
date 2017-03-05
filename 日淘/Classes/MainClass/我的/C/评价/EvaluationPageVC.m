//
//  EvaluationPageVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/23.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationPageVC.h"
#import "EvaluationPageHeadCell.h"
#import "EvaluationPageProductCell.h"
#import "ProductCommentCell.h"

@interface EvaluationPageVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellArrays;
@end

@implementation EvaluationPageVC

-(NSMutableArray *)cellArrays {
    if(_cellArrays == nil) {
        _cellArrays = [NSMutableArray array];
    }
    return _cellArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"小伙伴们说";
    
    
    [self requestGetAssessmentCollectionAction];
    [self initView];
    [self updataCells];
    
}

-(void)requestGetAssessmentCollectionAction {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetAssessmentCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetAssessmentCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"00000000-0000-0000-0000-000000000000" forKey:@"SaleOrderID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
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
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}


-(void)updataCells {
    self.cellArrays = [[NSMutableArray alloc]init];
    
    [self.cellArrays addObject:@{kCell:@"EvaluationPageHeadCell"}];
    
    [self.cellArrays addObject:@{kCell:@"EvaluationPageProductCell"}];
    [self.cellArrays addObject:@{kCell:@"EvaluationPageProductCell"}];
    
    [self.tableView reloadData];
}


#pragma mark - tableView 代理和数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArrays.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellArrays[indexPath.row];
    if([dic[kCell]isEqualToString:@"EvaluationPageHeadCell"]) {
        EvaluationPageHeadCell *cell = [EvaluationPageHeadCell cellWithTableview:tableView];
        return cell;
    }
    if([dic[kCell]isEqualToString:@"EvaluationPageProductCell"]) {
        EvaluationPageProductCell *cell = [EvaluationPageProductCell cellWithTableview:tableView];
        return cell;
    }
    return [UITableViewCell new];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cellArrays[indexPath.row];
    if([dic[kCell]isEqualToString:@"EvaluationPageHeadCell"]) {
        return 70;
    }
    if([dic[kCell]isEqualToString:@"EvaluationPageProductCell"]) {
//        return [tableView cellHeightForIndexPath:indexPath model: dic[kValue] keyPath:@"model" cellClass:[EvaluationPageProductCell class] contentViewWidth:ScreenWidth];
        return 250;
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
