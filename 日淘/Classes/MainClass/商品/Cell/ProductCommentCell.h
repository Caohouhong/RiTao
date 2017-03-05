//
//  ProductCommentCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

// 商品评论

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductCommentCell : UITableViewCell

@property (nonatomic, strong) ModelSaleProductCommentDetail *model;

+ (ProductCommentCell *)cellWithTableView:(UITableView *)tableView;

@end
