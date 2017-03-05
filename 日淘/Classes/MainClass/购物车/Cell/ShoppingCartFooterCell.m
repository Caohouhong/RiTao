//
//  ShoppingCartFooterCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartFooterCell.h"
#import "ModelTotalAmount.h"
#import "ModelDiscountAmount.h"

@interface ShoppingCartFooterCell()
@property (nonatomic, weak) UILabel *youhuiLabel;
@end

@implementation ShoppingCartFooterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShoppingCartFooterCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartFooterCell";
    ShoppingCartFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartFooterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *youhuiLabel = [[UILabel alloc] init];
    youhuiLabel.font = [UIFont systemFontOfSize:12];
    youhuiLabel.textColor = HEXCOLOR(0x999999);
    youhuiLabel.text = @"活动优惠：-￥0.00\n本仓总计：￥999.00";
    youhuiLabel.textAlignment = NSTextAlignmentRight;
    youhuiLabel.numberOfLines = 2;
    [self.contentView addSubview:youhuiLabel];
    self.youhuiLabel = youhuiLabel;
//    UILabel *zongJiLabel = [[UILabel alloc] init];
//    zongJiLabel.font = [UIFont systemFontOfSize:14];
//    zongJiLabel.textColor = HEXCOLOR(0x333333);
//    zongJiLabel.text = @"本仓总计：￥999.00";
//    zongJiLabel.textAlignment = NSTextAlignmentRight;
//    [self.contentView addSubview:zongJiLabel];
    
    youhuiLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5);
}

-(void)setModel:(ModelWfxMemberShopCartWarehouseCollection *)model {
    _model = model;
    
    
    self.youhuiLabel.text = [NSString stringWithFormat:@"活动优惠：-%@%@\n本仓总计：%@%@",model.DiscountAmount.MoneySymbol,model.DiscountAmount.Value,model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
    //self.youhuiLabel.text = @"活动优惠：-￥0.00\n本仓总计：￥999.00";
    
}

@end
