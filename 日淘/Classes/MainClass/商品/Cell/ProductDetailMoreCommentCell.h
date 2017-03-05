//
//  ProductDetailMoreCommentCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

// 查看更多评论

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@interface ProductDetailMoreCommentCell : UITableViewCell


@property (nonatomic, strong) ModelSaleProductDetail *model;

+ (ProductDetailMoreCommentCell *)cellWithTableView:(UITableView *)tableView;

@end
