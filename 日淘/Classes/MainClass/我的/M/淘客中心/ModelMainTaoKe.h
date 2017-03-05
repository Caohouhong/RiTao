//
//  ModelMainTaoKe.h
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "BaseModel.h"
#import "ModelTaoKeSaleOrderDetail.h"

@class ModelTaoKeCenter;

@interface ModelMainTaoKe : BaseModel

@property (nonatomic, strong) ModelTaoKeCenter *TaoKeCenter;
@property (nonatomic, strong) NSArray *BalanceOfPaymentDetailsCollection;
@property (nonatomic, strong) NSArray *MySubordinatesCollection;
@property (nonatomic, strong) NSArray *TaoKeSaleOrderCollection;
@property (nonatomic, strong) ModelTaoKeSaleOrderDetail *TaoKeSaleOrderDetail;

@end
