//
//  ProductDetailDeliverGoodsCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  发货

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailDeliverGoodsCell : UITableViewCell

@property (nonatomic, strong) ModelDeliverySpeedRuleObject *model;

+ (ProductDetailDeliverGoodsCell *)cellWithTableView:(UITableView *)tableView;

@end
