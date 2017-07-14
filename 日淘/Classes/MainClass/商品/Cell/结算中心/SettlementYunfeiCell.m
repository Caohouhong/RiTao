//
//  SettlementYunfeiCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementYunfeiCell.h"

@interface SettlementYunfeiCell ()

@property (nonatomic, weak) UILabel *kuaidiLabel;
@property (nonatomic, weak) UILabel *xiaoLabel;

@end

@implementation SettlementYunfeiCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementYunfeiCell";
    SettlementYunfeiCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementYunfeiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"运费";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Black;
    [self.contentView addSubview:nameLabel];
    
    UILabel *kuaidiLabel = [[UILabel alloc]init];
    kuaidiLabel.text = @"快递：￥0";
    kuaidiLabel.font = TFont(12);
    kuaidiLabel.textColor = COLOR_Black;
    [self.contentView addSubview:kuaidiLabel];
    self.kuaidiLabel = kuaidiLabel;
    
    UILabel *xiaoLabel = [[UILabel alloc]init];
    xiaoLabel.text = @"已享受满99元包邮";
    xiaoLabel.font = TFont(10);
    xiaoLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:xiaoLabel];
    self.xiaoLabel = xiaoLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(100).heightIs(15);
    
    kuaidiLabel.sd_layout
    .rightSpaceToView(self.contentView,25)
    .topSpaceToView(self.contentView,2)
    .heightIs(15);
    [kuaidiLabel setSingleLineAutoResizeWithMaxWidth:100];
   
    xiaoLabel.sd_layout
    .rightSpaceToView(self.contentView,25)
    .bottomSpaceToView(self.contentView,2)
    .heightIs(11);
    [xiaoLabel setSingleLineAutoResizeWithMaxWidth:150];
    
}

- (void)setModel:(ModelWfxPrepareSaleOrder *)model
{
    _model = model;
    
    
    //H 测试  待确认接口问题
    if (model.IsExcludePost)
    {
        self.kuaidiLabel.text = [NSString stringWithFormat:@"快递：¥0"];
        self.xiaoLabel.text = [NSString stringWithFormat:@"已享满足邮条件"];
    }else{
        self.kuaidiLabel.text = [NSString stringWithFormat:@"快递：%@%@",model.DeliveyFee.MoneySymbol,model.DeliveyFee.Value];
        self.xiaoLabel.text = [NSString stringWithFormat:@"已享受包邮条件，已减免【%@】",model.DeliveyFee.Value];
    }
}

@end
