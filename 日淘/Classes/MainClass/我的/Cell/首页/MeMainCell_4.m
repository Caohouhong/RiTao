//
//  MeMainCell_4.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_4.h"

@implementation MeMainCell_4


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_4 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_4";
    MeMainCell_4 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_4 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"淘客中心";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = HEXCOLOR(0x999999);
    contentLabel.text = @"查看我的收益";
    contentLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:contentLabel];
    
    UIImageView *moreImageView = [[UIImageView alloc] init];
    moreImageView.image = [UIImage imageNamed:@"jiantou"];
    [self.contentView addSubview:moreImageView];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,0)
    .heightIs(45)
    .widthIs(70);
    
    moreImageView.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(titleLabel)
    .widthIs(6)
    .heightIs(8);
    
    contentLabel.sd_layout
    .rightSpaceToView(moreImageView,5)
    .centerYEqualToView(titleLabel)
    .heightRatioToView(titleLabel,1)
    .rightSpaceToView(moreImageView,10);
    
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:5];
}

@end
