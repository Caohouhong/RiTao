//
//  NSString+xiaoshdian.m
//  日淘
//
//  Created by 唐硕 on 17/1/20.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "NSString+xiaoshdian.h"

@implementation NSString (xiaoshdian)

+(NSString *)strWhithFloat:(CGFloat)num {
    NSString *str1 = [NSString stringWithFormat:@"%.2f",num];
    NSString *str2;
    NSString *str3;
    NSRange pointrange = [str1 rangeOfString:@"."];
    if(pointrange.location != NSNotFound) {
        str2 = [str1 substringToIndex:pointrange.location];
        if(pointrange.location + 1 < str1.length) {
            str3 = [str1 substringFromIndex:pointrange.location+1];
            NSInteger str3leng = str3.length;
            if(str3leng == 1) {
                if([str3 characterAtIndex:0] == '0') {
                    str3 = @"";
                }
            }else if (str3leng == 2) {
                char onestr = [str3 characterAtIndex:0];
                char twostr = [str3 characterAtIndex:1];
                if(twostr == '0') {
                    if(onestr =='0') {
                        str3 = @"";
                    }else {
                        str3 = [NSString stringWithFormat:@"%c",onestr];
                    }
                }
            }
        }
    }
    if(str2 && str3) {
        return [NSString stringWithFormat:@"%@%@%@",str2,str3.length?@".":@"",str3];
    }else {
        return str1;
    }
}


+(NSString *)strWhithString:(NSString *)num {
    
    NSString *num1 = [num substringFromIndex:1];
    NSString *str1 = [NSString stringWithFormat:@"%.2f",[num1 floatValue]];
    NSString *str2;
    NSString *str3;
    NSRange pointrange = [str1 rangeOfString:@"."];
    if(pointrange.location != NSNotFound) {
        str2 = [str1 substringToIndex:pointrange.location];
        if(pointrange.location + 1 < str1.length) {
            str3 = [str1 substringFromIndex:pointrange.location+1];
            NSInteger str3leng = str3.length;
            if(str3leng == 1) {
                if([str3 characterAtIndex:0] == '0') {
                    str3 = @"";
                }
            }else if (str3leng == 2) {
                char onestr = [str3 characterAtIndex:0];
                char twostr = [str3 characterAtIndex:1];
                if(twostr == '0') {
                    if(onestr =='0') {
                        str3 = @"";
                    }else {
                        str3 = [NSString stringWithFormat:@"%c",onestr];
                    }
                }
            }
        }
    }
    if(str2 && str3) {
        return [NSString stringWithFormat:@"%@%@%@",str2,str3.length?@".":@"",str3];
    }else {
        return str1;
    }
}

@end
