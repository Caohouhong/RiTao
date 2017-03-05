//
//  AppDelegate.h
//  我的框架
//
//  Created by liqiang on 16/7/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelTopLayerCollection.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, copy) NSString *alipayPartner;
@property (nonatomic, copy) NSString *alipaySeller;
@property (nonatomic, copy) NSString *aliPayBack;

@end

