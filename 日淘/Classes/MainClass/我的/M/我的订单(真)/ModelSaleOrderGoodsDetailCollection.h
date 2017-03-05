//
//  ModelSaleOrderGoodsDetailCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/13.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"

@class ModelTotalAmount;

@interface ModelSaleOrderGoodsDetailCollection : NSObject

@property (nonatomic, copy) NSString *ProductGuid;
@property (nonatomic, copy) NSString *GoodsName;
@property (nonatomic, copy) NSString *SaleProductPicture;
@property (nonatomic, copy) NSString *Quantity;
@property (nonatomic, copy) NSString *SaleProductModel;
@property (nonatomic, copy) NSString *DisplayButton;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelTotalAmount *SalePrice;
@property (nonatomic, copy) NSString *GeneratedTime;

@property (nonatomic, copy) NSString *SaleOrderGuid;


@end
