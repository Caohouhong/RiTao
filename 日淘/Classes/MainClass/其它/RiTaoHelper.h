//
//  RiTaoHelper.h
//  日淘
//
//  Created by caohouhong on 17/3/6.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface RiTaoHelper : NSObject

//是否登录
+(BOOL)IsLogin;

//保存登录信息
+(void)setLogIn:(LoginModel *)model;

//退出
+(void)logout;

//获取用户id
+(NSString *)getMemberGuid;
@end
