//
//  ShoppingCartCouDanTypeOneCell.h
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//邮费 ---- 凑单

#import <UIKit/UIKit.h>
#import "ModelWfxMemberShopCartSaleCouponCollection.h"

@interface ShoppingCartCouDanTypeOneCell : UITableViewCell

+ (ShoppingCartCouDanTypeOneCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelWfxMemberShopCartSaleCouponCollection *model;

@end
