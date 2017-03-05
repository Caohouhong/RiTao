//
//  OrderDetailsFaHuoCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsFaHuoCell.h"

@interface OrderDetailsFaHuoCell ()

@property (nonatomic, weak) UILabel *fahuoLabel;
@property (nonatomic, weak) UILabel *haoLabel;
@property (nonatomic, weak) UILabel *timeLabel;

@end

@implementation OrderDetailsFaHuoCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderDetailsFaHuoCell";
    OrderDetailsFaHuoCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderDetailsFaHuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
  
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:3];
    
    UILabel *fahuoLabel = [[UILabel alloc]init];
    fahuoLabel.text = @"已发货";
    fahuoLabel.font = TFont(15);
    fahuoLabel.textColor = COLOR_Red2;
    [self.contentView addSubview:fahuoLabel];
    self.fahuoLabel = fahuoLabel;
    
    UILabel *haoLabel = [[UILabel alloc]init];
    haoLabel.text = @"订单号: 10000002";
    haoLabel.font = TFont(11);
    haoLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:haoLabel];
    self.haoLabel = haoLabel;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"下单时间: 2016-10-10";
    timeLabel.font = TFont(11);
    timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UIButton *fuwuButton = [[UIButton alloc]init];
    fuwuButton.titleLabel.font = TFont(12);
    fuwuButton.layer.borderColor = [UIColor grayColor].CGColor;
    fuwuButton.layer.borderWidth = 1;
    [fuwuButton setImage:GETIMAGE(@"shouhou") forState:UIControlStateNormal];
    [fuwuButton setTitle:@"售后服务" forState:UIControlStateNormal];
    [fuwuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:fuwuButton];
    
    fahuoLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .widthIs(200).heightIs(18);
    
    haoLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(fahuoLabel,5)
    .widthIs(200).heightIs(13);
    
    timeLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(haoLabel,5)
    .widthIs(200).heightIs(13);
    
    fuwuButton.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(haoLabel)
    .widthIs(90).heightIs(25);
    fuwuButton.sd_cornerRadiusFromHeightRatio = @(0.5);
}


- (void)setModel:(ModelWfxSaleOrderDetail *)model
{
    _model = model;
    
    self.fahuoLabel.text = model.SaleOrderStatus;
    self.haoLabel.text = [NSString stringWithFormat:@"订单号:%@",model.SaleOrderID];
    self.timeLabel.text = [NSString stringWithFormat:@"下单时间:%@",model.GeneratedTime];
}

@end
