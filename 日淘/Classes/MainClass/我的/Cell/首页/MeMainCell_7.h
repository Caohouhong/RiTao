//
//  MeMainCell_7.h
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelPicture.h"

@interface MeMainCell_7 : UITableViewCell

@property (nonatomic, strong) ModelPicture *model;

+ (MeMainCell_7 *)cellWithTableView:(UITableView *)tableView;

@end
