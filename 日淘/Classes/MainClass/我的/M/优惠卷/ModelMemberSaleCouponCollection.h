//
//  ModelMemberSaleCouponCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/10.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelMemberSaleCouponCollection : NSObject

@property (nonatomic, copy) NSString *MemberSaleCouponGuid;
@property (nonatomic, copy) NSString *SaleCouponGuid;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *SaleCouponValue;
@property (nonatomic, copy) NSString *BuyRule;
@property (nonatomic, copy) NSString *BuyRange;
@property (nonatomic, copy) NSString *UsedTime;
@property (nonatomic, copy) NSString *EndTime;
@property (nonatomic, copy) NSString *DisplayStatus;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
