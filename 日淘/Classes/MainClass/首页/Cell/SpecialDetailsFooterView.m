//
//  SpecialDetailsFooterView.m
//  日淘
//
//  Created by 李强 on 2017/1/22.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "SpecialDetailsFooterView.h"

@implementation SpecialDetailsFooterView


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"本页已加载完成，看看其他页面把~";
    nameLabel.font = TFont(14.0);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:nameLabel];
    
    nameLabel.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .heightIs(20)
    .widthIs(200);

}
@end
