//
//  MyCollectionCell.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyCollectionCell.h"

@interface MyCollectionCell ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *nowPriceLabel;
@property (nonatomic, weak) UILabel *oldPriceLabel;
@property (nonatomic, weak) UILabel *baoYouLabel;
@property (nonatomic, weak) UILabel *manJianLabel;
@end

@implementation MyCollectionCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MyCollectionCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MyCollectionCell";
    MyCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MyCollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    //iconImageView.backgroundColor = HEXCOLOR(0x999999);
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *newPriceLabel = [[UILabel alloc] init];
    newPriceLabel.font = [UIFont systemFontOfSize:16];
    newPriceLabel.textColor = COLOR_Red;
    newPriceLabel.text = @"￥9999";
    [self.contentView addSubview:newPriceLabel];
    self.nowPriceLabel = newPriceLabel;
    
    UILabel *oldPriceLabel = [[UILabel alloc] init];
    oldPriceLabel.font = [UIFont systemFontOfSize:12];
    oldPriceLabel.textColor = HEXCOLOR(0x999999);
    oldPriceLabel.text = @"￥9999";
    [self.contentView addSubview:oldPriceLabel];
    self.oldPriceLabel = oldPriceLabel;
    
    UILabel *baoYouLabel = [[UILabel alloc] init];
    baoYouLabel.font = [UIFont systemFontOfSize:8];
    baoYouLabel.textColor = COLOR_Red;
    baoYouLabel.text = @"包邮";
    baoYouLabel.textAlignment = NSTextAlignmentCenter;
    baoYouLabel.layer.cornerRadius = 3;
    baoYouLabel.layer.borderColor = COLOR_Red.CGColor;
    baoYouLabel.layer.borderWidth = 0.5;
    [self.contentView addSubview:baoYouLabel];
    self.baoYouLabel = baoYouLabel;
    
    UILabel *manJianLabel = [[UILabel alloc] init];
    manJianLabel.font = [UIFont systemFontOfSize:8];
    manJianLabel.textColor = COLOR_Red;
    manJianLabel.text = @"满减";
    manJianLabel.textAlignment = NSTextAlignmentCenter;
    manJianLabel.layer.cornerRadius = 3;
    manJianLabel.layer.borderColor = COLOR_Red.CGColor;
    manJianLabel.layer.borderWidth = 0.5;
    [self.contentView addSubview:manJianLabel];
    self.manJianLabel = manJianLabel;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"basket"] forState:UIControlStateNormal];
    [self.contentView  addSubview:btn];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(80)
    .widthIs(80);
    
    titleLabel.sd_layout
    .leftSpaceToView(iconImageView,5)
    .topEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [titleLabel setMaxNumberOfLinesToShow:2];
    
    newPriceLabel.sd_layout
    .leftSpaceToView(iconImageView,5)
    .bottomEqualToView(iconImageView)
    .heightIs(18);
    [newPriceLabel setSingleLineAutoResizeWithMaxWidth:60];
    
    oldPriceLabel.sd_layout
    .leftSpaceToView(newPriceLabel,3)
    .bottomEqualToView(newPriceLabel)
    .heightIs(16);
    [oldPriceLabel setSingleLineAutoResizeWithMaxWidth:60];
    
    baoYouLabel.sd_layout
    .leftSpaceToView(oldPriceLabel,5)
    .centerYEqualToView(newPriceLabel)
    .heightIs(12)
    .widthIs(20);
    
    manJianLabel.sd_layout
    .leftSpaceToView(baoYouLabel,5)
    .centerYEqualToView(newPriceLabel)
    .heightIs(12)
    .widthIs(20);
    
    btn.sd_layout
    .rightEqualToView(titleLabel)
    .bottomEqualToView(iconImageView)
    .heightIs(18)
    .widthIs(20);
    
}

-(void)setModel:(ModelMasterSaleProductCollection *)model {
    _model = model;
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    
    NSLog(@"=================>%@",IMAGE_URL(model.Picture));
    
    
    self.titleLabel.text = model.Description;
    
    NSString *priceStr = [NSString strWhithFloat:[model.Price.Value floatValue]];
    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@%@",model.Price.MoneySymbol,priceStr];
    
    
    
    NSString *priceStr1 = [NSString strWhithFloat:[model.MarketPrice.Value floatValue]];
    NSString *str = [NSString stringWithFormat:@"%@%@",model.MarketPrice.MoneySymbol,priceStr1];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
    self.oldPriceLabel.attributedText = attribtStr;
    
    self.baoYouLabel.hidden = TSTRING(model.DeliveryTag)?NO:YES;
    self.baoYouLabel.text = model.DeliveryTag;
    
    self.manJianLabel.hidden = TSTRING(model.CouponTag)?NO:YES;
    self.manJianLabel.text = model.CouponTag;
}



@end
