//
//  ProductDetailPriceCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

// 商品价格和标签

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailPriceCell : UITableViewCell

@property (nonatomic, strong) ModelSaleProductDetail *model;
@property (nonatomic, strong) ModelSaleProductDetail *model2;

+ (ProductDetailPriceCell *)cellWithTableView:(UITableView *)tableView;

@end
