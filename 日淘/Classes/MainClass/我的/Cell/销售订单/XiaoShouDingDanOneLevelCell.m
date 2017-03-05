//
//  XiaoShouDingDanOneLevelCell.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "XiaoShouDingDanOneLevelCell.h"
#import "ModelLastLogisticsSheetDetail.h"

@interface XiaoShouDingDanOneLevelCell()

@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *stateLabel;


@property (nonatomic, weak) UILabel *fenXiaoShangLabel;
@property (nonatomic, weak) UILabel *biaotiLabel;
@property (nonatomic, weak) UILabel *kehuLabel;
@property (nonatomic, weak) UILabel *shouHuoRenLabel;
@property (nonatomic, weak) UILabel *addressLabel;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIImageView *iconimageview;
@end

@implementation XiaoShouDingDanOneLevelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (XiaoShouDingDanOneLevelCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"XiaoShouDingDanOneLevelCell";
    XiaoShouDingDanOneLevelCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[XiaoShouDingDanOneLevelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
   [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = HEXCOLOR(0x999999);
    dateLabel.text = @"12-03 12:12";
    dateLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:10];
    priceLabel.textColor = HEXCOLOR(0x333333);
    priceLabel.text = @"+ ￥19.99";
    priceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"一级订单：wdf201612120001";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *stateLabel = [[UILabel alloc] init];
    stateLabel.font = [UIFont systemFontOfSize:12];
    stateLabel.textColor = HEXCOLOR(0x333333);
    stateLabel.text = @"已付款(未结算)";
    stateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:stateLabel];
    self.stateLabel = stateLabel;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"xiaarr"];
    [self.contentView addSubview:arrowImageView];
    
    dateLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .widthIs(100)
    .heightIs(18);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,25)
    //.centerYEqualToView(self.contentView)
    .widthIs(15)
    .heightIs(10);
    
    priceLabel.sd_layout
    .rightSpaceToView(arrowImageView,10)
    .topEqualToView(dateLabel)
    .bottomEqualToView(dateLabel)
    .leftSpaceToView(dateLabel,10);
    
    titleLabel.sd_layout
    .leftEqualToView(dateLabel)
    .topSpaceToView(dateLabel,15)
    .heightIs(18);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:180];
    
    stateLabel.sd_layout
    .leftSpaceToView(titleLabel,10)
    .rightEqualToView(priceLabel)
    .topEqualToView(titleLabel)
    .bottomEqualToView(titleLabel);
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"+" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:HEXCOLOR(0x999999)}];
    [att appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"￥19.99" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:HEXCOLOR(0x333333)}]];
    priceLabel.attributedText = att;
    
    NSMutableAttributedString *att2 = [[NSMutableAttributedString alloc] initWithString:@"已付款" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:COLOR_Red}];
    [att2 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"(未结算)" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:HEXCOLOR(0x999999)}]];
    stateLabel.attributedText = att2;
    
    
    //[self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    UILabel *fenXiaoShangLabel = [[UILabel alloc] init];
    fenXiaoShangLabel.font = [UIFont systemFontOfSize:14];
    fenXiaoShangLabel.textColor = HEXCOLOR(0x333333);
    fenXiaoShangLabel.text = @"分销商:   王伍仁 (12345678909)";
    fenXiaoShangLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:fenXiaoShangLabel];
    self.fenXiaoShangLabel = fenXiaoShangLabel;
    
    fenXiaoShangLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.titleLabel,8.5)
    .rightSpaceToView(self.contentView,15).heightIs(18);
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(fenXiaoShangLabel,8.5)
    .rightSpaceToView(self.contentView,15).heightIs(0.5);
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconimageview = iconImageView;
    
    UILabel *biaotiLabel = [[UILabel alloc] init];
    biaotiLabel.font = [UIFont systemFontOfSize:14];
    biaotiLabel.textColor = HEXCOLOR(0x333333);
    biaotiLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    biaotiLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:biaotiLabel];
    self.biaotiLabel = biaotiLabel;
    
    iconImageView.sd_layout
    .topSpaceToView(lineView,10)
    .leftSpaceToView(self.contentView,15)
    .widthIs(60)
    .heightIs(60);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    biaotiLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    
    UILabel *kehuLabel = [[UILabel alloc] init];
    kehuLabel.font = [UIFont systemFontOfSize:12];
    kehuLabel.textColor = HEXCOLOR(0x333333);
    kehuLabel.text = @"客户名：";
    kehuLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:kehuLabel];
    self.kehuLabel = kehuLabel;
    
    UILabel *shouHuoRenLabel = [[UILabel alloc] init];
    shouHuoRenLabel.font = [UIFont systemFontOfSize:12];
    shouHuoRenLabel.textColor = HEXCOLOR(0x333333);
    shouHuoRenLabel.text = @"收货人：";
    shouHuoRenLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:shouHuoRenLabel];
    self.shouHuoRenLabel = shouHuoRenLabel;
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.textColor = HEXCOLOR(0x333333);
    addressLabel.text = @"收货地址：";
    addressLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    kehuLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(iconImageView,20)
    .heightIs(15);
    
    shouHuoRenLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(kehuLabel,5)
    .heightIs(15);
    
    addressLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(shouHuoRenLabel,5)
    .heightIs(15);

    
}

- (void)setModel:(ModelTaoKeSaleOrderCollection *)model
{
    _model = model;
    
    self.dateLabel.text = model.SaleDate;

    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.SaleProfit.MoneySymbol,model.SaleProfit.Value];

    self.titleLabel.text = model.SaleOrderID;
    self.stateLabel.text = model.SaleOrderStatus;
    
    if(model.IsClearing) {
        self.fenXiaoShangLabel.hidden = NO;
        self.lineView.hidden = NO;
        self.iconimageview.hidden = NO;
        self.biaotiLabel.hidden = NO;
        self.kehuLabel.hidden = NO;
        self.shouHuoRenLabel.hidden = NO;
        self.addressLabel.hidden = NO;
    }else {
        self.fenXiaoShangLabel.hidden = YES;
        self.lineView.hidden = YES;
        self.iconimageview.hidden = YES;
        self.biaotiLabel.hidden = YES;
        self.kehuLabel.hidden = YES;
        self.shouHuoRenLabel.hidden = YES;
        self.addressLabel.hidden = YES;
    }
}

-(void)setModel2:(ModelTaoKeSaleOrderDetail *)model2 {
    _model2  = model2;
    
    self.fenXiaoShangLabel.text = [NSString stringWithFormat:@"分销商: %@ (%@)",model2.VIPName, model2.VIPTelephone];
    [self.iconimageview sd_setImageWithURL:IMAGE_URL(model2.VIPName) placeholderImage:nil];
    
    self.biaotiLabel.text = model2.LastLogisticsSheetDetail.Content;
    
    self.kehuLabel.text = [NSString stringWithFormat:@"客户名：%@",model2.BuyerName];
    self.shouHuoRenLabel.text = [NSString stringWithFormat:@"收货人：%@",model2.Consignee];
    self.addressLabel.text = [NSString stringWithFormat:@"收货地址：%@",model2.ConsigneeAddress];
    
}


@end
