//
//  MeMainCell_2.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_2.h"

@implementation MeMainCell_2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_2";
    MeMainCell_2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"我的订单";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = HEXCOLOR(0x999999);
    contentLabel.text = @"查看全部订单";
    contentLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:contentLabel];
    
    UIImageView *moreImageView = [[UIImageView alloc] init];
    moreImageView.image = [UIImage imageNamed:@"jiantou"];
    [self.contentView addSubview:moreImageView];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerXEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(70);
    
    moreImageView.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(6)
    .heightIs(8);
    
    contentLabel.sd_layout
    .rightSpaceToView(moreImageView,5)
    .centerYEqualToView(self.contentView)
    .heightRatioToView(titleLabel,1)
    .rightSpaceToView(moreImageView,10);
    
    [self addUnderlineWithLeftMargin:1];
}

@end
