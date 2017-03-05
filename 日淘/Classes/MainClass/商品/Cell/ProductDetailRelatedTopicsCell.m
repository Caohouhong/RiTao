//
//  ProductDetailRelatedTopicsCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailRelatedTopicsCell.h"
#import "ModelProductDetail.h"

@interface ProductDetailRelatedTopicsCell ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, assign) int index;

@end


@implementation ProductDetailRelatedTopicsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailRelatedTopicsCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"ProductDetailRelatedTopicsCell";
    ProductDetailRelatedTopicsCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailRelatedTopicsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:2];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x666666);
    titleLabel.text = @"关联专题";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .heightIs(18);
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:@"<" forState:UIControlStateNormal];
    [leftBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(didClickLeftBtn) forControlEvents:UIControlEventTouchDown];
    [self.contentView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:@">" forState:UIControlStateNormal];
    [rightBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(didClickRightBtn) forControlEvents:UIControlEventTouchDown];
    [self.contentView addSubview:rightBtn];
    
    leftBtn.sd_layout
    .topSpaceToView(titleLabel,10)
    .leftSpaceToView(self.contentView,15)
    .widthIs(30)
    .bottomSpaceToView(self.contentView,15);
    
    rightBtn.sd_layout
    .topEqualToView(leftBtn)
    .rightSpaceToView(self.contentView,15)
    .widthIs(30)
    .bottomEqualToView(leftBtn);
    
    iconImageView.sd_layout
    .leftSpaceToView(leftBtn,0)
    .rightSpaceToView(rightBtn,0)
    .topEqualToView(leftBtn)
    .bottomEqualToView(leftBtn);
    
    if (self.dataArray.count)
    {
        ModelTopicCollection *model = [self.dataArray firstObject];
        
        self.index = 0;
        
        [iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    }
}

- (void)didClickLeftBtn
{
    if (self.index == 0)
    {
        self.index = (int)self.dataArray.count - 1;
    }else{
        self.index --;
    }
    
    
    ModelTopicCollection *model = self.dataArray[self.index];
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
}

- (void)didClickRightBtn
{
    if (self.index == (int)self.dataArray.count - 1)
    {
        self.index = 0;
    }else{
        self.index ++;
    }
    
    
    ModelTopicCollection *model = self.dataArray[self.index];
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    
}

@end
