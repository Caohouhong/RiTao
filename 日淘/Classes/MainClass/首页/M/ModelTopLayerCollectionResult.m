//
//  ModelTopLayerCollectionResult.m
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelTopLayerCollectionResult.h"
#import "ModelTopLayerCollection.h"
#import "ModelMasterSaleProductCollection.h"

@implementation ModelTopLayerCollectionResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"TopLayerCollection":[ModelTopLayerCollection class]};
}

//+ (NSDictionary *)mj_objectClassInArray
//{
//    return @{@"children":@"ModelProductCategory"};
//}

@end
