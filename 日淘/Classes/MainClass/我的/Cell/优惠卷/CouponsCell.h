//
//  CouponsCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelMemberSaleCouponCollection.h"

@interface CouponsCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) ModelMemberSaleCouponCollection *model;

@end
