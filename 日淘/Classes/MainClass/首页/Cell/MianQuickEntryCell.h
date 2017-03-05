//
//  MianQuickEntryCell.h
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//


/**
 快捷入口
 */


#import <UIKit/UIKit.h>

@interface MianQuickEntryCell : UITableViewCell

+ (MianQuickEntryCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray;

@end
