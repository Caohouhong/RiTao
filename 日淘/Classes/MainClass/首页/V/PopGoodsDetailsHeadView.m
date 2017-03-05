//
//  PopGoodsDetailsHeadView.m
//  日淘
//
//  Created by 唐硕 on 16/12/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PopGoodsDetailsHeadView.h"

@implementation PopGoodsDetailsHeadView

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"请选择型号:";
    nameLabel.font = TFont(12);
    [self addSubview:nameLabel];
    
    nameLabel.sd_layout
    .leftSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(150).heightIs(20);
    
    
}



@end
