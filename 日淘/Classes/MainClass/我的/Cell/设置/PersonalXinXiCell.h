//
//  PersonalXinXiCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  nameArray @[@"", @"昵称", @"性别"]
#define  subArray @[@"", @"昵称待定", @"男"]

@interface PersonalXinXiCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *subLabel;

@end
