//
//  TopCategoryCollectionModel.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TopCategoryCollectionModel.h"
#import "TopLayerCollectionModel.h"
#import "CategoryCollectionModel.h"
#import "CommonUsageCategoryCollectionModel.h"
#import "HotUsageCategoryCollectionModel.h"

@implementation TopCategoryCollectionModel

+(NSDictionary *)mj_objectClassInArray {
    return @{@"TopLayerCollection" : [TopLayerCollectionModel class] ,
             @"CategoryCollection" : [CategoryCollectionModel class] ,
             @"CommonUsageCategoryCollection" : [CategoryCollectionModel class],
             @"HotUsageCategoryCollection" : [HotUsageCategoryCollectionModel class]};
   
}

@end
