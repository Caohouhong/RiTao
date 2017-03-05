//
//  LogisticsDetailTopCell.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LogisticsDetailTopCell.h"

@interface LogisticsDetailTopCell ()<MLEmojiLabelDelegate>

@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) MLEmojiLabel *contentLabel;

@end

@implementation LogisticsDetailTopCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LogisticsDetailTopCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LogisticsDetailTopCell";
    LogisticsDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LogisticsDetailTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:40 rightMargin:10 lineHeight:0.5];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"yuan"];
    [self.contentView addSubview:iconImageView];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self.contentView addSubview:lineView];
    
    
    MLEmojiLabel *contentLabel = [[MLEmojiLabel alloc] initWithFrame:CGRectMake(40, 10, ScreenWidth - 40-15, 20)];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = HEXCOLOR(0x333333);
    [contentLabel preferredSizeWithMaxWidth:ScreenWidth - 40-15];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.delegate = self;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = HEXCOLOR(0x999999);
    dateLabel.text = @"2016-10-10 10:10";
    dateLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,13)
    .widthIs(7)
    .heightIs(7);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    lineView.sd_layout
    .centerXEqualToView(iconImageView)
    .topSpaceToView(iconImageView,0)
    .bottomSpaceToView(self.contentView,0)
    .widthIs(0.5);
    
//    contentLabel.sd_layout
//    .leftSpaceToView(self.contentView,40)
//    .topSpaceToView(self.contentView,10)
//    .rightSpaceToView(self.contentView,15)
//    .autoHeightRatio(0);
    
    dateLabel.sd_layout
    .leftEqualToView(contentLabel)
    .rightEqualToView(contentLabel)
    .heightIs(12)
    .topSpaceToView(contentLabel,15);
}

- (void)setModel:(ModelLogisticsSheetDetailTable *)model
{
    _model = model;
    
    self.contentLabel.text = [NSString stringWithFormat:@"%@",model.Content];
    [self.contentLabel sizeToFit];
    
    
    self.dateLabel.text = model.RefreshTime;
    
    
    [self setupAutoHeightWithBottomView:self.dateLabel bottomMargin:10];
}

@end
