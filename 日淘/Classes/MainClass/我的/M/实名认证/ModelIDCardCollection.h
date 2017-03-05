//
//  ModelIDCardCollection.h
//  日淘
//
//  Created by 李强 on 2017/1/19.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelIDCardCollection;

@interface ModelIDCardCollection : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Gender;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *Province;
@property (nonatomic, copy) NSString *City;
@property (nonatomic, copy) NSString *District;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, copy) NSString *IDCardFrontPhoto;
@property (nonatomic, copy) NSString *IDCardBackPhoto;
@property (nonatomic, copy) NSString *IDCardVerified;
@property (nonatomic, copy) NSString *IDCardVerifiedTime;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@property (nonatomic, assign) BOOL moRen;

@end


@interface LQModelIDCardCollection : NSObject

@property (nonatomic, strong) NSArray *IDCardCollection;
@property (nonatomic, copy) NSString *DefaultMemberCustomClearIDCardGuid;

@end
