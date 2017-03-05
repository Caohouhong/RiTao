//
//  ModelSaleOrderLogisticsDetail.m
//  日淘
//
//  Created by 唐硕 on 17/1/25.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelSaleOrderLogisticsDetail.h"
#import "ModelLogisticsSheetDetailTable.h"

@implementation ModelSaleOrderLogisticsDetail

+(NSDictionary *)mj_objectClassInArray {
    return @{@"LogisticsSheetDetailTable" : [ModelLogisticsSheetDetailTable class]};
}


@end
