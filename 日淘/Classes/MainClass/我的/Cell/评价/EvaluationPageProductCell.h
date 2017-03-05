//
//  EvaluationPageProductCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/23.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationPageProductCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) BaseModel *model;


@end
