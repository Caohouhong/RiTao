//
//  XiaoShouDingDanOneLevelCell_3.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "XiaoShouDingDanOneLevelCell_3.h"

@implementation XiaoShouDingDanOneLevelCell_3


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (XiaoShouDingDanOneLevelCell_3 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"XiaoShouDingDanOneLevelCell_3";
    XiaoShouDingDanOneLevelCell_3 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[XiaoShouDingDanOneLevelCell_3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"客户名：按时打算达到";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    UILabel *shouHuoRenLabel = [[UILabel alloc] init];
    shouHuoRenLabel.font = [UIFont systemFontOfSize:12];
    shouHuoRenLabel.textColor = HEXCOLOR(0x333333);
    shouHuoRenLabel.text = @"收货人：是的是的SD";
    shouHuoRenLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:shouHuoRenLabel];
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.textColor = HEXCOLOR(0x333333);
    addressLabel.text = @"收货地址：as打扫打扫打扫打扫大时代撒旦";
    addressLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:addressLabel];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .heightIs(15);
    
    shouHuoRenLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(titleLabel,5)
    .heightIs(15);
    
    addressLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(shouHuoRenLabel,5)
    .heightIs(15);
}

@end
