//
//  AddressPickView.h
//  编辑地址
//
//  Created by 唐硕 on 16/6/24.
//  Copyright © 2016年 唐硕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelProvinceCollection.h"
typedef void(^AdressBlock) (NSString *province,NSString *provinceid,NSString *city,NSString *cityid,NSString *town,NSString *townid);

@interface AddressPickView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,copy)AdressBlock block;


+ (instancetype)shareInstance;

@property (nonatomic, strong) NSMutableArray *provinceArray; //省
@property (nonatomic, strong) NSMutableArray *cityArray;     //市
@property (nonatomic, strong) NSMutableArray *districtArray; //区


@end
