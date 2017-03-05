//
//  CommoditySearchCell.m
//  日淘
//
//  Created by 唐硕 on 17/1/6.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "CommoditySearchCell.h"


@interface CommoditySearchCell()
//@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation CommoditySearchCell



-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {

        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1.0f;
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
}

@end
