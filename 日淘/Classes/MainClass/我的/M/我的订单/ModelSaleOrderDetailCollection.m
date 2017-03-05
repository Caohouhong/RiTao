//
//  ModelSaleOrderDetailCollection.m
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelSaleOrderDetailCollection.h"
#import "ModelSaleOrderGoodsDetail.h"
#import "ModelSaleProductCommentInfoTable.h"
#import "ModelDisplaySaleOrderListButton.h"
#import "ModelDisplaySaleOrderDetailButton.h"

@implementation ModelSaleOrderDetailCollection

+(NSDictionary *)mj_objectClassInArray {
    return @{@"SaleOrderGoodsDetail" : [ModelSaleOrderGoodsDetail class],
             @"SaleProductCommentInfoTable":[ModelSaleProductCommentInfoTable class],
             @"DisplaySaleOrderListButton" : [ModelDisplaySaleOrderListButton class],
             @"DisplaySaleOrderDetailButton" : [ModelDisplaySaleOrderDetailButton class]};
}

@end
