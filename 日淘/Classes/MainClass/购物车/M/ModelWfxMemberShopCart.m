//
//  ModelWfxMemberShopCart.m
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelWfxMemberShopCart.h"
#import "ModelWfxMemberShopCartWarehouseCollection.h"
#import "ModelWfxShopCartSuggestionSaleProductCollection.h"
#import "ModelMasterSaleProductCollection.h"

@implementation ModelWfxMemberShopCart


+(NSDictionary *)mj_objectClassInArray {
    return @{@"WfxMemberShopCartWarehouseCollection": [ModelWfxMemberShopCartWarehouseCollection class],
             @"WfxShopCartSuggestionSaleProductCollection": [ModelMasterSaleProductCollection class]};
}


@end
