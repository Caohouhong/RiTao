//
//  LogisticsStateCell.m
//  日淘
//
//  Created by 李强 on 2016/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LogisticsStateCell.h"


@interface LogisticsStateCell()
@property (nonatomic, weak) UILabel *stateLabel;
@property (nonatomic, weak) UILabel *orderNumberLabel;
@end
@implementation LogisticsStateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LogisticsStateCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LogisticsStateCell";
    LogisticsStateCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LogisticsStateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:2];
    
    UILabel *stateLabel = [[UILabel alloc] init];
    stateLabel.font = [UIFont systemFontOfSize:14];
    stateLabel.textColor = COLOR_Red;
    stateLabel.text = @"已发货";
    stateLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:stateLabel];
    self.stateLabel = stateLabel;
    
    UILabel *orderNumberLabel = [[UILabel alloc] init];
    orderNumberLabel.font = [UIFont systemFontOfSize:10];
    orderNumberLabel.textColor = HEXCOLOR(0x999999);
    orderNumberLabel.text = @"订单号：";
    orderNumberLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:orderNumberLabel];
    self.orderNumberLabel = orderNumberLabel;
    
    stateLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .heightIs(18);
    
    orderNumberLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,12)
    .heightIs(15);
}

-(void)setModel:(ModelSaleOrderLogisticsDetail *)model {
    _model = model;
    
    self.stateLabel.text = model.SaleOrderStatus;
    self.orderNumberLabel.text = [NSString stringWithFormat:@"订单号：%@",model.SaleOrderID];
    
}

@end
