//
//  ShoppingCartCouDanTypeThreeCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartCouDanTypeThreeCell.h"

@implementation ShoppingCartCouDanTypeThreeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShoppingCartCouDanTypeThreeCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartCouDanTypeThreeCell";
    ShoppingCartCouDanTypeThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartCouDanTypeThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *manJianLabel = [[UILabel alloc] init];
    manJianLabel.font = [UIFont systemFontOfSize:8];
    manJianLabel.textColor = HEXCOLOR(0xdf596a);
    manJianLabel.text = @"满减";
    manJianLabel.textAlignment = NSTextAlignmentCenter;
    manJianLabel.layer.cornerRadius = 3;
    manJianLabel.layer.borderColor = HEXCOLOR(0xdf596a).CGColor;
    manJianLabel.layer.borderWidth = 0.5;
    [self.contentView addSubview:manJianLabel];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x999999);
    titleLabel.text = @"还差50元可享商家159元包邮";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    UIButton *couDanBtn = [[UIButton alloc] init];
    [couDanBtn setTitle:@"去凑单 >" forState:UIControlStateNormal];
    [couDanBtn setTitleColor:HEXCOLOR(0xdf596a) forState:UIControlStateNormal];
    couDanBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    couDanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:couDanBtn];
    
    manJianLabel.sd_layout
    .leftSpaceToView(self.contentView,45)
    .centerYEqualToView(self.contentView)
    .heightIs(12)
    .widthIs(20);
    
    titleLabel.sd_layout
    .leftSpaceToView(manJianLabel,5)
    .centerYEqualToView(self.contentView)
    .heightIs(20);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth - 80 - 80];
    
    couDanBtn.sd_layout
    .leftSpaceToView(titleLabel,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(60);
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
}

@end
