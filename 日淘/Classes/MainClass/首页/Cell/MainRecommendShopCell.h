//
//  MainRecommendShopCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelMasterSaleProductCollection.h"

typedef void(^ClickCarBtn)();

@interface MainRecommendShopCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, copy) ClickCarBtn carBlock;

@property (nonatomic, strong) ModelMasterSaleProductCollection *model;

@end
