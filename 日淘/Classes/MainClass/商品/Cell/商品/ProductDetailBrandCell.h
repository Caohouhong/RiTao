//
//  ProductDetailBrandCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  推荐的品牌

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

typedef void(^ProductDetailBrandCellBlock)(NSString *);
typedef void(^seeMoreProductBlock)(NSString *);

@interface ProductDetailBrandCell : UITableViewCell

@property (nonatomic, strong) ModelSaleProductDetail *model;
@property (nonatomic, copy)ProductDetailBrandCellBlock brandCellBlock;

@property (nonatomic, copy)seeMoreProductBlock seeMoreBlock;

+ (ProductDetailBrandCell *)cellWithTableView:(UITableView *)tableView;

@end
