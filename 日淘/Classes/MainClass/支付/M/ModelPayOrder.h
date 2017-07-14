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

//支付宝支付的签名
@property (nonatomic, copy) NSString *OrderString;

//微信支付的参数
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *PartnerID;
@property (nonatomic, copy) NSString *PrepayID;
@property (nonatomic, copy) NSString *PackageValue;
@property (nonatomic, copy) NSString *NonceStr;
@property (nonatomic, copy) NSString *TimeStamp;
@property (nonatomic, copy) NSString *Sign;


@end
