//
//  ModelTopicCollectionResult.m
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelTopicCollectionResult.h"
#import "ModelMasterSaleProductCollection.h"
#import "ModelHotCategoryCollection.h"

@implementation ModelTopicCollectionResult

+ (NSDictionary *)mj_objectClassInArray
{
    //return @{@"TopLayerCollection":@"ModelTopicCollection"};
    return @{@"MasterSaleProductCollection" : [ModelMasterSaleProductCollection class],
             @"CategoryCollection" : [ModelHotCategoryCollection class]};
}

@end
