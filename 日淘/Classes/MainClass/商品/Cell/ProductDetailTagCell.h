//
//  ProductDetailTagCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define productDetailTagViewItemH 100

@interface ProductDetailTagCell : UITableViewCell

+ (ProductDetailTagCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray;

@end
