//
//  AddReceiptAddressCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AddReceiptAddressCell.h"
#import <CoreLocation/CoreLocation.h>
#import "ModelIDCardInfo.h"

@interface AddReceiptAddressCell()<CLLocationManagerDelegate,UIAlertViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *county;
@end
@implementation AddReceiptAddressCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"AddReceiptAddressCell";
    AddReceiptAddressCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[AddReceiptAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView {
    
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:0.5];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = TFont(14.0);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.font = TFont(14.0);
    textfield.delegate = self;
    [self.contentView addSubview:textfield];
    self.textfield = textfield;
    
    UIButton *positionBtn = [[UIButton alloc]init];
    positionBtn.hidden = YES;
    positionBtn.titleLabel.font = TFont(13);
    [positionBtn setTitle:@"定位" forState:UIControlStateNormal];
    [positionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [positionBtn setImage:GETIMAGE(@"dingwei") forState:UIControlStateNormal];
    positionBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    [positionBtn addTarget:self action:@selector(positioning) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:positionBtn];
    self.positionBtn = positionBtn;
    
    UIButton *switchBtn = [[UIButton alloc]init];
    switchBtn.hidden = YES;
    [switchBtn setImage:GETIMAGE(@"hole1") forState:UIControlStateNormal];
    [switchBtn setImage:GETIMAGE(@"hole2") forState:UIControlStateSelected];
    [switchBtn addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:switchBtn];
    self.switchBtn = switchBtn;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(80).heightIs(20);
    
    textfield.sd_layout
    .leftSpaceToView(nameLabel,0)
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView,10)
    .heightIs(20);
    
    positionBtn.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(60).heightIs(20);
    
    switchBtn.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(50).heightIs(25);

}

-(void)clickSwitch:(UIButton *)btn {
    btn.selected = !btn.selected;
    
    self.model.IsDefault = btn.selected;
}


-(void)positioning {
    
    if([CLLocationManager locationServicesEnabled]) {
        _locationManager = [[CLLocationManager alloc] init];
        
        [_locationManager requestWhenInUseAuthorization];
        
        _locationManager.delegate = self;
        
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        _locationManager.distanceFilter = 100.0f;
        
        [_locationManager startUpdatingLocation];
        
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"----温馨提示----" message:@"定位服务未开启，请进入系统【设置】>【隐私】>【定位服务】中打开开关，并允许日淘使用定位服务" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:@"立即开启", nil];
        [alert show];
    }

}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *toBeStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"--->%@",toBeStr);
    
    if ([self.nameLabel.text isEqualToString:titleArray[0]]) {
        self.model.IDCardInfo.Name = toBeStr;
    }
    if ([self.nameLabel.text isEqualToString:titleArray[1]]) {
        self.model.MobilePhone = toBeStr;
    }
    if ([self.nameLabel.text isEqualToString:titleArray[2]]) {
    }
    if ([self.nameLabel.text isEqualToString:titleArray[3]]) {
        self.model.IDCardInfo.Address = toBeStr;
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"-----%@",textField.text);
    if ([self.nameLabel.text isEqualToString:titleArray[0]]) {
        self.model.IDCardInfo.Name = textField.text;
    }
    if ([self.nameLabel.text isEqualToString:titleArray[1]]) {
        self.model.MobilePhone = textField.text;
    }
    if ([self.nameLabel.text isEqualToString:titleArray[2]]) {
        
    }
    if ([self.nameLabel.text isEqualToString:titleArray[3]]) {
        self.model.IDCardInfo.Address = textField.text;
    }
}



-(void)setModel:(AddReceiptAddressModel *)model {
    
    _model = model;
    
    if([self.nameLabel.text isEqualToString:titleArray[0]]) {
        self.textfield.placeholder = @"请输入收货人的姓名";
        self.textfield.text = model.IDCardInfo.Name;
    }
    if([self.nameLabel.text isEqualToString:titleArray[1]]) {
        self.textfield.placeholder = @"请输入收货人的手机号";
        self.textfield.text = model.MobilePhone;
    }
    if([self.nameLabel.text isEqualToString:titleArray[2]]) {
        self.textfield.userInteractionEnabled = NO;
        if (model.IDCardInfo.Name.length) {
            //self.textfield.text = [NSString stringWithFormat:@"%@ %@ %@",model.IDCardInfo.Province,model.IDCardInfo.City,model.IDCardInfo.District];
            //self.textfield.text = [NSString stringWithFormat:@"%@",model.IDCardInfo.Name];
        }
    }
    if([self.nameLabel.text isEqualToString:titleArray[3]]) {
        self.textfield.placeholder = @"请输入收货人的详细地址";
        self.textfield.text = model.IDCardInfo.Address;
    }
    if([self.nameLabel.text isEqualToString:titleArray[4]]) {
        self.textfield.text = @"每次下单默认使用该地址";
        self.textfield.userInteractionEnabled = NO;
        self.switchBtn.hidden = NO;
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation * curloc = [locations lastObject];
    CLLocationCoordinate2D coord = curloc.coordinate;
    NSLog(@"---------%f-----%f", coord.longitude, coord.latitude);
    [_locationManager stopUpdatingHeading];
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];//反编码
    [geoCoder reverseGeocodeLocation:curloc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error && placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            self.model.IDCardInfo.Province =  placeMark.administrativeArea;
            self.model.IDCardInfo.City = placeMark.locality;
            self.model.IDCardInfo.District = placeMark.subLocality;
            
            if ([self.nameLabel.text isEqualToString:titleArray[2]]) {
                self.textfield.text = [NSString stringWithFormat:@"%@ %@ %@", self.model.IDCardInfo.Province,self.model.IDCardInfo.City,self.model.IDCardInfo.District];;
            }
            NSLog(@"--%@--%@--%@",self.model.IDCardInfo.Province,self.model.IDCardInfo.City,self.model.IDCardInfo.District);
        } else  {
            [LCProgressHUD showFailure:@"定位失败"];
        }
    }];

}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [LCProgressHUD showSuccess:@"定位失败"];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        NSURL*url=[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
        [[UIApplication sharedApplication] openURL:url];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
