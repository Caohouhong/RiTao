//
//  ProductDetailTagView.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailTagView.h"

@interface ProductDetailTagView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation ProductDetailTagView

- (instancetype)init
{
    if (self =[super init])
    {
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"标题";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    iconImageView.sd_layout
    .topSpaceToView(self,15)
    .centerXEqualToView(self)
    .widthIs(50)
    .heightEqualToWidth();
    
    titleLabel.sd_layout
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .bottomSpaceToView(self,5)
    .heightIs(18);
}

- (void)setDataDic:(NSDictionary *)dataDic
{
    _dataDic = dataDic;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(dataDic[kImage]) placeholderImage:[UIImage imageNamed:@"default"]];
    self.titleLabel.text = dataDic[kTitle];
}

@end
