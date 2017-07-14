//
//  RiTaoHelper.m
//  日淘
//
//  Created by caohouhong on 17/3/6.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "RiTaoHelper.h"


@implementation RiTaoHelper

//是否登录
+(BOOL)IsLogin{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *isLogin=[defaults objectForKey:@"isLogin"];
    return [isLogin isEqualToString:@"1"];
}

//保存登录信息
+(void)setLogIn:(LoginModel *)model{
    NSUserDefaults *de=[NSUserDefaults standardUserDefaults];
    [de setObject:@"1" forKey:@"isLogin"];
    [de setObject:model.MemberGuid forKey:@"MemberGuid"];
    [de synchronize];
}

//退出
+(void)logout{
    NSUserDefaults *de=[NSUserDefaults standardUserDefaults];
    [de setObject:@"0" forKey:@"isLogin"];
    [de setObject:@"" forKey:@"MemberGuid"];
    [de synchronize];
}

//获取用户id
+(NSString *)getMemberGuid
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"MemberGuid"]) {
        return @"";
    }
    return [defaults objectForKey:@"MemberGuid"];
}

@end
