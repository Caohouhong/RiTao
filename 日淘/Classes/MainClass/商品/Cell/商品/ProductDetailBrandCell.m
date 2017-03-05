//
//  ProductDetailBrandCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailBrandCell.h"
#import "ProductView.h"

@interface ProductDetailBrandCell ()<ProductViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *secondNameLabel;
@property (nonatomic, weak) UIButton *moreBtn;
@property (nonatomic, weak) UILabel *contentLabel;

@property (nonatomic, strong) NSString *guid;

@end

@implementation ProductDetailBrandCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailBrandCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailBrandCell";
    ProductDetailBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailBrandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.text = @"名称名称名称名称名称";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *secondNameLabel = [[UILabel alloc] init];
    secondNameLabel.font = [UIFont systemFontOfSize:14];
    secondNameLabel.textColor = HEXCOLOR(0x999999);
    secondNameLabel.text = @"副标题";
    secondNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:secondNameLabel];
    self.secondNameLabel = secondNameLabel;
    
    UIButton *moreBtn = [[UIButton alloc] init];
    [moreBtn setTitle:@"查看0件商品  >" forState:UIControlStateNormal];
    [moreBtn setTitleColor:HEXCOLOR(0x999999) forState:UIControlStateNormal];
    moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [moreBtn addTarget:self action:@selector(moreButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:moreBtn];
    self.moreBtn = moreBtn;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:13];
    contentLabel.textColor = HEXCOLOR(0x333333);
    contentLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.contentSize = CGSizeMake(0, 0);
    [self.contentView addSubview:scrollView];
    self.scrollView = scrollView;
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,20)
    .widthIs(40)
    .heightIs(40);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    moreBtn.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topEqualToView(iconImageView)
    .widthIs(100)
    .heightIs(20);
    
    nameLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(moreBtn,10)
    .heightIs(20);
    
    secondNameLabel.sd_layout
    .leftEqualToView(nameLabel)
    .bottomEqualToView(iconImageView)
    .rightEqualToView(nameLabel)
    .heightRatioToView(nameLabel,1);
    
    contentLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(iconImageView,10)
    .autoHeightRatio(0);
    
    scrollView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(contentLabel,10)
    .heightIs((ScreenWidth - 40)/3 + 60);
    
    for (int i = 0; i < 3; i ++)
    {
        ProductView *productView = [[ProductView alloc] init];
        productView.tag = 100 + i;
        productView.delegate = self;
        productView.hidden = YES;
        [scrollView addSubview:productView];
        
        CGFloat itemW = (ScreenWidth - 60)/3;
        CGFloat itemH = (ScreenWidth - 60)/3 + 60;
        
        productView.frame = CGRectMake(i * (itemW + 15) + 15, 0, itemW, itemH);
    }
    
}

- (void)setModel:(ModelSaleProductDetail *)model
{
    _model = model;
    
    self.guid = model.BrandObject.Guid;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.BrandObject.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    self.nameLabel.text = model.BrandObject.Name;
    self.secondNameLabel.text = model.BrandObject.Description;
    self.contentLabel.text = model.BrandObject.DetailDescription;
    [self.moreBtn setTitle:[NSString stringWithFormat:@"查看%@件商品  >",model.BrandProductQuantity] forState:UIControlStateNormal];
    
    ProductView *productView1 = [self.scrollView viewWithTag:100];
    ProductView *productView2 = [self.scrollView viewWithTag:101];
    ProductView *productView3 = [self.scrollView viewWithTag:102];
    
    if (model.BrandProduct1) {
        productView1.hidden = NO;
        productView1.model = model.BrandProduct1;
    }
    if (model.BrandProduct2) {
        productView2.hidden = NO;
        productView2.model = model.BrandProduct2;
    }
    if (model.BrandProduct3) {
        productView3.hidden = NO;
        productView3.model = model.BrandProduct3;
    }
    
    if (model.BrandProduct1) {
        [self setupAutoHeightWithBottomView:self.scrollView bottomMargin:10];
    }else{
        [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:10];
    }
}

- (void)moreButtonAction
{
    if (self.seeMoreBlock){
        self.seeMoreBlock(self.guid);
    }
}

//单个商品跳转
- (void)clickProductButtonWithProductId:(NSString *)productId
{
    if (self.brandCellBlock){
        self.brandCellBlock(productId);
    }
    
}

@end
