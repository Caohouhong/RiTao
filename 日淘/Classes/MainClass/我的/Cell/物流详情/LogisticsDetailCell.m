//
//  LogisticsDetailCell.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LogisticsDetailCell.h"

@interface LogisticsDetailCell ()<MLEmojiLabelDelegate>

@property (nonatomic, weak) UILabel *cangKuLabel;
@property (nonatomic, weak) UILabel *kuaiDiGongSiLabel;
@property (nonatomic, weak) UILabel *kuaiDiDanHaoLabel;
@property (nonatomic, weak) MLEmojiLabel *KuaiDiDianHuaLabel;

@end

@implementation LogisticsDetailCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LogisticsDetailCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LogisticsDetailCell";
    LogisticsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LogisticsDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:2];
    
    UILabel *cangKuLabel = [[UILabel alloc] init];
    cangKuLabel.font = [UIFont systemFontOfSize:14];
    cangKuLabel.textColor = HEXCOLOR(0x333333);
    cangKuLabel.text = @"上海保税仓";
    cangKuLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:cangKuLabel];
    self.cangKuLabel = cangKuLabel;
    
    UILabel *kuaiDiGongSiLabel = [[UILabel alloc] init];
    kuaiDiGongSiLabel.font = [UIFont systemFontOfSize:10];
    kuaiDiGongSiLabel.textColor = HEXCOLOR(0x999999);
    kuaiDiGongSiLabel.text = @"快递公司：";
    kuaiDiGongSiLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:kuaiDiGongSiLabel];
    self.kuaiDiGongSiLabel = kuaiDiGongSiLabel;
    
    UILabel *kuaiDiDanHaoLabel = [[UILabel alloc] init];
    kuaiDiDanHaoLabel.font = [UIFont systemFontOfSize:10];
    kuaiDiDanHaoLabel.textColor = HEXCOLOR(0x999999);
    kuaiDiDanHaoLabel.text = @"快递单号：";
    kuaiDiDanHaoLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:kuaiDiDanHaoLabel];
    self.kuaiDiDanHaoLabel = kuaiDiDanHaoLabel;
    
    MLEmojiLabel *KuaiDiDianHuaLabel = [[MLEmojiLabel alloc] initWithFrame:CGRectMake(15, 67, ScreenWidth - 15-15, 15)];
    KuaiDiDianHuaLabel.font = [UIFont systemFontOfSize:10];
    KuaiDiDianHuaLabel.textColor = HEXCOLOR(0x999999);
    [KuaiDiDianHuaLabel preferredSizeWithMaxWidth:ScreenWidth - 40-15];
    KuaiDiDianHuaLabel.numberOfLines = 0;
    KuaiDiDianHuaLabel.textAlignment = NSTextAlignmentLeft;
    KuaiDiDianHuaLabel.delegate = self;
    [self.contentView addSubview:KuaiDiDianHuaLabel];
    self.KuaiDiDianHuaLabel = KuaiDiDianHuaLabel;
    
    cangKuLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,15)
    .heightIs(18);
    
    kuaiDiGongSiLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(cangKuLabel,3)
    .rightSpaceToView(self.contentView,15)
    .heightIs(12);
    
    kuaiDiDanHaoLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(kuaiDiGongSiLabel,3)
    .rightSpaceToView(self.contentView,15)
    .heightIs(12);
    
    KuaiDiDianHuaLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(kuaiDiDanHaoLabel,3)
    .rightSpaceToView(self.contentView,15)
    .heightIs(12);
}

- (void)setModel:(ModelSaleOrderLogisticsDetail *)model
{
    _model = model;
    
    self.cangKuLabel.text = model.WarehosueName;
    self.kuaiDiGongSiLabel.text = [NSString stringWithFormat:@"快递公司：%@",model.Company];
    self.kuaiDiDanHaoLabel.text = [NSString stringWithFormat:@"快递单号：%@",model.LogisticsNumber];
    
    self.KuaiDiDianHuaLabel.text = [NSString stringWithFormat:@"快递电话：%@",model.CompanyTelephoneNumber];
    [self.KuaiDiDianHuaLabel sizeToFit];
    
}


- (void)mlEmojiLabel:(MLEmojiLabel*)emojiLabel didSelectLink:(NSString*)link withType:(MLEmojiLabelLinkType)type
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",link]]];
}
@end
