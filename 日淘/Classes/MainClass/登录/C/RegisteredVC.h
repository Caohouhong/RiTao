//
//  RegisteredVC.h
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"

typedef void(^registerSuccessBlock)();

@interface RegisteredVC : ChildBaseViewController
@property (nonatomic, copy) registerSuccessBlock block;
@end
