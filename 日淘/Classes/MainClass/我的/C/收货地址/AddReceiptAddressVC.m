//
//  AddReceiptAddressVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AddReceiptAddressVC.h"
#import "AddReceiptAddressCell.h"
#import "AddReceiptAddressModel.h"
#import "AddressPickView.h"
#import "ModelIDCardInfo.h"
#import "ModelProvinceCollection.h"
#import "AddressModel.h"
#import "ModelCityCollection.h"


@interface AddReceiptAddressVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) AddReceiptAddressModel *model;
@property (nonatomic, strong) NSMutableArray *ProvinceArray;
@property (nonatomic, strong) NSString *addressName;

@end

@implementation AddReceiptAddressVC

-(NSMutableArray *)ProvinceArray {
    if(_ProvinceArray == nil) {
        _ProvinceArray = [NSMutableArray array];
    }
    return _ProvinceArray;
}

-(AddReceiptAddressModel *)model {
    if(_model == nil) {
        _model = [[AddReceiptAddressModel alloc]init];
        _model.IDCardInfo = [[ModelIDCardInfo alloc]init];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置";
    [self setNav];
    [self initView];
    [self requestGetProvinceCollectionAction];
}

-(void)requestGetProvinceCollectionAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetProvinceCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetProvinceCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"" success:^(id responseObject) {
        
        AddressModel *model = [AddressModel mj_objectWithKeyValues:responseObject];
        
        for(NSDictionary *dic in model.ProvinceCollection) {
            ModelProvinceCollection *addressmodel = [ModelProvinceCollection mj_objectWithKeyValues:dic];
            [self.ProvinceArray addObject:addressmodel];
        }
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)setNav {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" target:self action:@selector(sava)];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}

-(void)sava {
   
    if(!self.model.IDCardInfo.Name.length) {
        [LCProgressHUD showFailure:@"请输入姓名"];
        return;
    }
    if(!self.model.MobilePhone.length) {
        [LCProgressHUD showFailure:@"请输入手机号码"];
        return;
    }
    if(!self.model.IDCardInfo.Province.length) {
        [LCProgressHUD showFailure:@"请输入省市区"];
        return;
    }
    if(!self.model.IDCardInfo.Address.length) {
        [LCProgressHUD showFailure:@"请输入详细地址"];
        return;
    }
    
    
    AddReceiptAddressModel *model = self.model;
    model.IDCardInfo.Guid = @"00000000-0000-0000-0000-000000000000";
    model.Guid = @"00000000-0000-0000-0000-000000000000";
    model.MemberGuid = @"cced1f94-426a-4ebc-b773-f306524f0d6a";
    NSDictionary *dic = model.mj_keyValues;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Json.JsonResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddMemberAddressAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:dic forKey:@"MemberAddress"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
  
        [self.navigationController popViewControllerAnimated:YES];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - tableView 代理和数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddReceiptAddressCell *cell = [AddReceiptAddressCell cellWithTableview:tableView];
    cell.nameLabel.text = titleArray[indexPath.row];
    cell.textfield.placeholder = placeholderArray[indexPath.row];
    if(indexPath.row == 2) {
        cell.textfield.text = self.addressName;
    }
    if(indexPath.row == 4) {
        cell.textfield.text = @"每次下单默认使用该地址";
        cell.textfield.userInteractionEnabled = NO;
        cell.switchBtn.hidden = NO;
    }
    cell.model = self.model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 2) {
        
        [self.view endEditing:YES];
        
        AddressPickView *addressPickView = [AddressPickView shareInstance];
        addressPickView.provinceArray = self.ProvinceArray;
        [self.view addSubview:addressPickView];

        __weak typeof(self) weakSelf = self;
        addressPickView.block = ^(NSString *province,NSString *provinceid,NSString *city,NSString *cityid,NSString *town,NSString *townid){
            weakSelf.model.IDCardInfo.Province = provinceid;
            weakSelf.model.IDCardInfo.City = cityid;
            weakSelf.model.IDCardInfo.District = townid;
            weakSelf.addressName = [NSString stringWithFormat:@"%@ %@ %@",province,city,town];
            
            [weakSelf.tableView reloadData];
        };
    }
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
