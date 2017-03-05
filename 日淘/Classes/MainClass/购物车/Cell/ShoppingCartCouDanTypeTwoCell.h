//
//  ShoppingCartCouDanTypeTwoCell.h
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelWfxMemberShopCartDeliveryCollection.h"

@interface ShoppingCartCouDanTypeTwoCell : UITableViewCell

+ (ShoppingCartCouDanTypeTwoCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelWfxMemberShopCartDeliveryCollection *model;


@end
