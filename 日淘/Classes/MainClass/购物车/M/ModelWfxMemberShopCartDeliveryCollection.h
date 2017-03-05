//
//  ModelWfxMemberShopCartDeliveryCollection.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelDeliveryFeeRule;

@interface ModelWfxMemberShopCartDeliveryCollection : NSObject

@property (nonatomic, copy) NSString *DeilveryDescription;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) NSArray *WfxMemberShopCartSaleCouponCollection;
@property (nonatomic, strong) ModelDeliveryFeeRule *DeliveryFeeRule;
@property (nonatomic, assign) BOOL IsFreeDelivery;

@end
