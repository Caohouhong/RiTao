//
//  TaokeView.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TaokeView.h"

@interface TaokeView ()

@end

@implementation TaokeView

-(id)initWithFrame:(CGRect)frame title:(NSString *)title imagestr:(NSString *)imagestr subtitle:(NSString *)subtitle {
    if(self = [super initWithFrame:frame]) {
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-20, 10, 40, 40)];
        imageview.image = [UIImage imageNamed:imagestr];
        [self addSubview:imageview];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageview.frame)+5, frame.size.width, 15)];
        nameLabel.text = title;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = HEXCOLOR(0x333333);
        nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:nameLabel];
        
        UILabel *subLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame), frame.size.width, 15)];
        subLabel.text = subtitle;
        subLabel.textAlignment = NSTextAlignmentCenter;
        subLabel.textColor = [UIColor lightGrayColor];
        subLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:subLabel];
        
    }
    return self;

}



@end
