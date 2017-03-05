//
//  MyCollectionCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelMasterSaleProductCollection.h"


@interface MyCollectionCell : UITableViewCell

+ (MyCollectionCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelMasterSaleProductCollection *model;


@end
