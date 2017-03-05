//
//  LQAppFrameTabBarController.m
//  我的框架
//
//  Created by liqiang on 16/3/24.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import "LQAppFrameTabBarController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
#define kSupportPortraitOnly @"supportPortraitOnly"


static LQAppFrameTabBarController *mainTabBar = nil;

@interface LQAppFrameTabBarController ()

@end

@implementation LQAppFrameTabBarController

+ (instancetype)sharedMainTabBar
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainTabBar = [[LQAppFrameTabBarController alloc] init];
    
    });
    return mainTabBar;
}

+ (instancetype)updataTabBar
{
    mainTabBar = [[LQAppFrameTabBarController alloc] init];
    return mainTabBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"MainVC",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"图层1",
                                   kSelImgKey : @"shouye2",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"ClassificationMainVC",
                                   kTitleKey  : @"分类",
                                   kImgKey    : @"fenlei1",
                                   kSelImgKey : @"fenlei2",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"ShoppingCartMianVC",
                                   kTitleKey  : @"购物车",
                                   kImgKey    : @"gouwuche1",
                                   kSelImgKey : @"gouwuche2",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]},
                                 
                                 @{kClassKey  : @"MeMainVC",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"图层2",
                                   kSelImgKey : @"my2",
                                   kSupportPortraitOnly :[NSNumber numberWithBool:NO]}
                                 ];
    
    __weak typeof(self) weakSelf = self;
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.894 green:0.000 blue:0.153 alpha:1.00]} forState:UIControlStateSelected];
        [weakSelf addChildViewController:nav];
//        [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)]; 
    }];
     self.selectedIndex = 0;
}

@end
