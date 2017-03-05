//
//  MeMainCell_5.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_5.h"
#import "FeedbackVC.h"
#import "AboutRiTaoVC.h"
#import "BrowsingHistoryVC.h"

@implementation MeMainCell_5

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_5 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_5";
    MeMainCell_5 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_5 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1 setTitle:@"意见反馈" forState:UIControlStateNormal];
    [btn1 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"意见反馈"] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 setTitle:@"客服中心" forState:UIControlStateNormal];
    [btn2 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"客服中心"] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.backgroundColor = [UIColor whiteColor];
    [btn3 setTitle:@"关于日淘" forState:UIControlStateNormal];
    [btn3 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"关于日淘"] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.backgroundColor = [UIColor whiteColor];
    [btn4 setTitle:@"浏览记录" forState:UIControlStateNormal];
    [btn4 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"浏览记录"] forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn4 addTarget:self action:@selector(btn4) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn4];
    
    btn1.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs((ScreenWidth - 30)/4)
    .heightIs((ScreenWidth - 30)/4);
    
    btn2.sd_layout
    .leftSpaceToView(btn1,0)
    .centerYEqualToView(self.contentView)
    .widthIs((ScreenWidth - 30)/4)
    .heightIs((ScreenWidth - 30)/4);
    
    btn3.sd_layout
    .leftSpaceToView(btn2,0)
    .centerYEqualToView(self.contentView)
    .widthIs((ScreenWidth - 30)/4)
    .heightIs((ScreenWidth - 30)/4);
    
    btn4.sd_layout
    .leftSpaceToView(btn3,0)
    .centerYEqualToView(self.contentView)
    .widthIs((ScreenWidth - 30)/4)
    .heightIs((ScreenWidth - 30)/4);
    
    CGFloat space = 5.0;
    [btn1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                          imageTitleSpace:space];
    [btn2 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                          imageTitleSpace:space];
    [btn3 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                          imageTitleSpace:space];
    [btn4 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                          imageTitleSpace:space];
}

-(void)btn1 {
    FeedbackVC *vc = [[FeedbackVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn2 {
    
}
-(void)btn3 {
    AboutRiTaoVC *vc = [[AboutRiTaoVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn4 {
    BrowsingHistoryVC *vc = [[BrowsingHistoryVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

@end
