//
//  ShoppingCartProductCell.h
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelMemberShopCartDetailCollection.h"

typedef void(^ClickSelecedBtn)();
typedef void(^clickAddBtn)(NSInteger num);


@interface ShoppingCartProductCell : UITableViewCell

+ (ShoppingCartProductCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) ClickSelecedBtn btnBlock;
@property (nonatomic, copy) clickAddBtn addBlcok;

@property (nonatomic, strong) ModelMemberShopCartDetailCollection *model;

@end
