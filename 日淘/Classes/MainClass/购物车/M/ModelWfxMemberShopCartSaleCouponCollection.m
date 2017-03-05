//
//  ModelWfxMemberShopCartSaleCouponCollection.m
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelWfxMemberShopCartSaleCouponCollection.h"
#import "ModelMemberShopCartDetailCollection.h"

@implementation ModelWfxMemberShopCartSaleCouponCollection

+(NSDictionary *)mj_objectClassInArray {
    return @{@"MemberShopCartDetailCollection" : [ModelMemberShopCartDetailCollection class]};
}

@end
