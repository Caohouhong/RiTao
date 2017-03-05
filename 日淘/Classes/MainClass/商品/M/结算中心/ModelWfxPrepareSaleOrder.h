//
//  ModelWfxPrepareSaleOrder.h
//  日淘
//
//  Created by 李强 on 2017/1/19.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"
#import "ModelMemberShopCartDetailCollection.h"

@class ModelWfxPrepareSaleOrder;
@class ModelMemberShopCartDetailCollection;

@interface ModelWfxPrepareSaleOrder : NSObject

@property (nonatomic, copy) NSString *ReceiverAddressGuid;
@property (nonatomic, copy) NSString *ReceiverName;
@property (nonatomic, copy) NSString *ReceiverPhone;
@property (nonatomic, copy) NSString *ReceiverAddress;
@property (nonatomic, copy) NSString *MemberCustomClearIDCardGuid;
@property (nonatomic, copy) NSString *CustomClearName;
@property (nonatomic, copy) NSString *CustomClearID;
@property (nonatomic, copy) NSString *WarehouseName;
@property (nonatomic, copy) NSString *CouponDescription;
@property (nonatomic, assign) BOOL IsExcludePost;
@property (nonatomic, copy) NSString *MemberSaleCouponGuid;
@property (nonatomic, copy) NSString *TotalQuantity;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelTotalAmount *DiscountAmount;
@property (nonatomic, strong) ModelTotalAmount *DeliveyFee;
@property (nonatomic, strong) ModelTotalAmount *CouponValue;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, strong) NSArray *MemberShopCartDetailCollection;

@end

@interface LQModelWfxPrepareSaleOrder : NSObject

@property (nonatomic, strong) ModelWfxPrepareSaleOrder *WfxPrepareSaleOrder;

@end
