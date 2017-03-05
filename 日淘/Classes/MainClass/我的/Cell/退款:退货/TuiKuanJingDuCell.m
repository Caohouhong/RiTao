//
//  TuiKuanJingDuCell.m
//  日淘
//
//  Created by 李强 on 2017/2/10.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "TuiKuanJingDuCell.h"

@implementation TuiKuanJingDuCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (TuiKuanJingDuCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"TuiKuanJingDuCell";
    TuiKuanJingDuCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[TuiKuanJingDuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:10 backgroundColor:HEXCOLOR(0xeeeeee)];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = HEXCOLOR(0x333333);
    label1.text = @"售后单号：123123123123";
    label1.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:12];
    label2.textColor = HEXCOLOR(0x333333);
    label2.text = @"申请时间：1234-23-23 23:23:21";
    label2.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:label2];
    
    label1.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .heightIs(18);
    
    label2.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(label1,15)
    .rightSpaceToView(self.contentView,15)
    .heightIs(18);
}


@end
