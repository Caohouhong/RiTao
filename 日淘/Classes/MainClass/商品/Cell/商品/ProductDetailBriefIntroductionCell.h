//
//  ProductDetailBriefIntroductionCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  商品标题和简介

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailBriefIntroductionCell : UITableViewCell


@property (nonatomic, strong) ModelSaleProductDetail *model;

+ (ProductDetailBriefIntroductionCell *)cellWithTableView:(UITableView *)tableView;

@end
