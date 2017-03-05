//
//  ProductPinPaiChooseCell.m
//  日淘
//
//  Created by 李强 on 2016/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductPinPaiChooseCell.h"

@interface ProductPinPaiChooseCell()
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation ProductPinPaiChooseCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self drawView];
    }
    return self;
}

-(void)drawView
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"雅诗兰黛";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0);
}

-(void)setModel:(ModelBrandCollection *)model {
    _model = model;
    
    NSLog(@"%@",model.Name);
    self.titleLabel.text = model.Name;
    
    if (model.isSelect) {
        self.titleLabel.textColor = COLOR_Red2;
    }else{
        self.titleLabel.textColor = HEXCOLOR(0x333333);
    }
    
}

@end
