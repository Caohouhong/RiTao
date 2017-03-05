//
//  ModelIDCardInfo.h
//  日淘
//
//  Created by 唐硕 on 17/1/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelIDCardInfo : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Gender;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *Province;
@property (nonatomic, copy) NSString *City;
@property (nonatomic, copy) NSString *District;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *IDCardFrontPhoto;
@property (nonatomic, copy) NSString *IDCardBackPhoto;
@property (nonatomic, assign) BOOL IDCardVerified;
@property (nonatomic, copy) NSString *IDCardVerifiedTime;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
