//
//  ProductListVC.h
//  日淘
//
//  Created by 李强 on 2016/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"

@interface ProductListVC : ChildBaseViewController

@property (nonatomic, copy) NSString *CategoryGuid;
@property (nonatomic, copy) NSString *SearchContent;//搜索界面跳转过来
@property (nonatomic, copy) NSDictionary *baoYouDic;//从购物车的包邮跳过来
@property (nonatomic, copy) NSDictionary *manJianDic;//从购物车的满减跳过来



@end
