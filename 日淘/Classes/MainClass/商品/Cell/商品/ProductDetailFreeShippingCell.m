//
//  ProductDetailFreeShippingCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailFreeShippingCell.h"

@interface ProductDetailFreeShippingCell ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation ProductDetailFreeShippingCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailFreeShippingCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailFreeShippingCell";
    ProductDetailFreeShippingCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailFreeShippingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x999999);
    titleLabel.text = @"包邮";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = HEXCOLOR(0x333333);
    contentLabel.text = @"满299元或2件包邮";
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIImageView *moreImageView = [[UIImageView alloc] init];
    moreImageView.image = [UIImage imageNamed:@"jiantou"];
    [self.contentView addSubview:moreImageView];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerXEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(70);
    
    moreImageView.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(6)
    .heightIs(8);
    
    contentLabel.sd_layout
    .leftSpaceToView(titleLabel,10)
    .centerYEqualToView(titleLabel)
    .heightRatioToView(titleLabel,1)
    .rightSpaceToView(moreImageView,10);
}

- (void)setModel:(ModelDeliveryFeeRuleObject *)model
{
    _model = model;
    
    self.contentLabel.text = model.Description;
}

@end
