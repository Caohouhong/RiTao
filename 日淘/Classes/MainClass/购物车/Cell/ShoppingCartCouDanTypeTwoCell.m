//
//  ShoppingCartCouDanTypeTwoCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartCouDanTypeTwoCell.h"

@interface ShoppingCartCouDanTypeTwoCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIButton *couDanBtn;
@end

@implementation ShoppingCartCouDanTypeTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShoppingCartCouDanTypeTwoCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartCouDanTypeTwoCell";
    ShoppingCartCouDanTypeTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartCouDanTypeTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"you"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x999999);
    titleLabel.text = @"还差50元可享商家159元包邮";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.nameLabel = titleLabel;
    
    UIButton *couDanBtn = [[UIButton alloc] init];
    [couDanBtn setTitle:@"去凑单 >" forState:UIControlStateNormal];
    [couDanBtn setTitleColor:HEXCOLOR(0xdf596a) forState:UIControlStateNormal];
    couDanBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    couDanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    couDanBtn.enabled = NO;
    [self.contentView addSubview:couDanBtn];
    self.couDanBtn = couDanBtn;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,45)
    .centerYEqualToView(self.contentView)
    .heightIs(15)
    .widthIs(15);
    
    titleLabel.sd_layout
    .leftSpaceToView(iconImageView,5)
    .centerYEqualToView(self.contentView)
    .heightIs(20);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth - 50 - 80];
    
    couDanBtn.sd_layout
    .leftSpaceToView(titleLabel,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(60);
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
}


-(void)setModel:(ModelWfxMemberShopCartDeliveryCollection *)model {
    _model = model;
    self.nameLabel.text  = model.DeilveryDescription;
    
    
    if (model.IsFreeDelivery)
    {
        self.iconImageView.image = [UIImage imageNamed:@"mian"];
        self.couDanBtn .hidden = YES;
    }else{
        self.iconImageView.image = [UIImage imageNamed:@"you"];
        self.couDanBtn .hidden = NO;
    }
    
    
}



@end
