//
//  ReceiptAddressCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReceiptAddressModel.h"


typedef void(^removeBtnClick)(AddReceiptAddressModel *model);
typedef void(^selectedBtnClick)(AddReceiptAddressModel *model);

@interface ReceiptAddressCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, strong) AddReceiptAddressModel *model;

@property (nonatomic, copy) removeBtnClick removeBlock;
@property (nonatomic, copy) selectedBtnClick selectedBlock;

@end
