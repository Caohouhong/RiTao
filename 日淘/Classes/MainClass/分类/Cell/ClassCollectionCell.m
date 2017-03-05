//
//  ClassCollectionCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ClassCollectionCell.h"

@interface ClassCollectionCell()
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@end
@implementation ClassCollectionCell


-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    iconImageView.image = [UIImage imageNamed:@"yuanzhuangzhengpin"];
    iconImageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"女性护理";
    nameLabel.font = TFont(11);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    iconImageView.sd_layout
    .leftSpaceToView(self,2)
    .rightSpaceToView(self,2)
    .topSpaceToView(self,2)
    .heightIs(self.frame.size.width-4);
    
    nameLabel.sd_layout
    .leftEqualToView(iconImageView)
    .rightEqualToView(iconImageView)
    .topSpaceToView(iconImageView,5)
    .heightIs(20);
    
}

-(void)setModel:(CategoryCollectionModel *)model {
    _model = model;
    
    self.nameLabel.text = model.Name;
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    
}



@end
