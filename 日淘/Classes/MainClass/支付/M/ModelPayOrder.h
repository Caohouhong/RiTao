//
//  ModelPayOrder.h
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"

@interface ModelPayOrder : NSObject

@property (nonatomic, copy) NSString *SaleOrderGuid;
@property (nonatomic, copy) NSString *SaleOrderID;
@property (nonatomic, copy) NSString *Message;
@property (nonatomic, assign) BOOL IsSuccess;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;



@property (nonatomic, copy) NSString *OrderString;

@end
