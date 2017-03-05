//
//  AddressPickView.m
//  编辑地址
//
//  Created by 唐硕 on 16/6/24.
//  Copyright © 2016年 唐硕. All rights reserved.
//

#import "AddressPickView.h"
//#import "UIViewExt.h"
#import "ModelCityCollection.h"
#import "AddressModel.h"
#import "ModelCityCollection.h"
#import "ModelDistrictCollection.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define navigationViewHeight 44.0f
#define pickViewViewHeight 200.0f
#define buttonWidth 60.0f

@interface AddressPickView ()

@property (nonatomic, strong) NSArray *areaDic;


@property (nonatomic, assign) NSInteger proIndex;
@property (nonatomic, assign) NSInteger cityIndex;
@property (nonatomic, assign) NSInteger districtIndex;

@property (nonatomic, strong) NSString *selectedProvince;

@property(nonatomic,strong)UIView *bottomView;//包括导航视图和地址选择视图
@property(nonatomic,strong)UIPickerView *pickView;//地址选择视图

@end

@implementation AddressPickView

+ (instancetype)shareInstance
{
    static AddressPickView *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[AddressPickView alloc] init];
    });
    
    [shareInstance showBottomView];
    return shareInstance;
}


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self _addTapGestureRecognizerToSelf];
        [self _getPickerData];
        [self _createView];
    }
    return self;
  
}
#pragma mark - get data
- (void)_getPickerData
{
//    _province = [NSMutableArray array];
//    _city = [NSMutableArray array];
//    _district = [NSMutableArray array];
//    
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
//    self.areaDic = [[NSArray alloc]initWithContentsOfFile:path];
//
//    
//    for (NSDictionary *dict in _areaDic) {
//        [_province addObject:[[dict allKeys] firstObject]];
//    }
//    if (!_province.count) {
//        NSLog(@"卧槽，你连数据都没有，你也敢来调用");
//    }
//
//    for (NSDictionary *dci in self.areaDic) {
//        
//        if ([dci objectForKey:_province[_proIndex]]) {
//            _city = [NSMutableArray arrayWithArray:[[dci objectForKey:_province[_proIndex]] allKeys]];
//            
//            [_pickView reloadComponent:1];
//            [_pickView selectRow:0 inComponent:1 animated:YES];
//            
//            //NSLog(@"%@",[[dci objectForKey:_province[_proIndex]] objectForKey:_city[0]]);
//            
//            _district = [NSMutableArray arrayWithArray:[[dci objectForKey:_province[_proIndex]] objectForKey:_city[0]]];
//            [_pickView reloadComponent:2];
//            [_pickView selectRow:0 inComponent:2 animated:YES];
//        }
//    }
}



-(void)_addTapGestureRecognizerToSelf
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenBottomView)];
    [self addGestureRecognizer:tap];
}
-(void)_createView
{
    
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(10, kScreenHeight, kScreenWidth-20, navigationViewHeight+pickViewViewHeight)]; //44+200
    _bottomView.backgroundColor = [UIColor whiteColor];
    _bottomView.layer.masksToBounds = YES;
    _bottomView.layer.cornerRadius = 5;
    [self addSubview:_bottomView];

    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, _bottomView.frame.size.width, pickViewViewHeight)];
    _pickView.backgroundColor = [UIColor whiteColor];
    _pickView.dataSource = self;
    _pickView.delegate =self;
    [_bottomView addSubview:_pickView];
    
    NSArray *buttonTitleArray = @[@"取消",@"确定"];
    for (int i = 0; i <buttonTitleArray.count ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(i*_bottomView.frame.size.width/2, pickViewViewHeight, _bottomView.frame.size.width/2, navigationViewHeight);
        [button setTitle:buttonTitleArray[i] forState:UIControlStateNormal];
        [_bottomView addSubview:button];
        
        button.tag = i;
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [_bottomView addSubview:lineView];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = COLOR_LineViewColor;
    [_bottomView addSubview:lineView1];
    
    lineView.sd_layout
    .bottomSpaceToView(_bottomView,44)
    .leftSpaceToView(_bottomView,0)
    .rightSpaceToView(_bottomView,0)
    .heightIs(0.8);
    
    lineView1.sd_layout
    .leftSpaceToView(_bottomView,ScreenWidth/2)
    .bottomSpaceToView(_bottomView,0)
    .heightIs(44).widthIs(0.8);

    
}
-(void)tapButton:(UIButton*)button
{
    //点击确定回调block
    if (button.tag == 1) {
        ModelProvinceCollection *model1 = self.provinceArray[[_pickView selectedRowInComponent:0]];
        NSString *province = model1.Name;
        NSString *provinceid = model1.Guid;
        ModelCityCollection *model2 = self.cityArray[[_pickView selectedRowInComponent:1]];
        NSString *city = model2.Name;
        NSString *cityid = model2.Guid;
        ModelDistrictCollection *model3 = self.districtArray[[_pickView selectedRowInComponent:2]];
        NSString *town = model3.Name;
        NSString *townid = model3.Guid;
//        NSString *province = [self.province objectAtIndex:[_pickView selectedRowInComponent:0]];
//        NSString *city = [self.city objectAtIndex:[_pickView selectedRowInComponent:1]];
//        NSString *town = [self.district objectAtIndex:[_pickView selectedRowInComponent:2]];
        
        _block(province,provinceid,city,cityid,town,townid);
    }
    
    [self hiddenBottomView];
    


    
}
-(void)showBottomView
{
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.top = kScreenHeight-navigationViewHeight-pickViewViewHeight-64;
    } completion:^(BOOL finished) {

    }];
}
-(void)hiddenBottomView
{
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.top = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

-(void)setProvinceArray:(NSMutableArray *)provinceArray {
    _provinceArray = provinceArray;
    
    self.cityArray = [NSMutableArray array];
    self.districtArray = [NSMutableArray array];
    
     [self requestGetCityCollectionAction:provinceArray];
}


-(void)requestGetCityCollectionAction:(NSMutableArray *)cityArray {
    
    ModelProvinceCollection *model = cityArray[_proIndex];
    NSLog(@"----proIndex-------%ld", (long)_proIndex);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCityCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCityCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"ProvinceGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [self.cityArray removeAllObjects];
        [self.districtArray removeAllObjects];
        
        AddressModel * citymodel = [AddressModel mj_objectWithKeyValues:responseObject];
        
        for (NSDictionary *dic in citymodel.CityCollection) {
            ModelCityCollection *addressmodel = [ModelCityCollection mj_objectWithKeyValues:dic];
            [self.cityArray addObject:addressmodel];
        }

        [_pickView reloadComponent:1];
        [_pickView selectRow:0 inComponent:1 animated:YES];
        [_pickView reloadComponent:2];
        
        [self requestGetDistrictCollectionAction:self.cityArray];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}

-(void)requestGetDistrictCollectionAction:(NSMutableArray *)districtArray {
    
    if(!districtArray.count) {
        [self.districtArray removeAllObjects];
        return;
    }
    
    ModelCityCollection *model = districtArray[_cityIndex];
    NSLog(@"---cityIndex--------%ld", (long)_cityIndex);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetDistrictCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetDistrictCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"CityGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [self.districtArray removeAllObjects];
        
        AddressModel * citymodel = [AddressModel mj_objectWithKeyValues:responseObject];
        
        for (NSDictionary *dic in citymodel.DistrictCollection) {
            ModelDistrictCollection *addressmodel = [ModelDistrictCollection mj_objectWithKeyValues:dic];
            [self.districtArray addObject:addressmodel];
        }
        
        [_pickView reloadComponent:2];
        [_pickView selectRow:0 inComponent:2 animated:YES];

        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}

#pragma mark - UIPicker Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return _districtArray.count;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component  {
    if(component == 0) {
        return [_provinceArray objectAtIndex:row];
    }else if (component == 1) {
        return [_cityArray objectAtIndex:row];
    }else {
        return [_districtArray objectAtIndex:row];
    }
    return nil;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *lable=[[UILabel alloc]init];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.font=[UIFont systemFontOfSize:16.0f];
    if (component == 0) {
        ModelProvinceCollection *model = self.provinceArray[row];
        lable.text = model.Name;
    } else if (component == 1) {
        ModelCityCollection *citymodel = self.cityArray[row];
        lable.text = citymodel.Name;
    } else {
        ModelDistrictCollection *model = self.districtArray[row];
        lable.text = model.Name;
    }
    return lable;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        _proIndex = row;
        _cityIndex = 0;
        _districtIndex = 0;
        [self requestGetCityCollectionAction:self.provinceArray];
    }
    if (component == 1) {
        _cityIndex = row;
        _districtIndex = 0;
        [self requestGetDistrictCollectionAction:self.cityArray];
    }
    if (component == 2) {
        _districtIndex = row;
    }

}


@end
