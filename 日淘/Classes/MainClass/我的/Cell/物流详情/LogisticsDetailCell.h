//
//  LogisticsDetailCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelSaleOrderLogisticsDetail.h"

@interface LogisticsDetailCell : UITableViewCell

@property (nonatomic, strong) ModelSaleOrderLogisticsDetail *model;

+ (LogisticsDetailCell *)cellWithTableView:(UITableView *)tableView;

@end
