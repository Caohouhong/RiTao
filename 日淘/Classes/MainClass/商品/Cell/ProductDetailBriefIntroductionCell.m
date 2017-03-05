//
//  ProductDetailBriefIntroductionCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailBriefIntroductionCell.h"

@interface ProductDetailBriefIntroductionCell ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *briefIntroductionLabel;

@end

@implementation ProductDetailBriefIntroductionCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailBriefIntroductionCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailBriefIntroductionCell";
    ProductDetailBriefIntroductionCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailBriefIntroductionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UILabel *briefIntroductionLabel = [[UILabel alloc] init];
    briefIntroductionLabel.font = [UIFont systemFontOfSize:12];
    briefIntroductionLabel.textColor = HEXCOLOR(0x9d9c9c);
    briefIntroductionLabel.text = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    [self.contentView addSubview:briefIntroductionLabel];
    self.briefIntroductionLabel = briefIntroductionLabel;
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,20)
    .autoHeightRatio(0);
    
    briefIntroductionLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(titleLabel,15)
    .autoHeightRatio(0);
}

- (void)setModel:(ModelSaleProductDetail *)model
{
    _model = model;
    
    self.titleLabel.text = model.Description;
    self.briefIntroductionLabel.text = model.DetailDescription;
    
    [self setupAutoHeightWithBottomView:self.briefIntroductionLabel bottomMargin:20];
}

@end
