//
//  ModelTaoKeCenter.h
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModelTotalAmount.h"

@interface ModelTaoKeCenter : NSObject

@property (nonatomic, copy) NSString *MemberGuid;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelTotalAmount *CanWithdrawAmount;
@property (nonatomic, strong) ModelTotalAmount *WithdrawAmount;
@property (nonatomic, strong) ModelTotalAmount *ExpectedAmount;
@property (nonatomic, strong) ModelTotalAmount *TotalAmount;
@property (nonatomic, strong) ModelTotalAmount *AuditAmount;

@end
