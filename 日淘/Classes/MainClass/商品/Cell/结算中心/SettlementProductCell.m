//
//  SettlementProductCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementProductCell.h"

@interface SettlementProductCell ()

@property (nonatomic, weak) UIImageView *iconimage;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *numLabel;

@end

@implementation SettlementProductCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementProductCell";
    SettlementProductCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    [self addUnderlineWithLeftMargin:25 rightMargin:25 lineHeight:0.5];
    
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
    priceLabel.textColor = COLOR_Gray;
//    priceLabel.hidden = YES;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.text = @"x1";
    numLabel.font = TFont(11);
    numLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:numLabel];
    self.numLabel = numLabel;
    
    iconimage.sd_layout
    .leftSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(40).heightIs(40);
    
    priceLabel.sd_layout
    .topEqualToView(iconimage)
    .rightSpaceToView(self.contentView,25)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    numLabel.sd_layout
    .bottomEqualToView(iconimage)
    .rightSpaceToView(self.contentView,25)
    .heightIs(15);
    [numLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    
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

- (void)setModel:(ModelMemberShopCartDetailCollection *)model
{
    _model = model;
    
    [self.iconimage sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    self.nameLabel.text = model.Description;
    self.typeLabel.text = [NSString stringWithFormat:@"型号:%@",model.ShortDescription];
    self.numLabel.text = [NSString stringWithFormat:@"X%@",model.Quantity];
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.Price.MoneySymbol,model.Price.Value];
}

@end
