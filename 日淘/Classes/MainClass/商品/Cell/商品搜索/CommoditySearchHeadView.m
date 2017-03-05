//
//  CommoditySearchHeadView.m
//  日淘
//
//  Created by 唐硕 on 17/1/6.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "CommoditySearchHeadView.h"

@implementation CommoditySearchHeadView

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = TFont(14);
    nameLabel.textColor = [UIColor blackColor];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIButton *removeBtn = [[UIButton alloc]init];
    [removeBtn setImage:[UIImage imageNamed:@"shanchu"] forState:UIControlStateNormal];
    removeBtn.hidden = YES;
    [self addSubview:removeBtn];
    self.removeBtn = removeBtn;
    
    nameLabel.sd_layout
    .leftSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(100).heightIs(20);
    
    removeBtn.sd_layout
    .rightSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(25).heightIs(25);
}

@end
