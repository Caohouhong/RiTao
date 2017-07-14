//
//  ReceiptAddressVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ReceiptAddressVC.h"
#import "ReceiptAddressCell.h"
#import "AddReceiptAddressVC.h"
#import "AddressModel.h"
#import "AddReceiptAddressModel.h"


@interface ReceiptAddressVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ReceiptAddressVC

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestGetMemberAddressCollectionForMemberAction];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"收货地址";
    
    [self setNav];
    [self initView];
   
}

-(void)requestGetMemberAddressCollectionForMemberAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberAddressCollectionForMemberResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberAddressCollectionForMemberAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        AddressModel *model = [AddressModel mj_objectWithKeyValues:responseObject];
        
        [self.dataArray removeAllObjects];
        
        for(NSDictionary *dic in model.MemberAddressesCollection) {
            AddReceiptAddressModel *addressmodel = [AddReceiptAddressModel mj_objectWithKeyValues:dic];
            [self.dataArray addObject:addressmodel];
        }
        
        [self.tableView reloadData];

    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
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
    [addNewBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
    addNewBtn.titleLabel.font = TFont(14.0);
    addNewBtn.layer.borderColor = [UIColor redColor].CGColor;
    addNewBtn.layer.borderWidth = 1.0;
    addNewBtn.layer.cornerRadius = 3.0;
    [addNewBtn addTarget:self action:@selector(NewAddressBtn) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:addNewBtn];
    
    addNewBtn.sd_layout
    .leftSpaceToView(footerView,15)
    .rightSpaceToView(footerView,15)
    .topSpaceToView(footerView,15)
    .heightIs(40);

    return footerView;
}

-(void)NewAddressBtn {
    AddReceiptAddressVC *addVC = [[AddReceiptAddressVC alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}

-(void)clickAdd {
    AddReceiptAddressVC *addVC = [[AddReceiptAddressVC alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}

-(void)DeleteMemberAddressAction:(AddReceiptAddressModel *)model {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Json.JsonResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteMemberAddressAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"MemberAddressGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {

        [self requestGetMemberAddressCollectionForMemberAction];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)SetMemberDefaultAddressAction:(AddReceiptAddressModel *)model {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Json.JsonResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.SetMemberDefaultAddressAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"MemberAddressGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [self requestGetMemberAddressCollectionForMemberAction];
        
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptAddressCell *cell = [ReceiptAddressCell cellWithTableview:tableView];
    cell.model = self.dataArray[indexPath.section];
    __weak typeof(self) WeakSelf = self;
    cell.removeBlock = ^(AddReceiptAddressModel *model) {
        [WeakSelf DeleteMemberAddressAction:model];
        [WeakSelf.tableView reloadData];
    };
    cell.selectedBlock = ^(AddReceiptAddressModel *model) {
        [WeakSelf SetMemberDefaultAddressAction:model];
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
        AddReceiptAddressModel *model = self.dataArray[indexPath.section];
        
        if (self.didChooseAddressBlock)
        {
            self.didChooseAddressBlock(model.Guid);
            [DCURLRouter popViewControllerAnimated:YES];
        }
    }
}

@end
