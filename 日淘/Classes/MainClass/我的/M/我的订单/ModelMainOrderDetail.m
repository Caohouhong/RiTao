//
//  ModelMainOrderDetail.m
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelMainOrderDetail.h"
#import "ModelSaleOrderDetailCollection.h"

@implementation ModelMainOrderDetail

+(NSDictionary *)mj_objectClassInArray {
    return @{@"SaleOrderDetailCollection" : [ModelSaleOrderDetailCollection class]};
}


@end
