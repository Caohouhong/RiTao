//
//  MyCollectiomMainModel.m
//  日淘
//
//  Created by 唐硕 on 17/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MyCollectiomMainModel.h"
#import "ModelMasterSaleProductCollection.h"


@implementation MyCollectiomMainModel


+(NSDictionary *)mj_objectClassInArray {
    return @{@"MasterSaleProductCollection" : [ModelMasterSaleProductCollection class]};
}

@end
