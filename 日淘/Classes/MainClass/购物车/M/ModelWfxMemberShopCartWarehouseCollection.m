//
//  ModelWfxMemberShopCartWarehouseCollection.m
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelWfxMemberShopCartWarehouseCollection.h"
#import "ModelWfxMemberShopCartDeliveryCollection.h"


@implementation ModelWfxMemberShopCartWarehouseCollection

+(NSDictionary *)mj_objectClassInArray {
    return @{@"WfxMemberShopCartDeliveryCollection" : [ModelWfxMemberShopCartDeliveryCollection class]};
}

@end
