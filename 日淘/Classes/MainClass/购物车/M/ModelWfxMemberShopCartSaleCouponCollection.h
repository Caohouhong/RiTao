//
//  ModelWfxMemberShopCartSaleCouponCollection.h
//  日淘
//
//  Created by 唐硕 on 16/12/27.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ModelSaleCoupon;

@interface ModelWfxMemberShopCartSaleCouponCollection : NSObject


@property (nonatomic, copy) NSString *SaleCouponDescription;
@property (nonatomic, copy) NSString *Guid;
@property (nonatomic, copy) NSString *Tag;
@property (nonatomic, strong) NSArray *MemberShopCartDetailCollection;
@property (nonatomic, strong) ModelSaleCoupon *SaleCoupon;


@end
