//
//  MianProductView.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MianProductView.h"
#import "ProductDetailsVC.h"

@interface MianProductView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *productNewPriceLabel;
@property (nonatomic, weak) UILabel *productOldPriceLabel;

@end

@implementation MianProductView

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
    //iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x898989);
    titleLabel.numberOfLines = 2;
    titleLabel.text = @"标题";
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *newPriceLabel = [[UILabel alloc] init];
    newPriceLabel.font = [UIFont systemFontOfSize:12];
    newPriceLabel.textColor = HEXCOLOR(0xFF406F);
    newPriceLabel.text = @"¥27.27";
    [self addSubview:newPriceLabel];
    self.productNewPriceLabel = newPriceLabel;
    
    UILabel *oldPriceLabel = [[UILabel alloc] init];
    oldPriceLabel.font = [UIFont systemFontOfSize:10];
    oldPriceLabel.textColor = HEXCOLOR(0x999999);
    oldPriceLabel.text = @"¥27.27";
    [self addSubview:oldPriceLabel];
    self.productOldPriceLabel = oldPriceLabel;
    
    iconImageView.sd_layout
    .topSpaceToView(self,5)
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .heightIs(75);
    
    titleLabel.sd_layout
    .topSpaceToView(iconImageView,0)
    .leftEqualToView(iconImageView)
    .rightEqualToView(iconImageView)
    .autoHeightRatio(0);
    [titleLabel setMaxNumberOfLinesToShow:2];
    
    newPriceLabel.sd_layout
    .leftEqualToView(titleLabel)
    .bottomSpaceToView(self,5)
    .heightIs(18);
    [newPriceLabel setSingleLineAutoResizeWithMaxWidth:60];
    
    oldPriceLabel.sd_layout
    .leftSpaceToView(newPriceLabel,3)
    .centerYEqualToView(newPriceLabel)
    .heightEqualToWidth(newPriceLabel);
    [oldPriceLabel setSingleLineAutoResizeWithMaxWidth:60];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
}

- (void)setModel:(ModelTopicProductCollection *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(self.model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    self.titleLabel.text = model.Name;
    
    
    NSString *priceStr = [NSString strWhithString:model.Price];
    //NSLog(@"=========================%@",priceStr);
    self.productNewPriceLabel.text = [NSString stringWithFormat:@"¥%@",priceStr];
    
    NSDictionary *dic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],
                          NSFontAttributeName:[UIFont systemFontOfSize:10],
                          NSForegroundColorAttributeName:HEXCOLOR(0x999999)};
    
    NSString *priceStr1 = [NSString strWhithString:model.OrignalPrice];
    NSMutableAttributedString *oldPriceAtt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%@",priceStr1] attributes:dic];
    self.productOldPriceLabel.attributedText = oldPriceAtt;
}

- (void)tap
{
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.guid = self.model.Product;
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

@end
