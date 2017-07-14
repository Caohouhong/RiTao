//
//  AfterSaleListModel.m
//  日淘
//
//  Created by caohouhong on 17/3/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "AfterSaleListModel.h"
#import "AfterSaleSheetCollection.h"


@implementation AfterSaleListModel
+(NSDictionary *)mj_objectClassInArray {
    return @{@"AfterSaleSheetCollection" : [AfterSaleSheetCollection class]};
}

@end
