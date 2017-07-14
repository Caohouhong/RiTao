//
//  MyOrderEvaluateCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyOrderEvaluateCell.h"
#import "ModelTotalAmount.h"

@interface MyOrderEvaluateCell ()

@property (nonatomic, weak) UIImageView *iconimage;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *priceLabel;

@end

@implementation MyOrderEvaluateCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"MyOrderEvaluateCell";
    MyOrderEvaluateCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MyOrderEvaluateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconimage = [[UIImageView alloc]init];
    iconimage.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:iconimage];
    self.iconimage = iconimage;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"资生堂UNO男士紧接";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Black;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"2016-11-25";
    timeLabel.font = TFont(11);
    timeLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥99";
    priceLabel.font = TFont(12);
    priceLabel.textColor = COLOR_Black;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UIButton *shaiBtn = [[UIButton alloc]init];
    shaiBtn.layer.borderColor = COLOR_Red.CGColor;
    shaiBtn.layer.borderWidth = 1;
    shaiBtn.titleLabel.font = TFont(12);
    [shaiBtn setTitle:@"评价晒单" forState:UIControlStateNormal];
    [shaiBtn setTitleColor:COLOR_Red forState:UIControlStateNormal];
    [shaiBtn addTarget:self action:@selector(shaidan) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:shaiBtn];
    
    iconimage.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(50).heightIs(50);
    
    priceLabel.sd_layout
    .topEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    shaiBtn.sd_layout
    .bottomEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(25).widthIs(70);
    shaiBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    nameLabel.sd_layout
    .topEqualToView(iconimage)
    .leftSpaceToView(iconimage,10)
    .rightSpaceToView(priceLabel,10)
    .heightIs(15);
    
    timeLabel.sd_layout
    .bottomEqualToView(iconimage)
    .leftSpaceToView(iconimage,10)
    .rightSpaceToView(shaiBtn,10)
    .heightIs(15);
}

-(void)shaidan {
    if(self.shaidanBlock){
        self.shaidanBlock(self.model);
    }
}

-(void)setModel:(ModelSaleOrderGoodsDetailCollection *)model {
    _model = model;
    
    //H 测试 默认图片没有
    [self.iconimage sd_setImageWithURL:IMAGE_URL(model.SaleProductPicture) placeholderImage:[UIImage imageNamed:@"待收货"]];
    self.nameLabel.text = model.GoodsName;
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.SalePrice.MoneySymbol,model.SalePrice.Value];
    self.timeLabel.text = model.GeneratedTime;
    
}
@end
