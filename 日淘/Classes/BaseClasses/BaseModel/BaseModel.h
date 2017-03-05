//
//  BaseModel.h
//  我的框架
//
//  Created by liqiang on 16/7/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BaseModel : NSObject

@property (nonatomic, copy) NSString *ResultType;
@property (nonatomic, assign) BOOL Result;
@property (nonatomic, copy) NSString *ErrorMessage;

@end
