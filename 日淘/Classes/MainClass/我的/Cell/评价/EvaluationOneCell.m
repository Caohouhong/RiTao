//
//  EvaluationOneCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationOneCell.h"

@interface EvaluationOneCell ()

@property (nonatomic, weak) UIImageView *iconimage;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *shopLabel;

@end

@implementation EvaluationOneCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"EvaluationOneCell";
    EvaluationOneCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[EvaluationOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconimage = [[UIImageView alloc]init];
    iconimage.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:iconimage];
    self.iconimage = iconimage;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"资生堂男士洗面奶";
    nameLabel.font = TFont(15);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *shopLabel = [[UILabel alloc]init];
    shopLabel.text = @"商品";
    shopLabel.font = TFont(13);
    shopLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:shopLabel];
    self.shopLabel = shopLabel;
    
    iconimage.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(60).heightIs(60);
    
    nameLabel.sd_layout
    .leftSpaceToView(iconimage,10)
    .topEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(20);
    
    shopLabel.sd_layout
    .leftSpaceToView(iconimage,10)
    .bottomEqualToView(iconimage)
    .rightSpaceToView(self.contentView,10)
    .heightIs(20);
    
}



-(void)setModel:(ModelSaleOrderGoodsDetailCollection *)model
{
    _model = model;
    
    [self.iconimage sd_setImageWithURL:IMAGE_URL(model.SaleProductPicture) placeholderImage:nil];
    self.nameLabel.text = model.GoodsName;
//    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.SalePrice.MoneySymbol,model.SalePrice.Value];
//    self.shopLabel.text = model.GeneratedTime;
    
}

@end
