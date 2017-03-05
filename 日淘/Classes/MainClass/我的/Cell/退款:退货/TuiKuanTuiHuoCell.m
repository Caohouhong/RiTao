//
//  TuiKuanTuiHuoCell.m
//  日淘
//
//  Created by 李强 on 2017/2/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "TuiKuanTuiHuoCell.h"

@implementation TuiKuanTuiHuoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (TuiKuanTuiHuoCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"TuiKuanTuiHuoCell";
    TuiKuanTuiHuoCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[TuiKuanTuiHuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:1 backgroundColor:HEXCOLOR(0xeeeeee)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x898989);
    titleLabel.text = @"售后单号：1222222222";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    
    UILabel *stateLabel = [[UILabel alloc] init];
    stateLabel.font = [UIFont systemFontOfSize:14];
    stateLabel.textColor = HEXCOLOR(0x333333);
    stateLabel.text = @"退款中";
    stateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:stateLabel];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,100)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
    stateLabel.sd_layout
    .leftSpaceToView(titleLabel,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
}

@end
