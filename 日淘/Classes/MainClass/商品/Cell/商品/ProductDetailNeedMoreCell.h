//
//  ProductDetailNeedMoreCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

// 您也许还需要

#import <UIKit/UIKit.h>

typedef void(^ProductDetailNeedMoreCellBlock)(NSString *);

#define ProductViewHeight  (ScreenWidth - 60)/3 + 60

@interface ProductDetailNeedMoreCell : UITableViewCell

@property (nonatomic, copy) ProductDetailNeedMoreCellBlock needMoreBlock;

+ (ProductDetailNeedMoreCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray;

@end
