//
//  ShoppingCartHeaderCell.h
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelWfxMemberShopCartWarehouseCollection.h"


typedef void(^ClickSelectBtn)();

@interface ShoppingCartHeaderCell : UITableViewCell

+ (ShoppingCartHeaderCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) ClickSelectBtn allBlock;
@property (nonatomic, strong) ModelWfxMemberShopCartWarehouseCollection *model;

@end
