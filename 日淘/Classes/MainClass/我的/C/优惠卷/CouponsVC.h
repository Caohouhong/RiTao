//
//  CouponsVC.h
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"

typedef void(^DidChooseYouHuiQuanBlock)(NSString *guid);

@interface CouponsVC : ChildBaseViewController

/**
 来自结算中心
 */
@property (nonatomic, assign) BOOL isFromSettlementCenterVC;
@property (nonatomic, copy) DidChooseYouHuiQuanBlock didChooseYouHuiQuanBlock;

@end
