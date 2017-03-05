//
//  SettlementShengfenCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelWfxPrepareSaleOrder.h"
#import "ModelIDCardCollection.h"

@interface SettlementShengfenCell : UITableViewCell

@property (nonatomic, strong) ModelWfxPrepareSaleOrder *model;
@property (nonatomic, strong) ModelIDCardCollection *model2;

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
