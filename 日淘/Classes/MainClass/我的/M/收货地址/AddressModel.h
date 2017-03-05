//
//  AddressModel.h
//  日淘
//
//  Created by 唐硕 on 17/1/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "BaseModel.h"
@class AddReceiptAddressModel;

@interface AddressModel : BaseModel

@property (nonatomic, strong) NSArray *MemberAddressesCollection;
@property (nonatomic, strong) NSArray *ProvinceCollection;
@property (nonatomic, strong) NSArray *CityCollection;
@property (nonatomic, strong) NSArray *DistrictCollection;

@end
