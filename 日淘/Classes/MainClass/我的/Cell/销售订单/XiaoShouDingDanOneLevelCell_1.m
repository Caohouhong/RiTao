//
//  XiaoShouDingDanOneLevelCell_1.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "XiaoShouDingDanOneLevelCell_1.h"

@implementation XiaoShouDingDanOneLevelCell_1


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (XiaoShouDingDanOneLevelCell_1 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"XiaoShouDingDanOneLevelCell_1";
    XiaoShouDingDanOneLevelCell_1 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[XiaoShouDingDanOneLevelCell_1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    UILabel *fenXiaoShangLabel = [[UILabel alloc] init];
    fenXiaoShangLabel.font = [UIFont systemFontOfSize:14];
    fenXiaoShangLabel.textColor = HEXCOLOR(0x333333);
    fenXiaoShangLabel.text = @"分销商:   王伍仁 (12345678909)";
    fenXiaoShangLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:fenXiaoShangLabel];
    
    fenXiaoShangLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,15);
    
}

@end
