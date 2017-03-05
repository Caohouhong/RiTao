//
//  OrderProductCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelSaleOrderGoodsDetailCollection.h"

@interface OrderProductCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) ModelSaleOrderGoodsDetailCollection *model;

@end
