//
//  ClassificationMainCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopLayerCollectionModel.h"

@interface ClassificationMainCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) TopLayerCollectionModel *model;

@end
