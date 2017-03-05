//
//  ModelWfxSaleOrderDetail.h
//  日淘
//
//  Created by 李强 on 2017/1/19.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelSaleOrderGoodsDetailCollection.h"
#import "ModelLastLogisticsSheetDetail.h"

@class ModelFreight;
@class ModelWfxSaleOrderDetail;


@interface ModelWfxSaleOrderDetail : NSObject

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
@property (nonatomic, strong) NSArray *DisplayButtonForDetail;
@property (nonatomic, strong) NSArray *SaleOrderGoodsDetailCollection;
@property (nonatomic, strong) NSArray *DisplayButtonForList;
@property (nonatomic, strong) ModelLastLogisticsSheetDetail *LastLogisticsSheetDetail;
@property (nonatomic, strong) ModelFreight *Freight;
@property (nonatomic, strong) ModelFreight *Coupon;
@property (nonatomic, strong) ModelFreight *TotalAmount;
@property (nonatomic, strong) ModelFreight *OrderPaymentAmount;

@end

@interface LQModelWfxSaleOrderDetail : NSObject

@property (nonatomic, strong) ModelWfxSaleOrderDetail *WfxSaleOrderDetail;

@end


@interface ModelFreight : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end
