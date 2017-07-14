//
//  ShoppingCartCouDanTypeOneCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartCouDanTypeOneCell.h"
#import "ModelSaleCoupon.h"

@interface ShoppingCartCouDanTypeOneCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *manLabel;
@end

@implementation ShoppingCartCouDanTypeOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShoppingCartCouDanTypeOneCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartCouDanTypeOneCell";
    ShoppingCartCouDanTypeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartCouDanTypeOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *manLabel = [[UILabel alloc] init];
    manLabel.font = [UIFont systemFontOfSize:11];
    manLabel.textColor = HEXCOLOR(0xdf596a);
    manLabel.text = @"满减";
    manLabel.textAlignment = NSTextAlignmentCenter;
    manLabel.layer.cornerRadius = 5;
    manLabel.layer.borderColor = HEXCOLOR(0xdf596a).CGColor;
    manLabel.layer.borderWidth = 1;
    [self.contentView addSubview:manLabel];
    self.manLabel = manLabel;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x999999);
    titleLabel.text = @"";
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
    
    manLabel.sd_layout
    .leftSpaceToView(self.contentView,45)
    .centerYEqualToView(self.contentView)
    .heightIs(15)
    .widthIs(30);
    
    titleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .heightIs(20);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth - 65 - 80];
    
    couDanBtn.sd_layout
    .leftSpaceToView(titleLabel,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(60);
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
}

-(void)setModel:(ModelWfxMemberShopCartSaleCouponCollection *)model {
    _model = model;
    
    self.nameLabel.text = model.SaleCouponDescription;
    
    if(!model.SaleCoupon.Indicator.length) {
        self.manLabel.hidden = YES;
        self.nameLabel.sd_layout.leftSpaceToView(self.contentView,45);
    }else {
        self.manLabel.hidden = NO;
        self.manLabel.text = model.SaleCoupon.Indicator;
        self.nameLabel.sd_layout.leftSpaceToView(self.manLabel,5);
    }
    
}

@end
