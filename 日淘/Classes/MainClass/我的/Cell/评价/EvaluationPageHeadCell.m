//
//  EvaluationPageHeadCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/23.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationPageHeadCell.h"

@implementation EvaluationPageHeadCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"EvaluationPageHeadCell";
    EvaluationPageHeadCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[EvaluationPageHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    self.contentView.backgroundColor = LQRGBColor(220, 238, 222, 1);
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:iconimageView];
    
    UILabel *shopLabel = [[UILabel alloc]init];
    shopLabel.text = @"资生堂谁随时水手";
    shopLabel.font = TFont(13);
    [self.contentView addSubview:shopLabel];
    
    UILabel *guiLabel = [[UILabel alloc]init];
    guiLabel.text = @"商品规格";
    guiLabel.font = TFont(11);
    guiLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:guiLabel];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥99";
    priceLabel.font = TFont(11);
    priceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:priceLabel];
    
    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(50).heightIs(50);
    
    shopLabel.sd_layout
    .topEqualToView(iconimageView)
    .leftSpaceToView(iconimageView,10)
    .rightSpaceToView(self.contentView,20)
    .heightIs(15);
    
    guiLabel.sd_layout
    .bottomEqualToView(iconimageView)
    .leftSpaceToView(iconimageView,10)
    .widthIs(ScreenWidth/2)
    .heightIs(15);
    
    priceLabel.sd_layout
    .bottomEqualToView(iconimageView)
    .rightSpaceToView(self.contentView,10)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
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
