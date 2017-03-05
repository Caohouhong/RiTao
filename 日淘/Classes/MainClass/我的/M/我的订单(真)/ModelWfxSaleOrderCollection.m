//
//  ModelWfxSaleOrderCollection.m
//  日淘
//
//  Created by 唐硕 on 17/1/13.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelWfxSaleOrderCollection.h"
#import "ModelSaleOrderGoodsDetailCollection.h"

@implementation ModelWfxSaleOrderCollection


+(NSDictionary *)mj_objectClassInArray {
    return @{@"SaleOrderGoodsDetailCollection" : [ModelSaleOrderGoodsDetailCollection class]};
}

@end
