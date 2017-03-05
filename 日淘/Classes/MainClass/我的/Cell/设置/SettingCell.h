//
//  SettingCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define titleArray @[@[@"个人信息", @"我的实名认证", @"我的收获地址", @"消息推送设置", @"消除缓存"],@[@"版本号"]]

@interface SettingCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *versionLabel;

@end
