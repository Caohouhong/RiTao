//
//  ShoppingBackViewCell.h
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickbtn)();

@interface ShoppingBackViewCell : UITableViewCell

@property (nonatomic, copy) clickbtn block;
+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
