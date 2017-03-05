//
//  ProductDetailFreeShippingCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  包邮

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailFreeShippingCell : UITableViewCell

@property (nonatomic, strong) ModelDeliveryFeeRuleObject *model;

+ (ProductDetailFreeShippingCell *)cellWithTableView:(UITableView *)tableView;

@end
