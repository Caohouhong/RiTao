//
//  PayOrderFirstCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PayOrderFirstCell.h"

@interface PayOrderFirstCell ()

@property (nonatomic, weak) UILabel *priceLabel;

@end

@implementation PayOrderFirstCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PayOrderFirstCell";
    PayOrderFirstCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PayOrderFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    //[self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:0.5];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = TFont(13.0);
    nameLabel.text = @"订单金额";
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.font = TFont(13.0);
    priceLabel.textColor = COLOR_Red;
    priceLabel.text = @"￥338.8";
    self.priceLabel = priceLabel;
    
    [self.contentView sd_addSubviews:@[nameLabel, priceLabel]];
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(80).heightIs(20);
    
    priceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(20);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:200];
 
}


- (void)setModel:(ModelPayOrder *)model
{
    _model = model;
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
}

@end
