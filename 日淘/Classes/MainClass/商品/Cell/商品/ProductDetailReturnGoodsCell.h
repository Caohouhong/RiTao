//
//  ProductDetailReturnGoodsCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailReturnGoodsCell : UITableViewCell

@property (nonatomic, strong) DeliverySpeedRuleObject *model;

+ (ProductDetailReturnGoodsCell *)cellWithTableView:(UITableView *)tableView;

@end
