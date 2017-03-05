//
//  ModelMainProductList.m
//  日淘
//
//  Created by 唐硕 on 17/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelMainProductList.h"
#import "ModelCategoryCollection.h"
#import "ModelBrandCollection.h"
#import "ModelMasterSaleProductCollection.h"


@implementation ModelMainProductList


+(NSDictionary *)mj_objectClassInArray {
    return @{@"MasterSaleProductCollection" : [ModelMasterSaleProductCollection class],
             @"CategoryCollection" : [ModelCategoryCollection class],
             @"BrandCollection" : [ModelBrandCollection class]};
}

@end
