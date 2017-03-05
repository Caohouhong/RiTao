//
//  SpecialDetailsCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelTopicProductCollection.h"
#import "ModelMasterSaleProductCollection.h"

typedef void(^ClickShopCarButton)();

@interface SpecialDetailsCell : UICollectionViewCell

@property (nonatomic, copy) ClickShopCarButton shopcarBlock;

@property (nonatomic, strong) ModelTopicProductCollection *model;
@property (nonatomic, strong) ModelMasterSaleProductCollection *model2;
@end
