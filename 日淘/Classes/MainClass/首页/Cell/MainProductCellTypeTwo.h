//
//  MainProductCellTypeTwo.h
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainProductCellTypeTwo : UITableViewCell

@property (nonatomic, strong) NSMutableArray *dataArray;

+ (MainProductCellTypeTwo *)cellWithTableView:(UITableView *)tableView;

@end
