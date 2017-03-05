//
//  SettlementHejiCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementHejiCell.h"

@interface SettlementHejiCell ()

@property (nonatomic, weak) UILabel *priceLabel;

@end

@implementation SettlementHejiCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementHejiCell";
    SettlementHejiCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementHejiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *hejiLabel = [[UILabel alloc]init];
    hejiLabel.text = @"合计";
    hejiLabel.font = TFont(12);
    //hejiLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:hejiLabel];
    
    UILabel *priceLabel2 = [[UILabel alloc]init];
    priceLabel2.text = @"￥122";
    priceLabel2.font = TFont(12);
    priceLabel2.textColor = COLOR_Red2;
    [self.contentView addSubview:priceLabel2];
    self.priceLabel = priceLabel2;
    
    hejiLabel.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,25)
    .widthIs(150)
    .bottomSpaceToView(self.contentView,0);
    
    priceLabel2.sd_layout
    .centerYEqualToView(hejiLabel)
    .rightSpaceToView(self.contentView,25)
    .heightIs(15);
    [priceLabel2 setSingleLineAutoResizeWithMaxWidth:150];
    
    
}

- (void)setModel:(ModelWfxPrepareSaleOrder *)model
{
    _model = model;
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
}

@end
