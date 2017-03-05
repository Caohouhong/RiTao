//
//  MyOrderEvaluateCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelSaleOrderGoodsDetailCollection.h"

typedef void(^clickshaidan)(ModelSaleOrderGoodsDetailCollection *model);
@interface MyOrderEvaluateCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, copy) clickshaidan shaidanBlock;

@property (nonatomic, strong) ModelSaleOrderGoodsDetailCollection *model;

@end
