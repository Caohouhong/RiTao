//
//  AddressModel.m
//  日淘
//
//  Created by 唐硕 on 17/1/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "AddressModel.h"
#import "AddReceiptAddressModel.h"
#import "ModelProvinceCollection.h"
#import "ModelCityCollection.h"
#import "ModelDistrictCollection.h"

@implementation AddressModel

+(NSDictionary *)mj_objectClassInArray {
    return  @{@"MemberAddressesCollection" : [AddReceiptAddressModel class],
              @"ProvinceCollection" : [ModelProvinceCollection class],
              @"CityCollection" : [ModelCityCollection class],
              @"DistrictCollection" : [ModelDistrictCollection class]};
}



@end
