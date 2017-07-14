//
//  AfterSaleModel.h
//  日淘
//
//  Created by caohouhong on 17/3/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"

@interface AfterSaleSheetCollection : NSObject

@property (nonatomic, copy) NSString *AfterSaleSheetID;
@property (nonatomic, copy) NSString *Status;
@property (nonatomic, copy) NSString *SaleGoodsPicture;
@property (nonatomic, copy) NSString *SaleGoodsName;
@property (nonatomic, copy) NSString *SaleGoodsModel;
@property (nonatomic, copy) NSString *AfterSaleSheetGuid;
@property (nonatomic, strong) ModelTotalAmount *ReturnAmount;
@property (nonatomic, strong) ModelTotalAmount *PaymentAmount;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;

@end
