//
//  SpecialDetailsHeaderView.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsHeaderView.h"

@interface SpecialDetailsHeaderView()
@property (nonatomic, weak) UIView *backView;
@end

@implementation SpecialDetailsHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        
        [self initView];
    }
    return self;
}

-(void)initView {
    
//    UIView *backView = [[UIView alloc]init];
//    backView.backgroundColor = [UIColor clearColor];
//    [self addSubview:backView];
//    self.backView = backView;
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.image = GETIMAGE(@"remenfenlei");
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:iconimageView];
    self.iconimageView = iconimageView;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"";
    nameLabel.font = TFont(14.0);
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;

    nameLabel.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .heightIs(20);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:150];


    iconimageView.sd_layout
    .rightSpaceToView(nameLabel,3)
    .centerYEqualToView(self)
    .widthIs(15).heightIs(15);
}


@end
