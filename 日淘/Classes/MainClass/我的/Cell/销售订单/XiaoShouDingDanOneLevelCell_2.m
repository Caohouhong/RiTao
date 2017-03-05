//
//  XiaoShouDingDanOneLevelCell_2.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "XiaoShouDingDanOneLevelCell_2.h"

@implementation XiaoShouDingDanOneLevelCell_2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (XiaoShouDingDanOneLevelCell_2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"XiaoShouDingDanOneLevelCell_2";
    XiaoShouDingDanOneLevelCell_2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[XiaoShouDingDanOneLevelCell_2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(60)
    .heightIs(60);
    
    titleLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
}

@end
