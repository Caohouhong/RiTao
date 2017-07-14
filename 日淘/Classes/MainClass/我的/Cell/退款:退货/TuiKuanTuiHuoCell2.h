//
//  TuiKuanTuiHuoCell2.h
//  日淘
//
//  Created by 李强 on 2017/2/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterSaleSheetCollection.h"
@interface TuiKuanTuiHuoCell2 : UITableViewCell

@property (nonatomic, strong) AfterSaleSheetCollection *model;
+ (TuiKuanTuiHuoCell2 *)cellWithTableView:(UITableView *)tableView;

@end
