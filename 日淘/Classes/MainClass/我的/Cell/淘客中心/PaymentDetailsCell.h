//
//  PaymentDetailsCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBalanceOfPaymentDetailsCollection.h"

@interface PaymentDetailsCell : UITableViewCell

@property (nonatomic, strong) ModelBalanceOfPaymentDetailsCollection *model;

+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
