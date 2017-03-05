//
//  ModelWfxMemberShopCartWarehouseCollection.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelTotalAmount,ModelWarehouse,ModelDiscountAmount;
@interface ModelWfxMemberShopCartWarehouseCollection : NSObject

@property (nonatomic, assign) BOOL IsSelected;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) NSArray *WfxMemberShopCartDeliveryCollection;

@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, strong) ModelWarehouse *Warehouse;
@property (nonatomic, strong) ModelDiscountAmount *DiscountAmount;

@end
