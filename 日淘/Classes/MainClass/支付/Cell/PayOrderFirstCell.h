//
//  PayOrderFirstCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelPayOrder.h"

@interface PayOrderFirstCell : UITableViewCell

@property (nonatomic, strong) ModelPayOrder *model;
+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
