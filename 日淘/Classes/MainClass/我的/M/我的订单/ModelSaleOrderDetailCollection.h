//
//  ModelSaleOrderDetailCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelLastLogisticsSheetDetail,ModelSaleProduct,ModelOrderTotalAmount,ModelSeller;
@interface ModelSaleOrderDetailCollection : NSObject

@property (nonatomic, strong) NSArray *SaleOrderGoodsDetail;
@property (nonatomic, strong) NSArray *SaleProductCommentInfoTable;
@property (nonatomic, strong) ModelLastLogisticsSheetDetail *LastLogisticsSheetDetail;
@property (nonatomic, strong) ModelSaleProduct *SaleProduct;
@property (nonatomic, strong) NSArray *DisplaySaleOrderListButton;
@property (nonatomic, strong) NSArray *DisplaySaleOrderDetailButton;
@property (nonatomic, copy) NSString *DisplaySaleOrderStatus;
@property (nonatomic, copy) NSString *OrderID;
@property (nonatomic, copy) NSString *OrderPlatformID;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderTotalAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderGoodsTotalAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderDiscountAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderTaxes;
@property (nonatomic, strong) ModelOrderTotalAmount *RedPacketsAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *CouponAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *IntegralDeductionAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderFreightCharges;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderPaymentAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderRefundAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *OrderWeight;
@property (nonatomic, strong) ModelSeller *Seller;

@property (nonatomic, copy) NSString *OrderCreatedTime;
@property (nonatomic, copy) NSString *OrderPaidTime;
@property (nonatomic, copy) NSString *OrderSentTime;
@property (nonatomic, copy) NSString *OrderReceivedTime;
@property (nonatomic, copy) NSString *OrderReturnedTime;
@property (nonatomic, copy) NSString *OrderCompletedTime;
@property (nonatomic, copy) NSString *OrderStatus;
@property (nonatomic, copy) NSString *PlatformSellerID;
@property (nonatomic, copy) NSString *PlatformSellerName;
@property (nonatomic, copy) NSString *PlatformNickname;
@property (nonatomic, copy) NSString *OrderMakerName;
@property (nonatomic, copy) NSString *OrderMakerIDCard;
@property (nonatomic, copy) NSString *OrderMakerPhone;
@property (nonatomic, copy) NSString *OrderMakerProvince;
@property (nonatomic, copy) NSString *OrderMakerCity;
@property (nonatomic, copy) NSString *OrderMakerDistrict;
@property (nonatomic, copy) NSString *OrderMakerAddress;
@property (nonatomic, copy) NSString *ReceiverName;
@property (nonatomic, copy) NSString *ReceiverIDCard;
@property (nonatomic, copy) NSString *ReceiverPhone;
@property (nonatomic, copy) NSString *ReceiverProvince;
@property (nonatomic, copy) NSString *ReceiverCity;
@property (nonatomic, copy) NSString *ReceiverDistrict;
@property (nonatomic, copy) NSString *ReceiverAddress;
@property (nonatomic, copy) NSString *OrderPaymentMethod;
@property (nonatomic, copy) NSString *OrderPaymentID;
@property (nonatomic, copy) NSString *InternationalLogisticsCompanyID;
@property (nonatomic, copy) NSString *PlatformInternationalLogisticsCompanyID;
@property (nonatomic, copy) NSString *InternationalLogisticsCompanyName;
@property (nonatomic, copy) NSString *InternationalLogisticsOrderID;
@property (nonatomic, copy) NSString *DomesticLogisticsCompanyID;
@property (nonatomic, copy) NSString *MemberGuid;
@property (nonatomic, copy) NSString *PlatformDomesticLogisticsCompanyID;
@property (nonatomic, copy) NSString *DomesticLogisticsCompanyName;
@property (nonatomic, copy) NSString *DomesticLogisticsOrderID;
@property (nonatomic, copy) NSString *PlatformDeliveryWarehouseID;
@property (nonatomic, copy) NSString *OrderImportTime;
@property (nonatomic, copy) NSString *OrderImportFileName;
@property (nonatomic, copy) NSString *OrderRemark;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;




@end
