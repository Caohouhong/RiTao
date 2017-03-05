//
//  PaymentDetailsCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PaymentDetailsCell.h"


@interface PaymentDetailsCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *priceLabel;

@end
@implementation PaymentDetailsCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PaymentDetailsCell";
    PaymentDetailsCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PaymentDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:0.5];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"提现";
    nameLabel.font = TFont(13);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"2016-12-02";
    timeLabel.font = TFont(10);
    timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"-770.00";
    priceLabel.font = TFont(13);
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(100).heightIs(15);
    
    timeLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .heightIs(15);
    [timeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    priceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
}

-(void)setModel:(ModelBalanceOfPaymentDetailsCollection *)model {
    _model = model;
    
    self.nameLabel.text = model.OperationType;
    
    self.timeLabel.text = model.GeneratedTime;
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.Amount.MoneySymbol,model.Amount.Value];
    
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
