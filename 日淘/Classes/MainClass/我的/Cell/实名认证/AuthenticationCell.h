//
//  AuthenticationCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelIDCardCollection.h"

typedef void(^removeBtnClick)(ModelIDCardCollection *model);
typedef void(^selectedBtnClick)(ModelIDCardCollection *model);

@interface AuthenticationCell : UITableViewCell

@property (nonatomic, copy) removeBtnClick removeBlock;
@property (nonatomic, copy) selectedBtnClick selectedBlock;

@property (nonatomic, strong) ModelIDCardCollection *model;

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
