//
//  HotClassView.m
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "HotClassView.h"

@interface HotClassView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong) NSString *productID;

@end

@implementation HotClassView

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
    //    iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x8b8b8b);
    titleLabel.text = @"标题";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    //点击商品跳转按钮
    UIButton *clickButton = [[UIButton alloc] init];
    clickButton.backgroundColor = [UIColor clearColor];
    [clickButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:clickButton];
    
    
    iconImageView.sd_layout
    .topSpaceToView(self,0)
    .centerXEqualToView(self)
    .widthIs(50)
    .heightEqualToWidth();
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    titleLabel.sd_layout
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .topSpaceToView(iconImageView,10)
    .heightIs(16);
    
    clickButton.sd_layout
    .leftSpaceToView(self,0)
    .bottomEqualToView(self)
    .topEqualToView(self)
    .rightEqualToView(self);
    
    
}

- (void)setModel:(ModelHotCategoryCollection *)model
{
    _model = model;
    
    self.productID = model.Guid;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
    self.titleLabel.text = model.Name;
}

//点击商品跳转
- (void)clickButton{
    if (self.delegate){
        [self.delegate clickProductButtonWithProductId:self.productID];
    }
}

@end
