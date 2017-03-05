//
//  AuthenticationVC.h
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"
#import "ModelIDCardCollection.h"

typedef void(^DidChooseAuthenticationBlock)(ModelIDCardCollection *model);

@interface AuthenticationVC : ChildBaseViewController

/**
 来自结算中心
 */
@property (nonatomic, assign) BOOL isFromSettlementCenterVC;
@property (nonatomic, copy) DidChooseAuthenticationBlock didChooseAuthenticationBlock;

@end
