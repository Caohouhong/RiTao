//
//  ProductDetailHaveChooseCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  已选

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailHaveChooseCell : UITableViewCell


@property (nonatomic, strong) ModelSaleProductDetail *model;

+ (ProductDetailHaveChooseCell *)cellWithTableView:(UITableView *)tableView;

@end
