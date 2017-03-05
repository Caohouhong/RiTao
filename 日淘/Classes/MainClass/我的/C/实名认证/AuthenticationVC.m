//
//  AuthenticationVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AuthenticationVC.h"
#import "AuthenticationCell.h"
#import "ModelIDCardCollection.h"
#import "AddRealNameVC.h"

@interface AuthenticationVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AuthenticationVC

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"实名认证";
    
    [self setNav];
    [self initView];
    [self requestData];
}

-(void)setNav {
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"添加" target:self action:@selector(clickAdd)];
    
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.tableFooterView = [self footView];
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}

-(UIView *)footView {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    
    UIButton *addNewBtn = [[UIButton alloc]init];
    [addNewBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [addNewBtn setTitle:@"添加实名信息" forState:UIControlStateNormal];
    addNewBtn.titleLabel.font = TFont(14.0);
    addNewBtn.layer.borderColor = [UIColor redColor].CGColor;
    addNewBtn.layer.borderWidth = 1.0;
    addNewBtn.layer.cornerRadius = 3.0;
    [addNewBtn addTarget:self action:@selector(AddAuthenticationBtn) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:addNewBtn];
    
    addNewBtn.sd_layout
    .leftSpaceToView(footerView,15)
    .rightSpaceToView(footerView,15)
    .topSpaceToView(footerView,15)
    .heightIs(40);
    
    return footerView;
}

-(void)AddAuthenticationBtn {
    
    AddRealNameVC *vc = [[AddRealNameVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickAdd {
    AddRealNameVC *vc = [[AddRealNameVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberCustomClearCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberCustomClearCollectionAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        
        LQModelIDCardCollection *lqModelIDCardCollection = [LQModelIDCardCollection mj_objectWithKeyValues:responseObject];
        self.dataArray = [NSMutableArray arrayWithArray:lqModelIDCardCollection.IDCardCollection];
        
        for (ModelIDCardCollection *model in self.dataArray)
        {
            if ([model.Guid isEqualToString:lqModelIDCardCollection.DefaultMemberCustomClearIDCardGuid])
            {
                model.moRen = YES;
            }else{
                model.moRen = NO;
            }
        }
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AuthenticationCell *cell = [AuthenticationCell cellWithTableview:tableView];
    cell.model = self.dataArray[indexPath.section];
    
    __weak typeof(self) WeakSelf = self;
    cell.removeBlock = ^(ModelIDCardCollection *model) {
        [WeakSelf requestDeleteMemberData:model];
    };

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isFromSettlementCenterVC)
    {
        if (self.didChooseAuthenticationBlock)
        {
            self.didChooseAuthenticationBlock(self.dataArray[indexPath.section]);
            [DCURLRouter popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - 删除数据
- (void)requestDeleteMemberData:(ModelIDCardCollection *)model
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteMemberCustomClearResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteMemberCustomClearAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.ID forKey:@"IDCard"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        
        [self requestData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

//#pragma mark - 设为默认
//- (void)requestDeleteMemberData:(ModelIDCardCollection *)model
//{
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteMemberCustomClearResult" forKey:@"ResultType"];
//    [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteMemberCustomClearAction" forKey:@"Action"];
//    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
//    [params setValue:AppID forKey:@"AppID"];
//    [params setValue:model.Guid forKey:@"IDCard"];
//    
//    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
//        
//        
//        [self requestData];
//        
//    } successBackfailError:^(id responseObject) {
//        
//    } failure:^(NSError *error) {
//        
//    }];
//}



@end
