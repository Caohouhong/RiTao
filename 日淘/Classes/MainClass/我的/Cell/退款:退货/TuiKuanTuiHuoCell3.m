//
//  TuiKuanTuiHuoCell3.m
//  日淘
//
//  Created by 李强 on 2017/2/9.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "TuiKuanTuiHuoCell3.h"

@implementation TuiKuanTuiHuoCell3


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (TuiKuanTuiHuoCell3 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"TuiKuanTuiHuoCell3";
    TuiKuanTuiHuoCell3 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[TuiKuanTuiHuoCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:5 backgroundColor:HEXCOLOR(0xeeeeee)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"交易金额￥123    退款金额￥123";
    titleLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:titleLabel];
    
    titleLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .widthIs(200)
    .heightIs(25);
}

@end
