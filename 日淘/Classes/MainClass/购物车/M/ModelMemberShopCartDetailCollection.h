//
//  ModelMemberShopCartDetailCollection.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"


@interface ModelMemberShopCartDetailCollection : NSObject

@property (nonatomic, copy) NSString *WarehouseName;
@property (nonatomic, copy) NSString *WarehouseGuid;
@property (nonatomic, copy) NSString *SaleCouponGuid;
@property (nonatomic, copy) NSString *DeliveryFeeRuleGuid;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *ShortDescription;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *SaleProductGuid;
@property (nonatomic, copy) NSString *MemberGuid;
@property (nonatomic, copy) NSString *AddedTime;
@property (nonatomic, copy) NSString *Quantity;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, assign) BOOL IsSelected;

@property (nonatomic, strong) ModelTotalAmount *Price;

@end
