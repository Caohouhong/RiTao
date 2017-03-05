//
//  ModelProductSearch.m
//  日淘
//
//  Created by caohouhong on 17/3/5.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ModelProductSearch.h"
#import "ModelSearchResultContent.h"

@implementation ModelProductSearch

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"SearchHistoryForMember":[ModelSearchResultContent class],
             @"SearchHistorySuggestion":[ModelSearchResultContent class]};
}

@end
