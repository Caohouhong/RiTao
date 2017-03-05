//
//  PersonalPhotoCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalPhotoCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, weak) UIImageView *iconimageView;

@end
