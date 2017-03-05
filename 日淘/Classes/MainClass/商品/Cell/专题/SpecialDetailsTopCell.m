//
//  SpecialDetailsTopCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsTopCell.h"

@interface SpecialDetailsTopCell()
@property (nonatomic, weak) UIImageView *headImage;
@end

@implementation SpecialDetailsTopCell

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR_BackgroundColor;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIImageView *headImage = [[UIImageView alloc]init];
    headImage.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:headImage];
    self.headImage = headImage;
 
    headImage.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .bottomSpaceToView(self,0);
    
}


-(void)setUrlStr:(NSString *)urlStr {
    _urlStr = urlStr;
    
    [self.headImage sd_setImageWithURL:IMAGE_URL(urlStr) placeholderImage:nil];
}

@end
