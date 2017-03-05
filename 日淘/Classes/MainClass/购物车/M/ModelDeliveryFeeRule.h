//
//  ModelDeliveryFeeRule.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ModelTotalAmount;

@interface ModelDeliveryFeeRule : NSObject

@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *Indicator;
@property (nonatomic, copy) NSString *TotalQuantity;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@end
