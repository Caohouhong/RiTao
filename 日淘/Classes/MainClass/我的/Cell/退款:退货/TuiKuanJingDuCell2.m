//
//  TuiKuanJingDuCell2.m
//  日淘
//
//  Created by 李强 on 2017/2/10.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "TuiKuanJingDuCell2.h"

@implementation TuiKuanJingDuCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (TuiKuanJingDuCell2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"TuiKuanJingDuCell2";
    TuiKuanJingDuCell2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[TuiKuanJingDuCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:45 rightMargin:0 lineHeight:0.5 backgroundColor:HEXCOLOR(0x999999)];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HEXCOLOR(0x999999);
    [self.contentView addSubview:lineView];
    
    UIImageView *rotImageView = [[UIImageView alloc] init];
    rotImageView.backgroundColor = HEXCOLOR(0x999999);
    [self.contentView addSubview:rotImageView];
    
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = HEXCOLOR(0x898989);
    contentLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = HEXCOLOR(0x898989);
    timeLabel.text = @"2016-12-12 12:12:12";
    timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:timeLabel];
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,20)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(0.5);
    
    rotImageView.sd_layout
    .centerXEqualToView(lineView)
    .topSpaceToView(self.contentView,18)
    .widthIs(4)
    .heightIs(4);
    rotImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    contentLabel.sd_layout
    .leftSpaceToView(lineView,25)
    .topSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    
    timeLabel.sd_layout
    .leftEqualToView(contentLabel)
    .rightEqualToView(contentLabel)
    .topSpaceToView(contentLabel,15)
    .autoHeightRatio(0);
}

@end
