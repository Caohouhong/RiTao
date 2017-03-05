//
//  AddReceiptAddressCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReceiptAddressModel.h"

#define titleArray @[@"收货人", @"手机号码", @"省市区", @"详细地址", @"默认地址"]
#define placeholderArray @[@"请输入收货人姓名",@"请输入收货人手机号",@"",@"请输入收货人详细地址",@""]


@interface AddReceiptAddressCell : UITableViewCell

@property (nonatomic, strong) AddReceiptAddressModel *model;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UITextField *textfield;
@property (nonatomic, weak) UIButton *positionBtn;
@property (nonatomic, weak) UIButton *switchBtn;
//@property (nonatomic, weak) UISwitch *switchBtn;

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
