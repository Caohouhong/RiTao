//
//  ModelWfxSaleOrderCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/13.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelTotalAmount;

@interface ModelWfxSaleOrderCollection : NSObject

@property (nonatomic, strong) NSArray *SaleOrderGoodsDetailCollection;
@property (nonatomic, copy) NSString *SaleOrderGuid;
@property (nonatomic, copy) NSString *SaleOrderID;
@property (nonatomic, copy) NSString *SaleOrderStatus;
@property (nonatomic, copy) NSString *Quantity;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, strong) NSArray *DisplayButtonForList;
@property (nonatomic, copy) NSString *GeneratedTime;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
