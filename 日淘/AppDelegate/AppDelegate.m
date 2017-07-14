//
//  AppDelegate.m
//  我的框架
//
//  Created by liqiang on 16/7/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

@interface AppDelegate ()<WXApiDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
//    [IQKeyboardManager sharedManager].enable = NO;
    
    //加载DCURLRouter.plist文件数据
    [DCURLRouter loadConfigDictFromPlist:@"DCURLRouter.plist"];

    //==========================================================================================================
    [self InitializePositioning]; //定位
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [LQAppFrameTabBarController sharedMainTabBar];
    
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"demo 2.0"];
    
    
    //向微信注册支持的文件类型
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    
    [WXApi registerAppSupportContentFlag:typeFlag];
    
    //引导页
    [self Guidepage];
    
    return YES;
}

-(void)Guidepage{
    NSString *key = @"CFBundleVersion";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 取出沙盒中存储的上次使用软件的版本号
    NSString *lastVersion = [defaults stringForKey:key];
    NSLog(@"----shangge--------%@", lastVersion);
    //取得当前版本
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSLog(@"---dangqian---------%@", currentVersion);
    
    if([currentVersion isEqualToString:lastVersion]) {
        self.window.rootViewController = [LQAppFrameTabBarController sharedMainTabBar];
    }else {
        self.window.rootViewController = [[NewViewController alloc]init];
        [defaults setValue:currentVersion forKey:key];
        [defaults synchronize];
    }

}

-(void)InitializePositioning {
  
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //发送通知 进入后台
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_EnterBackground object:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_EnterForeground object:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    NSString *urlStr = [options objectForKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
    if ([urlStr isEqualToString:@"com.tencent.xin"])
    {   //  微信支付
        [WXApi handleOpenURL:url delegate:self];
    }
    
    if ([url.host isEqualToString:@"safepay"])
    {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    if ([url.host isEqualToString:@"com.tencent.xin"])
    {   //  微信支付
        [WXApi handleOpenURL:url delegate:self];
    }
    
    if ([url.host isEqualToString:@"safepay"])
    {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    
    return YES;
}

#pragma mark -
#pragma mark ================= 微信支付 =================
-(void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[PayResp class]]) {
        PayResp*response=(PayResp*)resp;  // 微信终端返回给第三方的关于支付结果的结构体
        switch (response.errCode) {
            case WXSuccess:
            {
                // 支付成功后发送通知，在控制器里面进行操作
                //                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LessonsPaySuccess object:nil];
                NSLog(@"支付成功");
            }
                break;
            case WXErrCodeCommon:
            { //签名错误、未注册APPID、项目设置APPID不正确、注册的APPID与设置的不匹配、其他异常等
                NSLog(@"支付失败");
                [LCProgressHUD showFailure:@"支付失败"];
            }
                break;
            case WXErrCodeUserCancel:
            { //用户点击取消并返回
                NSLog(@"取消支付");
                [LCProgressHUD showFailure:@"取消支付"];
            }
                break;
            case WXErrCodeSentFail:
            { //发送失败
                NSLog(@"发送失败");
                [LCProgressHUD showFailure:@"发送失败"];
            }
                break;
            case WXErrCodeUnsupport:
            { //微信不支持
                NSLog(@"微信不支持");
                [LCProgressHUD showFailure:@"微信不支持"];
            }
                break;
            case WXErrCodeAuthDeny:
            { //授权失败
                NSLog(@"授权失败");
                [LCProgressHUD showFailure:@"授权失败"];
            }
                break;
            default:
                break;
        }
    }else{
        NSLog(@"error -- %@",resp);
    }
}



@end
