//
//  ModelMainTaoKe.m
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelMainTaoKe.h"
#import "ModelBalanceOfPaymentDetailsCollection.h"
#import "ModelMySubordinatesCollection.h"
#import "ModelTaoKeSaleOrderCollection.h"

@implementation ModelMainTaoKe

+(NSDictionary *)mj_objectClassInArray {
    return @{@"BalanceOfPaymentDetailsCollection" : [ModelBalanceOfPaymentDetailsCollection class],
             @"MySubordinatesCollection" : [ModelMySubordinatesCollection class],
             @"TaoKeSaleOrderCollection" : [ModelTaoKeSaleOrderCollection class]};
}

@end



