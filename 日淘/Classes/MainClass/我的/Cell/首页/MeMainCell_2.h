//
//  MeMainCell_2.h
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelMemberCenter.h"
@interface MeMainCell_2 : UITableViewCell

+ (MeMainCell_2 *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelMemberCenter *model;

@end
