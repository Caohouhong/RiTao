//
//  MyUserCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MyUserCell.h"


@interface MyUserCell()
@property (nonatomic, weak) UILabel *phoneLabel;
@property (nonatomic, weak) UILabel *userLabel;
@property (nonatomic, weak) UILabel *leiLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UIImageView *iconimageView;
@end
@implementation MyUserCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"MyUserCell";
    MyUserCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MyUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    self.iconimageView = iconimageView;
    
    UILabel *userLabel = [[UILabel alloc]init];
    userLabel.text = @"客户昵称";
    userLabel.font = TFont(12);
    self.userLabel = userLabel;
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text = @"13900005194";
    phoneLabel.font = TFont(10);
    phoneLabel.textColor = COLOR_Gray;
    self.phoneLabel = phoneLabel;
    
    UILabel *leiLabel = [[UILabel alloc]init];
    leiLabel.text = @"累计消费";
    leiLabel.font = TFont(11);
    self.leiLabel = leiLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"9864.88";
    priceLabel.font = TFont(12);
    priceLabel.textColor = COLOR_Red;
    self.priceLabel = priceLabel;
    
    [self.contentView sd_addSubviews:@[iconimageView, userLabel, phoneLabel, leiLabel, priceLabel]];
    
    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(35).heightIs(35);
    iconimageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    userLabel.sd_layout
    .leftSpaceToView(iconimageView,15)
    .topEqualToView(iconimageView)
    .widthIs(200).heightIs(15);
    
    phoneLabel.sd_layout
    .leftSpaceToView(iconimageView,15)
    .bottomEqualToView(iconimageView)
    .widthIs(200).heightIs(15);
    
    leiLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topEqualToView(iconimageView)
    .heightIs(15);
    [leiLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    priceLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .bottomEqualToView(iconimageView)
    .heightIs(15);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
}

-(void) setModel:(ModelMySubordinatesCollection *)model {
    _model = model;
    
    [self.iconimageView sd_setImageWithURL:IMAGE_URL(model.Photo) placeholderImage:nil];
    self.userLabel.text = model.NickName;
    self.phoneLabel.text = model.Telephone;
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@", model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
    
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
