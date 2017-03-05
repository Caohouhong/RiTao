//
//  PayOrderSecondCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iconArray  @[@"ZHIFU",@"WEIXIN"]
#define TopArray  @[@"支付宝",@"微信支付"]
#define BottomArray  @[@"支付宝支付,更快捷,更方便",@"亿万用户的选择,更快更安全"]


@interface PayOrderSecondCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview ;

@property (nonatomic, weak) UIImageView *iconimageView;
@property (nonatomic, weak) UILabel *shangLabel;
@property (nonatomic, weak) UILabel *xiaLabel;
@property (nonatomic, weak) UIButton *selectBtn;

@end
