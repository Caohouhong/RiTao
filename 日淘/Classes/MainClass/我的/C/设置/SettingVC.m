//
//  SettingVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettingVC.h"
#import "SettingCell.h"
#import "PersonalXinXiVC.h"
#import "AuthenticationVC.h"
#import "ReceiptAddressVC.h"

@interface SettingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellArray;
@end

@implementation SettingVC

-(NSMutableArray *)cellArray {
    if(_cellArray == nil) {
        _cellArray = [[NSMutableArray alloc]init];
    }
    return _cellArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self initView];
    [self upDataCells];
}

-(void)initView {
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.tableFooterView = [self footerView];
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
    
}

-(UIView *)footerView {
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    
    UIButton *button = [UIButton createButtonWithTitle:@"退出当前账号" titleColor:[UIColor redColor] font:14 target:self action:@selector(outLigon)];
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.cornerRadius = 5;
    [footView addSubview:button];
    
    button.sd_layout
    .leftSpaceToView(footView,10)
    .rightSpaceToView(footView,10)
    .topSpaceToView(footView,10)
    .heightIs(35);
    
    return footView;
}

-(void)upDataCells {
    
    self.cellArray = [NSMutableArray array];
    
    NSMutableArray *arr1 = [NSMutableArray array];
    NSDictionary *dic1_1 = @{kCell:@"SettingProductCell",kTitle:@"个人信息"};
    NSDictionary *dic1_2 = @{kCell:@"SettingProductCell",kTitle:@"我的实名认证"};
    NSDictionary *dic1_3 = @{kCell:@"SettingProductCell",kTitle:@"我的收获地址"};
    NSDictionary *dic1_4 = @{kCell:@"SettingProductCell",kTitle:@"消息推送设置"};
    NSDictionary *dic1_5 = @{kCell:@"SettingProductCell",kTitle:@"消除缓存"};
    [arr1 addObject:dic1_1];
    [arr1 addObject:dic1_2];
    [arr1 addObject:dic1_3];
    [arr1 addObject:dic1_4];
    [arr1 addObject:dic1_5];
    
    NSMutableArray *arr2 = [NSMutableArray array];
    NSDictionary *dic2_1 = @{kCell:@"SettingProductCell",kTitle:@"版本号",kType:VERSION_CODE};
    [arr2 addObject:dic2_1];
    
    
    [self.cellArray addObject:arr1];
    [self.cellArray addObject:arr2];
    
    [self.tableView reloadData];
}

-(void)outLigon {
    NSLog(@"踢出");
}


#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 5;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SettingCell *cell = [SettingCell cellWithTableview:tableView];
    cell.nameLabel.text = titleArray[indexPath.section][indexPath.row];
    if(indexPath.section == 1) {
        cell.versionLabel.text = @"V3.3.1";
    }
    return cell;
;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            PersonalXinXiVC *perVC = [[PersonalXinXiVC alloc]init];
            [self.navigationController pushViewController:perVC animated:YES];
        }
        if (indexPath.row == 1) {
            AuthenticationVC *vc = [[AuthenticationVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 2) {
            ReceiptAddressVC *vc = [[ReceiptAddressVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
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
