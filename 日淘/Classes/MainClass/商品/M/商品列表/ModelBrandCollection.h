//
//  ModelBrandCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelBrandCollection : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DetailDescription;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@property (nonatomic, assign) BOOL isSelect;

@end
