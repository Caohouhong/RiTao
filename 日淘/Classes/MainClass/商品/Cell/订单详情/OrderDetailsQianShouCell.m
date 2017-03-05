//
//  OrderDetailsQianShouCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsQianShouCell.h"

@interface OrderDetailsQianShouCell ()

@property (nonatomic, weak) UILabel *qianshouLabel;
@property (nonatomic, weak) UILabel *timeLabel;

@end

@implementation OrderDetailsQianShouCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderDetailsQianShouCell";
    OrderDetailsQianShouCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderDetailsQianShouCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    //iconimageView.backgroundColor = [UIColor orangeColor];
    iconimageView.image = [UIImage imageNamed:@"che"];
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconimageView];
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UILabel *qianshouLabel = [[UILabel alloc]init];
    qianshouLabel.text = @"已签收, 签收人是: 【本人签收】";
    qianshouLabel.font = TFont(13);
    [self.contentView addSubview:qianshouLabel];
    self.qianshouLabel = qianshouLabel;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"下单时间: 2016-10-10";
    timeLabel.font = TFont(10);
    timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    

    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .widthIs(15).heightIs(18);
    
    qianshouLabel.sd_layout
    .leftSpaceToView(iconimageView,5)
    .centerYEqualToView(iconimageView)
    .rightSpaceToView(self.contentView,20)
    .heightIs(15);
    
    timeLabel.sd_layout
    .leftEqualToView(qianshouLabel)
    .topSpaceToView(qianshouLabel,5)
    .widthIs(200).heightIs(13);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(qianshouLabel)
    .widthIs(8).heightIs(12);
    
}

- (void)setModel:(ModelLastLogisticsSheetDetail *)model
{
    _model = model;
    
    self.qianshouLabel.text = model.Content;
    self.timeLabel.text = [NSString stringWithFormat:@"下单时间:%@",model.RefreshTime];
}

@end
