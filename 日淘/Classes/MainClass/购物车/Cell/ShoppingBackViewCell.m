//
//  ShoppingBackViewCell.m
//  日淘
//
//  Created by 唐硕 on 17/1/24.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ShoppingBackViewCell.h"

@implementation ShoppingBackViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"ShoppingBackViewCell";
    ShoppingBackViewCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[ShoppingBackViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(void)initView {

    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"购物车里没有东西哦，快去挑选吧~~";
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.font = TFont(13);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:nameLabel];
    
    UIImageView *iconimageview = [[UIImageView alloc]init];
    iconimageview.backgroundColor = [UIColor clearColor];
    iconimageview.image = [UIImage imageNamed:@"s_nothing_112x106"];
    [self.contentView addSubview:iconimageview];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.titleLabel.font = TFont(15);
    [btn setTitle:@"逛逛首页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 3;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 1;
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    nameLabel.sd_layout
    .centerXEqualToView(self.contentView)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth).heightIs(20);
    
    btn.sd_layout
    .topSpaceToView(nameLabel,20)
    .centerXEqualToView(self.contentView)
    .widthIs(80).heightIs(30);
    
    iconimageview.sd_layout
    .bottomSpaceToView(nameLabel,30)
    .centerXEqualToView(self.contentView)
    .widthIs(112).heightIs(106);
    
}


-(void)btn {
    if(self.block) {
        self.block();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
