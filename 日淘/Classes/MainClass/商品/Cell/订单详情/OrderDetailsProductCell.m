//
//  OrderDetailsProductCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsProductCell.h"

@interface OrderDetailsProductCell ()

@property (nonatomic, weak) UIImageView *iconimage;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *numLabel;

@end

@implementation OrderDetailsProductCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderDetailsProductCell";
    OrderDetailsProductCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderDetailsProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:1];
    
    UIImageView *iconimage = [[UIImageView alloc]init];
    iconimage.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:iconimage];
    self.iconimage = iconimage;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"资生堂UNO男士紧接";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Black;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *typeLabel = [[UILabel alloc]init];
    typeLabel.text = @"型号: 25ml*10";
    typeLabel.font = TFont(11);
    typeLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥99";
    priceLabel.font = TFont(12);
    priceLabel.textColor = COLOR_Black;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    
//    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"69.9" attributes:attribtDic];
//    
//    UILabel *oldpriceLabel = [[UILabel alloc]init];
//    oldpriceLabel.attributedText = attribtStr;
//    oldpriceLabel.font = TFont(12);
//    oldpriceLabel.textColor = COLOR_Gray;
//    [self.contentView addSubview:oldpriceLabel];
    
    
    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.text = @"x1";
    numLabel.font = TFont(11);
    numLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:numLabel];
    self.numLabel = numLabel;
    
    
    
    iconimage.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(40).heightIs(40);
    
    priceLabel.sd_layout
    .topEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    numLabel.sd_layout
    .bottomEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    [numLabel setSingleLineAutoResizeWithMaxWidth:100];
    
//    oldpriceLabel.sd_layout
//    .rightSpaceToView(self.contentView,10)
//    .topSpaceToView(priceLabel,0)
//    .bottomSpaceToView(numLabel,0);
//    [oldpriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    nameLabel.sd_layout
    .topEqualToView(iconimage)
    .leftSpaceToView(iconimage,10)
    .rightSpaceToView(priceLabel,10)
    .heightIs(15);
    
    typeLabel.sd_layout
    .bottomEqualToView(iconimage)
    .leftSpaceToView(iconimage,10)
    .rightSpaceToView(numLabel,10)
    .heightIs(15);

}

- (void)setModel:(ModelSaleOrderGoodsDetailCollection *)model
{
    _model = model;
    
    [self.iconimage sd_setImageWithURL:IMAGE_URL(model.SaleProductPicture) placeholderImage:nil];
    self.nameLabel.text = model.GoodsName;
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.SalePrice.MoneySymbol,model.SalePrice.Value];
    self.numLabel.text = [NSString stringWithFormat:@"X%@",model.Quantity];
    self.typeLabel.text = [NSString stringWithFormat:@"型号:%@",model.SaleProductModel];
    
}
@end
