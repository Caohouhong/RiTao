//
//  MeMainCell_1.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_1.h"
#import "CouponsVC.h"
#import "MyCollectionVC.h"
#import "PersonalXinXiVC.h"

@interface MeMainCell_1()
@property (nonatomic, weak) UIImageView *iconBtn;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIButton *levelBtn;
@property (nonatomic, weak) UILabel *youHuiQuanLabel;
@property (nonatomic, weak) UILabel *shouCangLabel;
@property (nonatomic, weak) UILabel *jiFengLabel;
@end

@implementation MeMainCell_1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = HEXCOLOR(0xf5f2f7);
        
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_1 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_1";
    MeMainCell_1 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
//    UIButton *setBtn = [[UIButton alloc] init];
//    //messageBtn.backgroundColor = [UIColor redColor];
//    [setBtn setImage:GETIMAGE(@"xiaoxi") forState:UIControlStateNormal];
//    [self.contentView addSubview:setBtn];
//    
//    
//    UIButton *messageBtn = [[UIButton alloc] init];
//    //messageBtn.backgroundColor = [UIColor redColor];
//    [messageBtn setImage:GETIMAGE(@"xiaoxi") forState:UIControlStateNormal];
//    [self.contentView addSubview:messageBtn];
    
    UIImageView *iconBtn = [[UIImageView alloc] init];
    [self.contentView addSubview:iconBtn];
    iconBtn.userInteractionEnabled = YES;
    self.iconBtn = iconBtn;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicktap)];
    [iconBtn addGestureRecognizer:tap];
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.text = @"标题";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIButton *levelBtn = [[UIButton alloc] init];
    levelBtn.backgroundColor = [UIColor whiteColor];
    [levelBtn setTitle:@"普通用户" forState:UIControlStateNormal];
    [levelBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    levelBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:levelBtn];
    self.levelBtn = levelBtn;
    
    UILabel *youHuiQuanLabel = [[UILabel alloc] init];
    youHuiQuanLabel.font = [UIFont systemFontOfSize:14];
    youHuiQuanLabel.textColor = HEXCOLOR(0x333333);
    youHuiQuanLabel.backgroundColor = [UIColor whiteColor];
    youHuiQuanLabel.numberOfLines = 2;
    youHuiQuanLabel.text = @"24\n优惠券";
    youHuiQuanLabel.textAlignment = NSTextAlignmentCenter;
    youHuiQuanLabel.userInteractionEnabled = YES;
    [self.contentView addSubview:youHuiQuanLabel];
    self.youHuiQuanLabel = youHuiQuanLabel;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(youhuijuan)];
    [youHuiQuanLabel addGestureRecognizer:tap1];
    
    UILabel *shouCangLabel = [[UILabel alloc] init];
    shouCangLabel.font = [UIFont systemFontOfSize:14];
    shouCangLabel.textColor = HEXCOLOR(0x333333);
    shouCangLabel.backgroundColor = [UIColor whiteColor];
    shouCangLabel.numberOfLines = 2;
    shouCangLabel.text = @"24\n我的收藏";
    shouCangLabel.textAlignment = NSTextAlignmentCenter;
    shouCangLabel.userInteractionEnabled = YES;
    [self.contentView addSubview:shouCangLabel];
    self.shouCangLabel = shouCangLabel;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shoucang)];
    [shouCangLabel addGestureRecognizer:tap2];
    
    UILabel *jiFengLabel = [[UILabel alloc] init];
    jiFengLabel.font = [UIFont systemFontOfSize:14];
    jiFengLabel.textColor = HEXCOLOR(0x333333);
    jiFengLabel.backgroundColor = [UIColor whiteColor];
    jiFengLabel.numberOfLines = 2;
    jiFengLabel.text = @"24\n积分";
    jiFengLabel.textAlignment = NSTextAlignmentCenter;
    jiFengLabel.userInteractionEnabled = YES;
    [self.contentView addSubview:jiFengLabel];
    self.jiFengLabel = jiFengLabel;
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jifen)];
    [jiFengLabel addGestureRecognizer:tap3];
    
    
//    setBtn.sd_layout
//    .leftSpaceToView(self.contentView,15)
//    .topSpaceToView(self.contentView,35)
//    .heightIs(20)
//    .widthIs(20);
//    
//    messageBtn.sd_layout
//    .rightSpaceToView(self.contentView,15)
//    .topSpaceToView(self.contentView,35)
//    .heightIs(20)
//    .widthIs(20);
    
    iconBtn.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,50)
    .widthIs(70)
    .heightIs(70);
    iconBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    nameLabel.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(iconBtn,10)
    .widthIs(200)
    .heightIs(20);
    
    levelBtn.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(nameLabel,10)
    .widthIs(100)
    .heightIs(20);
    levelBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    shouCangLabel.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(levelBtn,30)
    .widthIs((ScreenWidth - 30 - 20)/3)
    .heightIs(60);
    
    youHuiQuanLabel.sd_layout
    .rightSpaceToView(shouCangLabel,10)
    .topEqualToView(shouCangLabel)
    .bottomEqualToView(shouCangLabel)
    .widthRatioToView(shouCangLabel,1);
    
    jiFengLabel.sd_layout
    .leftSpaceToView(shouCangLabel,10)
    .topEqualToView(shouCangLabel)
    .bottomEqualToView(shouCangLabel)
    .widthRatioToView(shouCangLabel,1);
    
}

-(void)setModel:(ModelMemberCenter *)model {
    
    [self.iconBtn sd_setImageWithURL:IMAGE_URL(model.Photo) placeholderImage:nil];
    
    self.nameLabel.text = model.NickName;
    
    if([model.VIP isEqualToString:@"0"]) {
        self.levelBtn.backgroundColor = [UIColor redColor];
        [self.levelBtn setTitle:@"普通会员" forState:UIControlStateNormal];
    }else {
        self.levelBtn.backgroundColor = [UIColor whiteColor];
        [self.levelBtn setTitle:@"淘客会员" forState:UIControlStateNormal];
 
    }
    
    NSMutableAttributedString *att1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.CouponCount] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [att1 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n优惠券" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    NSMutableAttributedString *att2 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.FavoriteCount] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [att2 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n我的收藏" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    NSMutableAttributedString *att3 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.MemberPoints] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [att3 appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n积分" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    self.youHuiQuanLabel.attributedText = att1;
    self.shouCangLabel.attributedText = att2;
    self.jiFengLabel.attributedText = att3;
    //self.youHuiQuanLabel.text = [NSString stringWithFormat:@"%@\n优惠卷",model.CouponCount];
//    self.shouCangLabel.text = [NSString stringWithFormat:@"%@\n我的收藏",model.FavoriteCount];
//    self.jiFengLabel.text = [NSString stringWithFormat:@"%@\n积分",model.MemberPoints];
}

-(void)clicktap {
    PersonalXinXiVC *vc = [[PersonalXinXiVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)youhuijuan {
    CouponsVC *vc = [[CouponsVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)shoucang {
    MyCollectionVC *vc = [[MyCollectionVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

-(void)jifen {
    
}

@end
