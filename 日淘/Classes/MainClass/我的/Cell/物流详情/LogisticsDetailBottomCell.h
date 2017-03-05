//
//  LogisticsDetailBottomCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsDetailBottomCell : UITableViewCell

@property (nonatomic, strong) BaseModel *model;

+ (LogisticsDetailBottomCell *)cellWithTableView:(UITableView *)tableView;

@end
