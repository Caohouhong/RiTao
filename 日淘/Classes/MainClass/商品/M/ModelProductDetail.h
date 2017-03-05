//
//  ModelProductDetail.h
//  日淘
//
//  Created by 李强 on 2016/12/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BaseModel.h"
#import "ModelTopicCollection.h"

@class ModelSaleProductDetail;
@class ModelSaleProductPictureCollection;
@class ModelMarketPrice;
@class ModelPrice;
@class ModelSaleCouponCollection;
@class ModelDeliveryFeeRuleObject;
@class DeliverySpeedRuleObject;
@class ModelDeliverySpeedRuleObject;
@class ModelSaleProductSpecialCollection;
@class ModelSaleProductCommentDetail;
@class ModelBrandObject;
@class ModelBrandProduct;
@class ModelSaleProductSimpleDetailCollectionForLinked;
@class ModelSaleProductDetailPictureCollection;

@interface ModelProductDetail : BaseModel

@property (nonatomic, strong) ModelSaleProductDetail *SaleProductDetail;

@end


@interface ModelSaleProductDetail : NSObject

/**
 轮播图
 */
@property (nonatomic, strong) NSArray *SaleProductPictureCollection;
/**
 市场价
 */
@property (nonatomic, strong) ModelMarketPrice *MarketPrice;
/**
 销售价
 */
@property (nonatomic, strong) ModelPrice *Price;
/**
 标签
 */
@property (nonatomic, strong) NSArray *SaleCouponCollection;
/**
 商品描述
 */
@property (nonatomic, copy) NSString *Description;
/**
 商品详细描述
 */
@property (nonatomic, copy) NSString *DetailDescription;
/**
 已选
 */
@property (nonatomic, copy) NSString *ShortDescription;
/**
 包邮信息
 */
@property (nonatomic, strong) ModelDeliveryFeeRuleObject *DeliveryFeeRuleObject;
/**
 退货信息
 */
@property (nonatomic, strong) DeliverySpeedRuleObject *ReturnRuleObject;
/**
 发货信息
 */
@property (nonatomic, strong) ModelDeliverySpeedRuleObject *DeliverySpeedRuleObject;
/**
 商品的特性
 */
@property (nonatomic, strong) NSArray *SaleProductSpecialCollection;
/**
 最近评论
 */
@property (nonatomic, strong) ModelSaleProductCommentDetail *SaleProductCommentDetail;
/**
 总共评论数目
 */
@property (nonatomic, copy) NSString *SaleProductCommentQuantity;
/**
 品牌信息
 */
@property (nonatomic, strong) ModelBrandObject *BrandObject;
/**
 品牌商品数目
 */
@property (nonatomic, copy) NSString *BrandProductQuantity;
/**
 第1个品牌商品
 */
@property (nonatomic, strong) ModelBrandProduct *BrandProduct1;
/**
 第2个品牌商品
 */
@property (nonatomic, strong) ModelBrandProduct *BrandProduct2;
/**
 第3个品牌商品
 */
@property (nonatomic, strong) ModelBrandProduct *BrandProduct3;
/**
 您也许还需要
 */
@property (nonatomic, strong) NSArray *SaleProductSimpleDetailCollectionForLinked;
/**
 关联专题
 */
@property (nonatomic, strong) NSArray *TopicCollection;
/**
 图文详情
 */
@property (nonatomic, strong) NSArray *SaleProductDetailPictureCollection;

@end



#pragma mark -
#pragma mark ================= 轮播图 =================
@interface ModelSaleProductPictureCollection : NSObject

@property (nonatomic, copy) NSString *SaleProduct;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *MainPicture;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end



#pragma mark -
#pragma mark ================= 市场价 =================
@interface ModelMarketPrice : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end



#pragma mark -
#pragma mark ================= 销售价 =================
@interface ModelPrice : NSObject

@property (nonatomic, copy) NSString *Value;
@property (nonatomic, copy) NSString *Accuracy;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Tag;

@end



#pragma mark -
#pragma mark ================= 标签 =================
@interface ModelSaleCouponCollection : NSObject

@property (nonatomic, copy) NSString *Indicator;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *RangeDescription;
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
@property (nonatomic, copy) NSString *NeedCoupon;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

#pragma mark -
#pragma mark ================= 包邮信息 =================
@interface ModelDeliveryFeeRuleObject : NSObject
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *Indicator;
@property (nonatomic, copy) NSString *TotalQuantity;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end


#pragma mark -
#pragma mark ================= 退货信息 =================
@interface DeliverySpeedRuleObject : NSObject
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DaysForReturn;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end


#pragma mark -
#pragma mark ================= 发货信息 =================
@interface ModelDeliverySpeedRuleObject : NSObject
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *HoursToDelivery;
@property (nonatomic, copy) NSString *DaysToReceive;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

#pragma mark -
#pragma mark ================= 商品的特性 =================
@interface ModelSaleProductSpecialCollection : NSObject
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

#pragma mark -
#pragma mark ================= 最近评论 =================
@interface ModelSaleProductCommentDetail : NSObject
@property (nonatomic, copy) NSString *MemberAvatar;
@property (nonatomic, copy) NSString *MemberNickName;
@property (nonatomic, copy) NSString *Content;
@property (nonatomic, copy) NSString *SaleProductGuid;
@property (nonatomic, copy) NSString *SaleOrderGuid;
@property (nonatomic, copy) NSString *MemberGuid;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) NSArray *PictureList;

@end

#pragma mark -
#pragma mark ================= 品牌信息 =================
@interface ModelBrandObject : NSObject
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DetailDescription;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

#pragma mark -
#pragma mark ================= 品牌商品 =================
@interface ModelBrandProduct : NSObject
@property (nonatomic, copy) NSString *MarketPrice;
@property (nonatomic, copy) NSString *Price;
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *MoneySymbol;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

#pragma mark -
#pragma mark ================= 您也许还需要 =================
@interface ModelSaleProductSimpleDetailCollectionForLinked : NSObject
@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *ProductGuid;
@property (nonatomic, copy) NSString *Barcode;
@property (nonatomic, copy) NSString *ShortDescription;
@property (nonatomic, copy) NSString *Description;
@property (nonatomic, copy) NSString *DetailDescription;
@property (nonatomic, copy) NSString *SaleOrderGoodsType;
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
@property (nonatomic, copy) NSString *Category;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
/**
 市场价
 */
@property (nonatomic, strong) ModelMarketPrice *MarketPrice;
/**
 销售价
 */
@property (nonatomic, strong) ModelPrice *Price;

@end



#pragma mark -
#pragma mark ================= 图文详情 =================
@interface ModelSaleProductDetailPictureCollection : NSObject

@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *SaleProduct;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end

//#pragma mark -
//#pragma mark ================= 专题关联 =================
//@interface ModelTopicCollection : NSObject
//
//@property (nonatomic, copy) NSString *Name;
//@property (nonatomic, copy) NSString *SecondName;
//@property (nonatomic, copy) NSString *Picture;
//@property (nonatomic, copy) NSString *Description;
//@property (nonatomic, copy) NSString *SortCode;
//@property (nonatomic, copy) NSString *Type;
//@property (nonatomic, copy) NSString *TopicProductCollection;
//@property (nonatomic, copy) NSString *Guid;
//@property (nonatomic, copy) NSString *Tag;
//
//@end
