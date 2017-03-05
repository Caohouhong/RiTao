//
//  ChildQuickEntryView.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildQuickEntryView.h"
#import "SpecialDetailsVC.h"

@interface ChildQuickEntryView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation ChildQuickEntryView

- (instancetype)init
{
    if (self =[super init])
    {
        [self drawView];
    }
    
    return self;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
//    iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"标题";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    iconImageView.sd_layout
    .topSpaceToView(self,17)
    .centerXEqualToView(self)
    .widthIs(48) //65
    .heightEqualToWidth();
    
    titleLabel.sd_layout
    .leftSpaceToView(self,5)
    .rightSpaceToView(self,5)
    .bottomSpaceToView(self,12)
    .heightIs(18);
}


- (void)setModel:(ModelTopicCollection *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.DisplayPicture) placeholderImage:[UIImage imageNamed:@"default"]];
    self.titleLabel.text = model.Name;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SpecialDetailsVC *vc = [SpecialDetailsVC new];
    vc.guid = self.model.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc
                           animated:YES];
}

@end
