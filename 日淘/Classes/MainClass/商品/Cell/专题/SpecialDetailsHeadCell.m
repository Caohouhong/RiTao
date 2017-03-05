//
//  SpecialDetailsHeadCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsHeadCell.h"

@implementation SpecialDetailsHeadCell

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.image = GETIMAGE(@"remenfenlei");
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:iconimageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"新生儿专题";
    nameLabel.font = TFont(14.0);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    nameLabel.sd_layout
    .bottomSpaceToView(self,5)
    .centerXEqualToView(self)
    .heightIs(15);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    iconimageView.sd_layout
    .rightSpaceToView(nameLabel,3)
    .centerYEqualToView(nameLabel)
    .widthIs(13).heightIs(13);

}


@end
