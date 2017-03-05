//
//  ModelMainWoOrder.m
//  日淘
//
//  Created by 唐硕 on 17/1/13.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelMainWoOrder.h"
#import "ModelWfxSaleOrderCollection.h"

@implementation ModelMainWoOrder


+(NSDictionary *)mj_objectClassInArray {
    return @{@"WfxSaleOrderCollection" : [ModelWfxSaleOrderCollection class]};
}

@end
