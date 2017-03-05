//
//  ModelCategoryCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCategoryCollection : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *ParentGuid;
@property (nonatomic, assign) BOOL CommonUsage;
@property (nonatomic, assign) BOOL HotUsage;
@property (nonatomic, assign) BOOL Display;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *HomePicture;
@property (nonatomic, copy) NSString *TopicGuid;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@property (nonatomic, assign) BOOL isSelect;

@end
