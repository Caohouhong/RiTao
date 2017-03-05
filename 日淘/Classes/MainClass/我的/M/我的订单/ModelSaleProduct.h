//
//  ModelSaleProduct.h
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelOrderTotalAmount;

@interface ModelSaleProduct : NSObject

@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *CouponTag;
@property (nonatomic, copy) NSString *DeliveryTag;
@property (nonatomic, copy) NSString *ShopCartProductGuid;
@property (nonatomic, copy) NSString *ProductGuid;
@property (nonatomic, copy) NSString *SoldCount;
@property (nonatomic, copy) NSString *Barcode;
@property (nonatomic, copy) NSString *ShortDescription;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DetailDescription;
@property (nonatomic, copy) NSString *SaleOrderGoodsType;
@property (nonatomic, assign) BOOL MainProduct;
@property (nonatomic, copy) NSString *DeliveryFeeRule;
@property (nonatomic, copy) NSString *DeliverySpeedRule;
@property (nonatomic, copy) NSString *ReturnRule;
@property (nonatomic, copy) NSString *SaleProductSpecial1;
@property (nonatomic, copy) NSString *SaleProductSpecial2;
@property (nonatomic, copy) NSString *SaleProductSpecial3;
@property (nonatomic, copy) NSString *SaleProductSpecial4;
@property (nonatomic, copy) NSString *Keyword;
@property (nonatomic, copy) NSString *BrandGuid;
@property (nonatomic, copy) NSString *Category1;
@property (nonatomic, copy) NSString *Category2;
@property (nonatomic, copy) NSString *Category3;
@property (nonatomic, copy) NSString *ReturnProfitPercentage;
@property (nonatomic, copy) NSString *SellerGuid;
@property (nonatomic, copy) NSString *Weight;
@property (nonatomic, copy) NSString *Size;
@property (nonatomic, copy) NSString *MaxQuantity;
@property (nonatomic, copy) NSString *MiniQuantity;
@property (nonatomic, copy) NSString *InitialQuantity;
@property (nonatomic, copy) NSString *RealityQuantity;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelOrderTotalAmount *ReturnProfitAmount;
@property (nonatomic, strong) ModelOrderTotalAmount *Price;
@property (nonatomic, strong) ModelOrderTotalAmount *MarketPrice;

@end
