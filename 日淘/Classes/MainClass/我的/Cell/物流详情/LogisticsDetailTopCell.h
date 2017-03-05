//
//  LogisticsDetailTopCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelLogisticsSheetDetailTable.h"
@interface LogisticsDetailTopCell : UITableViewCell

@property (nonatomic, strong) ModelLogisticsSheetDetailTable *model;

+ (LogisticsDetailTopCell *)cellWithTableView:(UITableView *)tableView;

@end
