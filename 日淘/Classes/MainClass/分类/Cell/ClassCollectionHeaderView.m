//
//  ClassCollectionHeaderView.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ClassCollectionHeaderView.h"

@implementation ClassCollectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"常用分类";
    nameLabel.font = TFont(14);
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(100).heightIs(20);
    
}

@end
