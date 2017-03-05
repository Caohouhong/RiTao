//
//  ProductCommentCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductCommentCell.h"
#import "ProductCommentImagesView.h"

@interface ProductCommentCell ()

@property (nonatomic, strong) ProductCommentImagesView *productCommentImagesView;
@property (nonatomic, strong) PortraitView *portraitView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation ProductCommentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductCommentCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductCommentCell";
    ProductCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    PortraitView *portraitView = [[PortraitView alloc] init];
    [self.contentView addSubview:portraitView];
    self.portraitView = portraitView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.text = @"姓名姓名姓名姓名姓名";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIImageView *moreImageView = [[UIImageView alloc] init];
    moreImageView.image = [UIImage imageNamed:@"jiantou"];
    moreImageView.hidden = YES;
    [self.contentView addSubview:moreImageView];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:13];
    contentLabel.textColor = HEXCOLOR(0x333333);
    contentLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    self.productCommentImagesView = [[ProductCommentImagesView alloc] init];
    [self.contentView addSubview:self.productCommentImagesView];
    
    portraitView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .widthIs(25)
    .heightIs(25);
    
    nameLabel.sd_layout
    .leftSpaceToView(portraitView,10)
    .topEqualToView(portraitView)
    .rightSpaceToView(self.contentView,40)
    .heightIs(18);
    
    moreImageView.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(portraitView,10)
    .widthIs(6)
    .heightIs(8);
    
    contentLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(portraitView,10)
    .rightSpaceToView(moreImageView,20)
    .autoHeightRatio(0);
    
    self.productCommentImagesView.sd_layout
    .leftEqualToView(contentLabel);
}

- (void)setModel:(ModelSaleProductCommentDetail *)model
{
    _model = model;
    
    [self.portraitView.portraitImageView sd_setImageWithURL:IMAGE_URL(model.MemberAvatar) placeholderImage:[UIImage imageNamed:@"default"]];
    self.nameLabel.text = model.MemberNickName;
    self.contentLabel.text = model.Content;
    
    NSMutableArray *picArray = [NSMutableArray array];
    
    for (NSString *str in model.PictureList)
    {
        [picArray addObject:IMAGEURLSTR(str)];
    }
    
    
    self.productCommentImagesView.picPathStringsArray = picArray;
    
    CGFloat picContainerTopMargin = 0;
    if (picArray.count)
    {
        picContainerTopMargin = 10;
    }
    self.productCommentImagesView.sd_layout
    .topSpaceToView(self.contentLabel, picContainerTopMargin);
    
    [self setupAutoHeightWithBottomView:self.productCommentImagesView bottomMargin:15];
}

@end
