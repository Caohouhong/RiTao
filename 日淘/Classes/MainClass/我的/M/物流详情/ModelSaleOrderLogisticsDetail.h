//
//  ModelSaleOrderLogisticsDetail.h
//  日淘
//
//  Created by 唐硕 on 17/1/25.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ModelSaleOrderLogisticsDetail : NSObject

@property (nonatomic, copy) NSString *SaleOrderGuid;
@property (nonatomic, copy) NSString *CompanyTelephoneNumber;
@property (nonatomic, copy) NSString *SaleOrderStatus;
@property (nonatomic, copy) NSString *SaleOrderID;
@property (nonatomic, copy) NSString *Company;
@property (nonatomic, copy) NSString *LogisticsNumber;
@property (nonatomic, copy) NSString *WarehosueName;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;


@property (nonatomic, strong) NSArray *LogisticsSheetDetailTable;


@end
