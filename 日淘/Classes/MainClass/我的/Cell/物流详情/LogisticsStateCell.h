//
//  LogisticsStateCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelSaleOrderLogisticsDetail.h"


@interface LogisticsStateCell : UITableViewCell

+ (LogisticsStateCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelSaleOrderLogisticsDetail *model;

@end
