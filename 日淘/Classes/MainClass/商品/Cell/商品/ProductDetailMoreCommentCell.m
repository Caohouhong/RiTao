//
//  ProductDetailMoreCommentCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailMoreCommentCell.h"

@interface ProductDetailMoreCommentCell ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation ProductDetailMoreCommentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailMoreCommentCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailMoreCommentCell";
    ProductDetailMoreCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailMoreCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:2];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"查看全部118条评论";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *moreImageView = [[UIImageView alloc] init];
    moreImageView.image = [UIImage imageNamed:@"jiantou"];
    [self.contentView addSubview:moreImageView];
    
    titleLabel.sd_layout
    .centerXEqualToView(self.contentView)
    .centerYEqualToView(self.contentView)
    .heightIs(20);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    moreImageView.sd_layout
    .leftSpaceToView(titleLabel,20)
    .centerYEqualToView(titleLabel)
    .widthIs(6)
    .heightIs(8);
}

- (void)setModel:(ModelSaleProductDetail *)model
{
    _model = model;
    
    self.titleLabel.text = [NSString stringWithFormat:@"查看全部%@条评论",model.SaleProductCommentQuantity];
}

@end
