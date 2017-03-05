//
//  SettlementShouhuoCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementShouhuoCell.h"

@interface SettlementShouhuoCell ()

@property (nonatomic, weak) UILabel *morenLabel;
@property (nonatomic, weak) UILabel *renLabel;
@property (nonatomic, weak) UILabel *addressLabel;

@end

@implementation SettlementShouhuoCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementShouhuoCell";
    SettlementShouhuoCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementShouhuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
  
    UILabel *morenLabel = [[UILabel alloc]init];
    morenLabel.backgroundColor = COLOR_Red2;
    morenLabel.textColor = [UIColor whiteColor];
    morenLabel.font = TFont(9);
    morenLabel.text = @"默认";
    morenLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:morenLabel];
    self.morenLabel = morenLabel;
    
    UILabel *renLabel = [[UILabel alloc]init];
    renLabel.textColor = [UIColor blackColor];
    renLabel.text = @"收货人： 唐                  19999900000";
    renLabel.font = TFont(14);
    [self.contentView addSubview:renLabel];
    self.renLabel = renLabel;
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.image = [UIImage imageNamed:@"dizhi"];
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconimageView];
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.text = @"江苏省 无锡市 南长区 水仙里";
    addressLabel.font = TFont(14);
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    UIImageView *lineView = [[UIImageView alloc]init];
    lineView.image = [UIImage imageNamed:@"xiantiao"];
    [self.contentView addSubview:lineView];
    
    morenLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .widthIs(25).heightIs(13);
    morenLabel.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    renLabel.sd_layout
    .leftSpaceToView(morenLabel,5)
    .centerYEqualToView(morenLabel)
    .widthIs(ScreenWidth).heightIs(15);
    
    iconimageView.sd_layout
    .topSpaceToView(renLabel,5)
    .leftSpaceToView(self.contentView,10)
    .widthIs(12).heightIs(12);
    
    addressLabel.sd_layout
    .leftSpaceToView(iconimageView,3)
    .centerYEqualToView(iconimageView)
    .widthIs(ScreenWidth).heightIs(15);
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .heightIs(2);
    
}

- (void)setModel:(ModelWfxPrepareSaleOrder *)model
{
    _model = model;
    
    self.renLabel.text = [NSString stringWithFormat:@"收货人:%@   %@",model.ReceiverName,model.ReceiverPhone];
    self.addressLabel.text = model.ReceiverAddress;
}

@end
