//
//  OrderDetailsProductCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelSaleOrderGoodsDetailCollection.h"

@interface OrderDetailsProductCell : UITableViewCell

@property (nonatomic, strong) ModelSaleOrderGoodsDetailCollection *model;

+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
