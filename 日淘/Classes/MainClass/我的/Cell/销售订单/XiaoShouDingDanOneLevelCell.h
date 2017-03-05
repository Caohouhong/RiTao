//
//  XiaoShouDingDanOneLevelCell.h
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelTaoKeSaleOrderCollection.h"
#import "ModelTaoKeSaleOrderDetail.h"

typedef void(^clickBtn)();

@interface XiaoShouDingDanOneLevelCell : UITableViewCell

@property (nonatomic, strong) ModelTaoKeSaleOrderCollection *model;
@property (nonatomic, strong) ModelTaoKeSaleOrderDetail *model2;

+ (XiaoShouDingDanOneLevelCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) clickBtn block;

@end
