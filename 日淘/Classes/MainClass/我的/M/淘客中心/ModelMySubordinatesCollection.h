//
//  ModelMySubordinatesCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"

@interface ModelMySubordinatesCollection : NSObject

@property (nonatomic, copy) NSString *NickName;
@property (nonatomic, copy) NSString *IDCardInfo;
@property (nonatomic, copy) NSString *RegisterTime;
@property (nonatomic, copy) NSString *Password;
@property (nonatomic, copy) NSString *Email;
@property (nonatomic, copy) NSString *EMailVerifiedTime;
@property (nonatomic, copy) NSString *Telephone;
@property (nonatomic, copy) NSString *TelephoneVerifiedTime;
@property (nonatomic, copy) NSString *Photo;
@property (nonatomic, copy) NSString *ParentMember;
@property (nonatomic, copy) NSString *LastLoginTime;
@property (nonatomic, copy) NSString *LastLoginIP;
@property (nonatomic, copy) NSString *VIP;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@end
