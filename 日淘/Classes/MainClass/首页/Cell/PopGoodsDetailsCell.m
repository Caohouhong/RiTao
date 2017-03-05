//
//  PopGoodsDetailsCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PopGoodsDetailsCell.h"

@implementation PopGoodsDetailsCell

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    nameLabel.layer.borderWidth = 0.5;
    nameLabel.text = @"黑/灰34";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = TFont(12);
    [self addSubview:nameLabel];
    
    nameLabel.sd_layout
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .topSpaceToView(self,5)
    .bottomSpaceToView(self,5);
    nameLabel.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    
}


@end
