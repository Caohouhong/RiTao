//
//  TaoKeProductOneCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TaoKeProductOneCell.h"
#import "ModelTotalAmount.h"

@interface  TaoKeProductOneCell()
@property (nonatomic, weak) UILabel *priceLabel;
@end

@implementation TaoKeProductOneCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"TaoKeProductOneCell";
    TaoKeProductOneCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[TaoKeProductOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    
    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.text = @"可提现佣金（元）";
    topLabel.font = TFont(13);
    topLabel.textColor = COLOR_Black;
    [self.contentView addSubview:topLabel];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"3.00";
    priceLabel.font = TFont(20);
    priceLabel.textColor = COLOR_Red2;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = COLOR_Red2;
    button.titleLabel.font = TFont(14);
    [button setTitle:@"提现" forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    [button setTitleColor:COLOR_White forState:UIControlStateNormal];
    [self.contentView addSubview:button];
    
    topLabel.sd_layout
    .leftSpaceToView(self.contentView,20)
    .topSpaceToView(self.contentView,20)
    .widthIs(200).heightIs(15);
    
    priceLabel.sd_layout
    .leftSpaceToView(self.contentView,20)
    .bottomSpaceToView(self.contentView,20)
    .widthIs(200).heightIs(20);
    
    button.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(priceLabel)
    .widthIs(100).heightIs(30);
    
}

-(void)setModel:(ModelTaoKeCenter *)model {
    _model = model;
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.CanWithdrawAmount.MoneySymbol, model.CanWithdrawAmount.Value];
    
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
