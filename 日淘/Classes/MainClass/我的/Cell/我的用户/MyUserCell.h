//
//  MyUserCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelMySubordinatesCollection.h"

@interface MyUserCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) ModelMySubordinatesCollection *model;

@end
