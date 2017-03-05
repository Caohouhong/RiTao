//
//  ModelWfxMemberShopCart.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelMasterSaleProductCollection.h"

@class ModelTotalAmount;

@interface ModelWfxMemberShopCart : NSObject

@property (nonatomic, strong) NSArray *WfxMemberShopCartWarehouseCollection;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, copy)  NSString *TotalQuantity;
@property (nonatomic, strong) NSArray *WfxShopCartSuggestionSaleProductCollection;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;


//自己加的
@property (nonatomic, assign) BOOL IsSelected;

@end
