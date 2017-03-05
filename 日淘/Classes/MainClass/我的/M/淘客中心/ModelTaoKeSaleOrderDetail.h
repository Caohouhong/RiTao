//
//  ModelTaoKeSaleOrderDetail.h
//  日淘
//
//  Created by 唐硕 on 17/1/25.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"
#import "ModelLastLogisticsSheetDetail.h"

@interface ModelTaoKeSaleOrderDetail : NSObject

@property (nonatomic, copy) NSString *VIPName;
@property (nonatomic, copy) NSString *VIPTelephone;
@property (nonatomic, copy) NSString *BuyerName;
@property (nonatomic, copy) NSString *Consignee;
@property (nonatomic, copy) NSString *ConsigneeTelephone;
@property (nonatomic, copy) NSString *ConsigneeIDCardNumber;
@property (nonatomic, copy) NSString *ConsigneeAddress;
@property (nonatomic, copy) NSString *SaleOrderGuid;
@property (nonatomic, copy) NSString *SaleOrderID;
@property (nonatomic, copy) NSString *SaleOrderStatus;
@property (nonatomic, copy) NSString *Quantity;
@property (nonatomic, copy) NSString *GeneratedTime;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelLastLogisticsSheetDetail *LastLogisticsSheetDetail;
@property (nonatomic, strong) ModelTotalAmount *Freight;
@property (nonatomic, strong) ModelTotalAmount *Coupon;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, strong) ModelTotalAmount *OrderPaymentAmount;
@property (nonatomic, strong) NSArray *DisplayButtonForDetail;
@property (nonatomic, strong) NSArray *SaleOrderGoodsDetailCollection;
@property (nonatomic, strong) NSArray *DisplayButtonForList;

@end
