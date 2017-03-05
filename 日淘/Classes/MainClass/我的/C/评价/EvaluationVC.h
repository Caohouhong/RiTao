//
//  EvaluationVC.h
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"
#import "ModelSaleOrderGoodsDetailCollection.h"


typedef NS_ENUM(NSInteger, PhotoType) {
    PhotoTypeOne,
    PhotoTypeTwo,
    PhotoTypeThree,
    PhotoTypeFour
};

typedef void(^DidPingJiaSuccessBlock)();

@interface EvaluationVC : ChildBaseViewController

@property (nonatomic, strong) ModelSaleOrderGoodsDetailCollection *model;
@property (nonatomic, copy) DidPingJiaSuccessBlock didPingJiaSuccessBlock;

@end
