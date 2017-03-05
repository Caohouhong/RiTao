//
//  TaoKeProductThreeCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelTaoKeCenter.h"

@interface TaoKeProductThreeCell : UITableViewCell

@property (nonatomic, strong) ModelTaoKeCenter *model;

+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
