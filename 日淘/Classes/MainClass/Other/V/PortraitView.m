//
//  PortraitView.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PortraitView.h"

@interface PortraitView ()
@property (nonatomic, weak)  UIImageView *vipImageView;
@end

@implementation PortraitView

- (instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor clearColor];
        
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"portrait"];
    iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:iconImageView];
    self.portraitImageView = iconImageView;
    
    iconImageView.sd_layout
    .leftSpaceToView(self,0)
    .topSpaceToView(self,0)
    .bottomSpaceToView(self,0)
    .rightSpaceToView(self,0);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    UIImageView *vipImageView = [[UIImageView alloc] init];
    vipImageView.image = [UIImage imageNamed:@"vip"];
    vipImageView.hidden = YES;
    [self addSubview:vipImageView];
    self.vipImageView = vipImageView;
    
    vipImageView.sd_layout
    .rightSpaceToView(self,0)
    .bottomSpaceToView(self,0)
    .widthIs(20)
    .heightIs(20);
    
}

- (void)setIsVip:(BOOL)isVip
{
    _isVip = isVip;
    
    self.vipImageView.hidden = !isVip;
}

@end
