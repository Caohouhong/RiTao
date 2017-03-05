//
//  ModelSaleCoupon.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelSaleCoupon : NSObject

@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *RangeDescription;
@property (nonatomic, copy) NSString *Indicator;
@property (nonatomic, copy) NSString *SaleCouponBuyType;
@property (nonatomic, copy) NSString *SaleCouponGetType;
@property (nonatomic, copy) NSString *SaleCouponBuyParameter1;
@property (nonatomic, copy) NSString *SaleCouponBuyParameter2;
@property (nonatomic, copy) NSString *SaleCouponGetParameter1;
@property (nonatomic, copy) NSString *SaleCouponGetParameter2;
@property (nonatomic, copy) NSString *StartTime;
@property (nonatomic, copy) NSString *EndTime;
@property (nonatomic, copy) NSString *WeekDay;
@property (nonatomic, copy) NSString *LimitationQuantity;
@property (nonatomic, copy) NSString *Priority;
@property (nonatomic, copy) NSString *BuyDescription;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, assign) BOOL NeedCoupon;
@end
