//
//  ModelProductSearch.h
//  日淘
//
//  Created by caohouhong on 17/3/5.
//  Copyright © 2017年 LiQiang. All rights reserved.
//
#import "BaseModel.h"


@interface ModelProductSearch : BaseModel

@property (nonatomic, strong) NSArray *SearchHistoryForMember;
@property (nonatomic, strong) NSArray *SearchHistorySuggestion;

@end
