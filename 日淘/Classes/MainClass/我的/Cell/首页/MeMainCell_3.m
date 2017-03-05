//
//  MeMainCell_3.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_3.h"
#import "MainMyOrderVC.h"
#import "TuiKuanTuiHuoVC.h"

@interface MeMainCell_3()
@property (nonatomic, weak) UILabel *lab1;
@property (nonatomic, weak) UILabel *lab2;
@property (nonatomic, weak) UILabel *lab3;
@property (nonatomic, weak) UILabel *lab4;
@property (nonatomic, weak) UILabel *lab5;
@end
@implementation MeMainCell_3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_3 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_3";
    MeMainCell_3 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1 setTitle:@"待付款" forState:UIControlStateNormal];
    [btn1 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"待付款"] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 setTitle:@"待发货" forState:UIControlStateNormal];
    [btn2 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"待发货"] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.backgroundColor = [UIColor whiteColor];
    [btn3 setTitle:@"待收货" forState:UIControlStateNormal];
    [btn3 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"待收货"] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.backgroundColor = [UIColor whiteColor];
    [btn4 setTitle:@"待评价" forState:UIControlStateNormal];
    [btn4 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"待评价"] forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn4 addTarget:self action:@selector(btn4) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] init];
    btn5.backgroundColor = [UIColor whiteColor];
    [btn5 setTitle:@"退款/售后" forState:UIControlStateNormal];
    [btn5 setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [btn5 setImage:[UIImage imageNamed:@"退货退款"] forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn5 addTarget:self action:@selector(btn5) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn5];
    
    UILabel *lab1 = [self createLabel];
    lab1.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lab1];
    self.lab1 = lab1;
    
    UILabel *lab2 = [self createLabel];
    lab2.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lab2];
    self.lab2 = lab2;
    
    UILabel *lab3 = [self createLabel];
    lab3.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lab3];
    self.lab3 = lab3;
    
    UILabel *lab4 = [self createLabel];
    lab4.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lab4];
    self.lab4 = lab4;
    
    UILabel *lab5 = [self createLabel];
    lab5.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lab5];
    self.lab5 = lab5;
    
    btn1.sd_layout
    .leftSpaceToView(self.contentView,0)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth/5)
    .heightIs(ScreenWidth/5);
    
    lab1.sd_layout
    .leftSpaceToView(btn1,SizeScale(-27))
    .bottomSpaceToView(btn1,SizeScale(-23))
    .widthIs(15).heightIs(15);
    lab1.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    btn2.sd_layout
    .leftSpaceToView(btn1,0)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth/5)
    .heightIs(ScreenWidth/5);
    
    lab2.sd_layout
    .leftSpaceToView(btn2,SizeScale(-27))
    .bottomSpaceToView(btn2,SizeScale(-23))
    .widthIs(15).heightIs(15);
    lab2.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    btn3.sd_layout
    .leftSpaceToView(btn2,0)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth/5)
    .heightIs(ScreenWidth/5);
    
    lab3.sd_layout
    .leftSpaceToView(btn3,SizeScale(-27))
    .bottomSpaceToView(btn3,SizeScale(-23))
    .widthIs(15).heightIs(15);
    lab3.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    btn4.sd_layout
    .leftSpaceToView(btn3,0)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth/5)
    .heightIs(ScreenWidth/5);
    
    lab4.sd_layout
    .leftSpaceToView(btn4,SizeScale(-27))
    .bottomSpaceToView(btn4,SizeScale(-23))
    .widthIs(15).heightIs(15);
    lab4.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    btn5.sd_layout
    .leftSpaceToView(btn4,0)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth/5)
    .heightIs(ScreenWidth/5);
    
    lab5.sd_layout
    .leftSpaceToView(btn5,SizeScale(-27))
    .bottomSpaceToView(btn5,SizeScale(-23))
    .widthIs(15).heightIs(15);
    lab5.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    CGFloat space = 5.0;
    [btn1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [btn2 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [btn3 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [btn4 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [btn5 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:5];
}

-(void)setModel:(ModelMemberCenter *)model {
    _model = model;
    
    if(![model.WaitingToPay isEqualToString:@"0"]) {
        self.lab1.text = model.WaitingToPay;
        self.lab1.hidden = NO;
    }else {
        self.lab1.hidden = YES;
    }
    
    if(![model.WaitingToDelivery isEqualToString:@"0"]) {
        self.lab2.text = model.WaitingToDelivery;
        self.lab2.hidden = NO;
    }else {
       self.lab2.hidden = YES;
    }
    
    if(![model.WaitingToSign isEqualToString:@"0"]) {
        self.lab3.text = model.WaitingToSign;
        self.lab3.hidden = NO;
    }else {
        self.lab3.hidden = YES;
    }
    
    if(![model.WaitingToAssessment isEqualToString:@"0"]) {
        self.lab4.text = model.WaitingToAssessment;
        self.lab4.hidden = NO;
    }else {
       self.lab4.hidden = YES;
    }
    
    if(![model.ReturnsOrRefunds isEqualToString:@"0"]) {
        self.lab5.text = model.ReturnsOrRefunds;
        self.lab5.hidden = NO;
    }else {
       self.lab5.hidden = YES;
    }
}


-(UILabel *)createLabel {
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor redColor];
    label.layer.borderColor = [UIColor redColor].CGColor;
    label.layer.borderWidth = 1;
    label.textAlignment = NSTextAlignmentCenter;
    label.hidden = YES;
    return label;
}

-(void)btn1 {
    MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.type = 1;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn2 {
    MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.type = 2;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn3 {
    MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.type = 3;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn4 {
    MainMyOrderVC *vc = [[MainMyOrderVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.type = 4;
    [DCURLRouter pushViewController:vc animated:YES];
}
-(void)btn5 {
    TuiKuanTuiHuoVC *vc = [[TuiKuanTuiHuoVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}





@end
