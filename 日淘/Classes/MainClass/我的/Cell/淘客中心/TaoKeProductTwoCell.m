//
//  TaoKeProductTwoCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TaoKeProductTwoCell.h"
#import "ModelTotalAmount.h"


@interface TaoKeProductTwoCell()
@property (nonatomic, weak) UILabel *tixianpriceLabel;
@property (nonatomic, weak) UILabel *yujipriceLabel;
@property (nonatomic, weak) UILabel *leijipriceLabel;
@property (nonatomic, weak) UILabel *yitixianpriceLabel;
@end
@implementation TaoKeProductTwoCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"TaoKeProductTwoCell";
    TaoKeProductTwoCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[TaoKeProductTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    self.contentView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.7];
    
    UIButton *shuoButton = [[UIButton alloc]init];
    shuoButton.titleLabel.font = TFont(11);
    [shuoButton setTitle:@"收益说明 >" forState:UIControlStateNormal];
    [shuoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.contentView addSubview:shuoButton];
    
    shuoButton.sd_layout
    .topSpaceToView(self.contentView,5)
    .rightSpaceToView(self.contentView,6)
    .widthIs(70).heightIs(15);
    
    UIView *lineViewo = [[UIView alloc]init];
    lineViewo.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineViewo];
    
    UIView *lineViewt = [[UIView alloc]init];
    lineViewt.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineViewt];
    
    lineViewo.sd_layout
    .topSpaceToView(self.contentView,30)
    .widthIs(1).heightIs(40)
    .centerXEqualToView(self.contentView);
    
    lineViewt.sd_layout
    .bottomSpaceToView(self.contentView,30)
    .widthIs(1).heightIs(40)
    .centerXEqualToView(self.contentView);
    
    UILabel *tixianLabel = [[UILabel alloc]init];
    tixianLabel.text = @"提现审核中(元)";
    tixianLabel.textAlignment = NSTextAlignmentCenter;
    tixianLabel.font = TFont(12);
    tixianLabel.textColor = COLOR_Black;
    [self.contentView addSubview:tixianLabel];
    
    UILabel *tixianpriceLabel = [[UILabel alloc]init];
    tixianpriceLabel.text = @"68.33";
    tixianpriceLabel.textAlignment = NSTextAlignmentCenter;
    tixianpriceLabel.font = TFont(13);
    tixianpriceLabel.textColor = COLOR_Black;
    [self.contentView addSubview:tixianpriceLabel];
    self.tixianpriceLabel = tixianpriceLabel;
    
    UILabel *yujiLabel = [[UILabel alloc]init];
    yujiLabel.text = @"预计收益(元)";
    yujiLabel.textAlignment = NSTextAlignmentCenter;
    yujiLabel.font = TFont(12);
    yujiLabel.textColor = COLOR_Black;
    [self.contentView addSubview:yujiLabel];
    
    
    UILabel *yujipriceLabel = [[UILabel alloc]init];
    yujipriceLabel.text = @"250.00";
    yujipriceLabel.textAlignment = NSTextAlignmentCenter;
    yujipriceLabel.font = TFont(13);
    yujipriceLabel.textColor = COLOR_Black;
    [self.contentView addSubview:yujipriceLabel];
    self.yujipriceLabel = yujipriceLabel;
    
    UILabel *leijiLabel = [[UILabel alloc]init];
    leijiLabel.text = @"累计收益(元)";
    leijiLabel.textAlignment = NSTextAlignmentCenter;
    leijiLabel.font = TFont(12);
    leijiLabel.textColor = COLOR_Black;
    [self.contentView addSubview:leijiLabel];
    
    UILabel *leijipriceLabel = [[UILabel alloc]init];
    leijipriceLabel.text = @"7733.00";
    leijipriceLabel.textAlignment = NSTextAlignmentCenter;
    leijipriceLabel.font = TFont(13);
    leijipriceLabel.textColor = COLOR_Red;
    [self.contentView addSubview:leijipriceLabel];
    self.leijipriceLabel = leijipriceLabel;
    
    UILabel *yitixianLabel = [[UILabel alloc]init];
    yitixianLabel.text = @"已提现收益(元)";
    yitixianLabel.textAlignment = NSTextAlignmentCenter;
    yitixianLabel.font = TFont(12);
    yitixianLabel.textColor = COLOR_Black;
    [self.contentView addSubview:yitixianLabel];
    
    UILabel *yitixianpriceLabel = [[UILabel alloc]init];
    yitixianpriceLabel.text = @"2700.00";
    yitixianpriceLabel.textAlignment = NSTextAlignmentCenter;
    yitixianpriceLabel.font = TFont(13);
    yitixianpriceLabel.textColor = COLOR_Red;
    [self.contentView addSubview:yitixianpriceLabel];
    self.yitixianpriceLabel = yitixianpriceLabel;
    
    tixianLabel.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(lineViewo,0)
    .topEqualToView(lineViewo)
    .heightIs(15);
    
    tixianpriceLabel.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(lineViewo,0)
    .bottomEqualToView(lineViewo)
    .heightIs(15);
    
    yujiLabel.sd_layout
    .leftSpaceToView(lineViewo,0)
    .rightSpaceToView(self.contentView,0)
    .topEqualToView(lineViewo)
    .heightIs(15);
    
    yujipriceLabel.sd_layout
    .leftSpaceToView(lineViewo,0)
    .rightSpaceToView(self.contentView,0)
    .bottomEqualToView(lineViewo)
    .heightIs(15);
    
    
    leijiLabel.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(lineViewt,0)
    .topEqualToView(lineViewt)
    .heightIs(15);
    
    leijipriceLabel.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(lineViewt,0)
    .bottomEqualToView(lineViewt)
    .heightIs(15);
    
    yitixianLabel.sd_layout
    .leftSpaceToView(lineViewt,0)
    .rightSpaceToView(self.contentView,0)
    .topEqualToView(lineViewt)
    .heightIs(15);
    
    yitixianpriceLabel.sd_layout
    .leftSpaceToView(lineViewt,0)
    .rightSpaceToView(self.contentView,0)
    .bottomEqualToView(lineViewt)
    .heightIs(15);

}

-(void)setModel:(ModelTaoKeCenter *)model {
    _model = model;
    
    self.tixianpriceLabel.text = [NSString stringWithFormat:@"%@%@",model.AuditAmount.MoneySymbol, model.AuditAmount.Value];

    self.yujipriceLabel.text = [NSString stringWithFormat:@"%@%@",model.ExpectedAmount.MoneySymbol, model.ExpectedAmount.Value];

    self.leijipriceLabel.text = [NSString stringWithFormat:@"%@%@",model.TotalAmount.MoneySymbol, model.TotalAmount.Value];

    self.yitixianpriceLabel.text = [NSString stringWithFormat:@"%@%@",model.WithdrawAmount.MoneySymbol, model.CanWithdrawAmount.Value];

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
