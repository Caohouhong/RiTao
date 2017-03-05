//
//  ModelTopicProductCollection.h
//  日淘
//
//  Created by 李强 on 2016/12/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTopicProductCollection : NSObject

@property (nonatomic, copy) NSString *Picture;
@property (nonatomic, copy) NSString *Price;
@property (nonatomic, copy) NSString *OrignalPrice;
@property (nonatomic, copy) NSString *TopicID;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *SortCode;
@property (nonatomic, copy) NSString *Preview;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, copy) NSString *SaleProductGuid;

@property (nonatomic, copy) NSString *Label;

@property (nonatomic, copy) NSString *CouponTag;
@property (nonatomic, copy) NSString *DeliveryTag;
@property (nonatomic, copy) NSString *ProductType; //1 直邮  2 保税 3完税

@property (nonatomic, copy) NSString *Product; //商品ID
@end
