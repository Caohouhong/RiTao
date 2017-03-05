//
//  CategoryCollectionModel.h
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryCollectionModel : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *ParentGuid;
@property (nonatomic, copy) NSString *CommonUsage;
@property (nonatomic, copy) NSString *HotUsage;
@property (nonatomic, copy) NSString *Display;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *HomePicture;
@property (nonatomic, copy) NSString *TopPictures;
@property (nonatomic, copy) NSString *TopicGuid;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
