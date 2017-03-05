//
//  ProductView.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductView.h"

@interface ProductView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;
//@property (nonatomic, weak) UILabel *titleLabel2;
@property (nonatomic, weak) UILabel *nowPriceLabel;
@property (nonatomic, weak) UILabel *oldPriceLabel;

@property (nonatomic, strong) NSString *productID; //产品ID
@end

@implementation ProductView


- (instancetype)init
{
    if (self =[super init])
    {
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    iconImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
//    titleLabel.text = @"标题标题标题标题标标题标标题标标题标标题标题";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
//    UILabel *titleLabel2 = [[UILabel alloc] init];
//    titleLabel2.font = [UIFont systemFontOfSize:10];
//    titleLabel2.textColor = HEXCOLOR(0x999999);
////    titleLabel2.text = @"标题标题标题标题标标题标标题标标题标标题标题";
//    titleLabel2.textAlignment = NSTextAlignmentLeft;
//    [self addSubview:titleLabel2];
//    self.titleLabel2 = titleLabel2;
    
    UILabel *newPriceLabel = [[UILabel alloc] init];
    newPriceLabel.font = [UIFont systemFontOfSize:10];
    newPriceLabel.textColor = HEXCOLOR(0x333333);
    newPriceLabel.text = @"￥27.27";
    [self addSubview:newPriceLabel];
    self.nowPriceLabel = newPriceLabel;
    
    UILabel *oldPriceLabel = [[UILabel alloc] init];
    oldPriceLabel.font = [UIFont systemFontOfSize:8];
    oldPriceLabel.textColor = HEXCOLOR(0x999999);
    oldPriceLabel.text = @"￥27.27";
    [self addSubview:oldPriceLabel];
    self.oldPriceLabel = oldPriceLabel;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"gouwuche2"] forState:UIControlStateNormal];
    btn.hidden = YES;
    [self addSubview:btn];
    
    //点击商品跳转按钮
    UIButton *clickButton = [[UIButton alloc] init];
    clickButton.backgroundColor = [UIColor clearColor];
    [clickButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:clickButton];
    
    
    iconImageView.sd_layout
    .topSpaceToView(self,5)
    .centerXEqualToView(self)
    .widthIs((ScreenWidth - 60)/3)
    .heightEqualToWidth();
    
    titleLabel.sd_layout
    .topSpaceToView(iconImageView,3)
    .leftEqualToView(iconImageView)
    .rightEqualToView(iconImageView)
    .autoHeightRatio(0);
    [titleLabel setMaxNumberOfLinesToShow:1];
    
//    titleLabel2.sd_layout
//    .topSpaceToView(titleLabel,2)
//    .leftEqualToView(iconImageView)
//    .rightEqualToView(iconImageView)
//    .autoHeightRatio(0);
//    [titleLabel2 setMaxNumberOfLinesToShow:1];
    
    btn.sd_layout
    .rightEqualToView(iconImageView)
    .bottomSpaceToView(self,5)
    .heightIs(18)
    .widthIs(18);
    
    newPriceLabel.sd_layout
    .leftEqualToView(titleLabel)
    .bottomSpaceToView(self,5)
    .heightIs(18);
    [newPriceLabel setSingleLineAutoResizeWithMaxWidth:60];
    
    oldPriceLabel.sd_layout
    .leftSpaceToView(newPriceLabel,3)
    .bottomEqualToView(newPriceLabel)
    .topEqualToView(newPriceLabel)
    .rightEqualToView(btn);
    
    clickButton.sd_layout
    .leftSpaceToView(self,0)
    .bottomEqualToView(self)
    .topEqualToView(self)
    .rightEqualToView(self);
}

- (void)setModel:(ModelBrandProduct *)model
{
    _model = model;
    
    if (model.Picture)
    {
        [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    }
    self.titleLabel.text = model.ShortDescription;
    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@%@",model.Price.MoneySymbol,model.Price.Value];
    
    self.productID = model.Guid;
    
    NSDictionary *dic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                          NSFontAttributeName:[UIFont systemFontOfSize:8],
                          NSForegroundColorAttributeName:HEXCOLOR(0x999999)};
    NSString *str = [NSString stringWithFormat:@"%@%@",model.MarketPrice.MoneySymbol,model.MarketPrice.Value];
    NSMutableAttributedString *oldPriceAtt = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    self.oldPriceLabel.attributedText = oldPriceAtt;
    
}

- (void)setModelSaleProductSimpleDetailCollectionForLinked:(ModelSaleProductSimpleDetailCollectionForLinked *)modelSaleProductSimpleDetailCollectionForLinked
{
    _modelSaleProductSimpleDetailCollectionForLinked = modelSaleProductSimpleDetailCollectionForLinked;
    
    self.productID = modelSaleProductSimpleDetailCollectionForLinked.Guid;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(modelSaleProductSimpleDetailCollectionForLinked.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    self.titleLabel.text = modelSaleProductSimpleDetailCollectionForLinked.ShortDescription;

    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@%@",modelSaleProductSimpleDetailCollectionForLinked.Price.MoneySymbol,modelSaleProductSimpleDetailCollectionForLinked.Price.Value];
    
    //旧金额加下划线
    NSDictionary *dic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                          NSFontAttributeName:[UIFont systemFontOfSize:8],
                          NSForegroundColorAttributeName:HEXCOLOR(0x999999)};
    NSString *str = [NSString stringWithFormat:@"%@%@",modelSaleProductSimpleDetailCollectionForLinked.MarketPrice.MoneySymbol,modelSaleProductSimpleDetailCollectionForLinked.MarketPrice.Value];
    NSMutableAttributedString *oldPriceAtt = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    self.oldPriceLabel.attributedText = oldPriceAtt;
    
}

//点击商品跳转
- (void)clickButton{
    if (self.delegate){
        [self.delegate clickProductButtonWithProductId:self.productID];
    }
}

@end
