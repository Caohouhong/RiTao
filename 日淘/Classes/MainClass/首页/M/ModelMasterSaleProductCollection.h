//
//  ModelMasterSaleProductCollection.h
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelMasterMarketPrice,ModelMasterPrice,ModelMasterReturnProfitAmount;

@interface ModelMasterSaleProductCollection : NSObject

@property (nonatomic, copy) NSString *SoldCount;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *CouponTag;
@property (nonatomic, copy) NSString *DeliveryTag;
@property (nonatomic, copy) NSString *ProductGuid;
@property (nonatomic, copy) NSString *Barcode;
@property (nonatomic, copy) NSString *ShortDescription;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DetailDescription;
@property (nonatomic, copy) NSString *SaleOrderGoodsType; //1 直邮  2 保税 3完税
@property (nonatomic, copy) NSString *MainProduct;
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
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

//@property (nonatomic, copy) NSString *Label;
////@property (nonatomic, copy) NSString *Name;

@property (nonatomic, strong) ModelMasterReturnProfitAmount *ReturnProfitAmount;
@property (nonatomic, strong) ModelMasterMarketPrice *MarketPrice;
@property (nonatomic, strong) ModelMasterPrice *Price;

@end

@interface ModelMasterReturnProfitAmount : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end

@interface ModelMasterMarketPrice : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end

@interface ModelMasterPrice : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end

