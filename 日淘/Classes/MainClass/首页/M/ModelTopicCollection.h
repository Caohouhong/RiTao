//
//  ModelTopicCollection.h
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTopicCollection : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *SecondName;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *DisplayPicture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *Type;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, strong) NSArray *TopicProductCollection;


@end
