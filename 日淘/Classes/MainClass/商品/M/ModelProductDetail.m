//
//  ModelProductDetail.m
//  日淘
//
//  Created by 李强 on 2016/12/13.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelProductDetail.h"

@implementation ModelProductDetail

+ (NSDictionary <NSString *, Class> *)whc_ModelReplacePropertyClassMapper {
    return @{@"SaleProductDetail" : [ModelSaleProductDetail class]};
}

@end

@implementation ModelSaleProductDetail

+ (NSDictionary <NSString *, Class> *)whc_ModelReplaceContainerElementClassMapper
{
    return @{@"SaleProductPictureCollection":[ModelSaleProductPictureCollection class],
             @"SaleCouponCollection":[ModelSaleCouponCollection class],
             @"SaleProductSpecialCollection":[ModelSaleProductSpecialCollection class],
             @"SaleProductSimpleDetailCollectionForLinked":[ModelSaleProductSimpleDetailCollectionForLinked class],
             @"TopicCollection":[ModelTopicCollection class]};
}

+ (NSDictionary <NSString *, Class> *)whc_ModelReplacePropertyClassMapper
{
    return @{@"MarketPrice":[ModelMarketPrice class],
             @"Price":[ModelPrice class],
             @"DeliveryFeeRuleObject":[ModelDeliveryFeeRuleObject class],
             @"ReturnRuleObject":[DeliverySpeedRuleObject class],
             @"DeliverySpeedRuleObject":[ModelDeliverySpeedRuleObject class],
             @"SaleProductCommentDetail":[ModelSaleProductCommentDetail class],
             @"BrandObject":[ModelBrandObject class],
             @"BrandProduct1":[ModelBrandProduct class],
             @"BrandProduct2":[ModelBrandProduct class],
             @"BrandProduct3":[ModelBrandProduct class]};
}

@end


@implementation ModelSaleProductPictureCollection


@end


@implementation ModelMarketPrice


@end


@implementation ModelPrice


@end


@implementation ModelSaleCouponCollection


@end


@implementation ModelDeliveryFeeRuleObject


@end


@implementation DeliverySpeedRuleObject


@end


@implementation ModelDeliverySpeedRuleObject


@end


@implementation ModelSaleProductSpecialCollection


@end


@implementation ModelSaleProductCommentDetail


@end


@implementation ModelBrandObject


@end


@implementation ModelBrandProduct


@end


@implementation ModelSaleProductSimpleDetailCollectionForLinked


+ (NSDictionary <NSString *, Class> *)whc_ModelReplacePropertyClassMapper
{
    return @{@"MarketPrice":[ModelMarketPrice class],
             @"Price":[ModelPrice class]};
}

@end


//@implementation ModelTopicCollection
//
//
//@end

