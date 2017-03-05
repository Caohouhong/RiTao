//
//  ModelWfxMemberShopCartDeliveryCollection.m
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelWfxMemberShopCartDeliveryCollection.h"
#import "ModelWfxMemberShopCartSaleCouponCollection.h"

@implementation ModelWfxMemberShopCartDeliveryCollection


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"DeilveryDescription":@"DeliveryDescription"};
}

+(NSDictionary *)mj_objectClassInArray {
    return @{@"WfxMemberShopCartSaleCouponCollection" : [ModelWfxMemberShopCartSaleCouponCollection class]};
}

@end
