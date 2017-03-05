//
//  PayOrderSecondCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PayOrderSecondCell.h"

@interface PayOrderSecondCell()
@end
@implementation PayOrderSecondCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PayOrderSecondCell";
    PayOrderSecondCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PayOrderSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:0.5];
    
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.layer.cornerRadius = 10;
    self.iconimageView = imageview;
    
    UILabel *shangLabel = [[UILabel alloc]init];
    shangLabel.font = TFont(12);
    self.shangLabel = shangLabel;
    
    UILabel *xiaLabel = [[UILabel alloc]init];
    xiaLabel.font = TFont(11);
    xiaLabel.textColor = COLOR_Gray;
    self.xiaLabel = xiaLabel;
    
    UIButton *selectBtn = [[UIButton alloc]init];
    [selectBtn setImage:GETIMAGE(@"Base") forState:UIControlStateNormal];
    [selectBtn setImage:GETIMAGE(@"RadioOn") forState:UIControlStateSelected];
    //[selectBtn addTarget:self action:@selector(selectBtn:) forControlEvents:
    // UIControlEventTouchUpInside];
    selectBtn.touchExtendInset = UIEdgeInsetsMake(-10, -30, -10, -20);
    self.selectBtn = selectBtn;
    
    [self.contentView sd_addSubviews:@[shangLabel,xiaLabel,imageview,selectBtn]];
    
    imageview.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(35).heightIs(35);
    
    shangLabel.sd_layout
    .topEqualToView(imageview)
    .leftSpaceToView(imageview,10)
    .widthIs(100).heightIs(15);
    
    xiaLabel.sd_layout
    .bottomEqualToView(imageview)
    .leftSpaceToView(imageview,10)
    .widthIs(ScreenWidth).heightIs(15);
    
    selectBtn.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(15).heightIs(15);

}


-(void)selectBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
//    self.selectBtn.selected = NO;
//    btn.selected = YES;
//    self.selectBtn = btn;
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
