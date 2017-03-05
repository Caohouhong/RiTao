//
//  MainRecommendShopCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainRecommendShopCell.h"

@interface MainRecommendShopCell()
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *renLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *oldpriceLabel;
@property (nonatomic, weak) UILabel *baoYouLabel;
@property (nonatomic, weak) UILabel *manJianLabel;
@end

@implementation MainRecommendShopCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"MainRecommendShopCell";
    MainRecommendShopCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MainRecommendShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
        [self initView];
    }
    return self;
}

-(void)initView {
    
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:5 backgroundColor:HEXCOLOR(0xeeeeee)];
    
    UIView *bgV = [[UIView alloc] init];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgV];
    
    bgV.sd_layout
    .leftSpaceToView(self.contentView,5)
    .rightSpaceToView(self.contentView,5)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,5);
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    iconImageView.backgroundColor = [UIColor lightGrayColor];
    [bgV addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    titleLabel.font = TFont(13);
    [bgV addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *baoYouLabel = [[UILabel alloc] init];
    baoYouLabel.font = [UIFont systemFontOfSize:10];
    baoYouLabel.textColor = COLOR_Red;
    baoYouLabel.text = @"包邮";
    baoYouLabel.textAlignment = NSTextAlignmentCenter;
    baoYouLabel.layer.cornerRadius = 5;
    baoYouLabel.layer.borderColor = COLOR_Red.CGColor;
    baoYouLabel.layer.borderWidth = 0.5;
    baoYouLabel.hidden = YES;
    [bgV addSubview:baoYouLabel];
    self.baoYouLabel = baoYouLabel;
    
    UILabel *manJianLabel = [[UILabel alloc] init];
    manJianLabel.font = [UIFont systemFontOfSize:10];
    manJianLabel.textColor = COLOR_Red;
    manJianLabel.text = @"满减";
    manJianLabel.textAlignment = NSTextAlignmentCenter;
    manJianLabel.layer.cornerRadius = 5;
    manJianLabel.layer.borderColor = COLOR_Red.CGColor;
    manJianLabel.layer.borderWidth = 0.5;
    manJianLabel.hidden = YES;
    [bgV addSubview:manJianLabel];
    self.manJianLabel = manJianLabel;
    
    UILabel *renLabel = [[UILabel alloc]init];
    renLabel.text = @"999人已购买";
    renLabel.textColor = [UIColor lightGrayColor];
    renLabel.font = TFont(11);
    [bgV addSubview:renLabel];
    self.renLabel = renLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥999";
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = TFont(18);
    priceLabel.isAttributedContent = YES;
    [bgV addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *oldpriceLabel = [[UILabel alloc]init];
    //oldpriceLabel.text = @"￥999";
    oldpriceLabel.textColor = [UIColor grayColor];
    oldpriceLabel.font = TFont(11);
    [bgV addSubview:oldpriceLabel];
    self.oldpriceLabel = oldpriceLabel;
    
    UIButton *carBtn = [[UIButton alloc]init];
    [carBtn setImage:GETIMAGE(@"gouwuche1") forState:UIControlStateNormal];
    [carBtn addTarget:self action:@selector(clickcarbtn) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:carBtn];
    
//    UIImageView *carimageView = [[UIImageView alloc]init];
//    carimageView.contentMode = UIViewContentModeScaleAspectFit;
//    carimageView.image = [UIImage imageNamed:@"basket"];
//    [self.contentView addSubview:carimageView];
    
    iconImageView.sd_layout
    .leftSpaceToView(bgV,0)
    .bottomSpaceToView(bgV,0)
    .topSpaceToView(bgV,0)
    .widthEqualToHeight();
    
    titleLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .rightSpaceToView(bgV,10)
    .topSpaceToView(bgV,15)
    .heightIs(15).autoHeightRatio(0);
    [titleLabel setMaxNumberOfLinesToShow:2];
    
    baoYouLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topSpaceToView(titleLabel,3)
    .heightIs(13).widthIs(25);
    
    manJianLabel.sd_layout
    .leftSpaceToView(baoYouLabel,2)
    .centerYEqualToView(baoYouLabel)
    .heightIs(13).widthIs(25);
    
    renLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .bottomSpaceToView(bgV,10)
    .rightSpaceToView(bgV,50)
    .heightIs(15);
    
    priceLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .bottomSpaceToView(renLabel,0)
    .heightIs(20);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    oldpriceLabel.sd_layout
    .leftSpaceToView(priceLabel,2)
    .bottomEqualToView(priceLabel)
    .heightIs(15);
    [oldpriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    carBtn.sd_layout
    .rightSpaceToView(bgV,10)
    .bottomSpaceToView(bgV,10)
    .heightIs(20).widthIs(20);

}

-(void)clickcarbtn {
    if(self.carBlock) {
        self.carBlock();
    }
}


-(void)setModel:(ModelMasterSaleProductCollection *)model {
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    
    self.titleLabel.text = model.Description;
    
    self.renLabel.text = [NSString stringWithFormat:@"%@人已购买",TSTRING(model.SoldCount)?model.SoldCount:@"0"];
    
    
    NSString *priceStr = [NSString strWhithFloat:[model.Price.Value floatValue]];
    priceStr = [NSString stringWithFormat:@"%@%@",model.Price.MoneySymbol,priceStr];
    NSMutableAttributedString *priceAtt = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [priceAtt setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} range:[priceStr rangeOfString:model.Price.MoneySymbol]];
    self.priceLabel.attributedText = priceAtt;
    
    
    NSString *priceStr1 = [NSString strWhithFloat:[model.MarketPrice.Value floatValue]];
    NSString *str = [NSString stringWithFormat:@"%@%@",model.MarketPrice.MoneySymbol,priceStr1];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
     self.oldpriceLabel.attributedText = attribtStr;
    
    self.baoYouLabel.hidden = TSTRING(model.DeliveryTag)?NO:YES;
    self.baoYouLabel.text = model.DeliveryTag;
    
    self.manJianLabel.hidden = TSTRING(model.CouponTag)?NO:YES;
    self.manJianLabel.text = model.CouponTag;

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
