//
//  WebViewVC.h
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"

@interface WebViewVC : ChildBaseViewController

/**
 1是包邮地址，2是发货地址，3是退货地址。
 */
@property (nonatomic, copy) NSString *UrlLinkType;

@end
