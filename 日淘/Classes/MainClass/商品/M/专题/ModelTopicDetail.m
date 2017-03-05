//
//  ModelTopicDetail.m
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelTopicDetail.h"
#import "ModelTopicLabelList.h"
#import "ModelTopicProductCollection.h"

@implementation ModelTopicDetail


+(NSDictionary *)mj_objectClassInArray {
    return @{@"TopicLabelList" : [ModelTopicLabelList class],
             @"TopicProductCollection" : [ModelTopicProductCollection class]};
}

@end
