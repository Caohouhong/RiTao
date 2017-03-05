//
//  ModelBalanceOfPaymentDetailsCollection.h
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelTotalAmount.h"

@interface ModelBalanceOfPaymentDetailsCollection : NSObject

@property (nonatomic, copy) NSString *OperationType;
@property (nonatomic, copy) NSString *GeneratedTime;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) ModelTotalAmount *Amount;


@end
