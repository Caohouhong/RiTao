//
//  OrderDetailsXinXiCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelWfxSaleOrderDetail.h"

typedef void(^CancleOrderSuccessBlock)();

@interface OrderDetailsXinXiCell : UITableViewCell

@property (nonatomic, strong) ModelWfxSaleOrderDetail *model;
@property (nonatomic, copy) CancleOrderSuccessBlock cancleOrderSuccessBlock;

+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
