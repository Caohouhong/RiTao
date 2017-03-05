//
//  ModelTopicDetail.h
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BaseModel.h"

@interface ModelTopicDetail : BaseModel


@property (nonatomic, strong) NSArray *TopicLabelList;
@property (nonatomic, strong) NSArray *TopicProductCollection;

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *SecondName;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *DisplayPicture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *HasDetail;
@property (nonatomic, copy) NSString *Type;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
