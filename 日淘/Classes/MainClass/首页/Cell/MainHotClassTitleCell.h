//
//  MainHotClassTitleCell.h
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainHotClassTitleCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;
@property (nonatomic, weak) UILabel *nameLabel;

@end
