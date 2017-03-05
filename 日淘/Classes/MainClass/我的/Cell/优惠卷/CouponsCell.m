//
//  CouponsCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "CouponsCell.h"

@interface CouponsCell()
@property (nonatomic, weak) UILabel *topLabel;
@property (nonatomic, weak) UILabel *leftLabel;
@property (nonatomic, weak) UILabel *leftBottomLabel;
@property (nonatomic, weak) UILabel *rightLabel;
@property (nonatomic, weak) UILabel *rightBottomLabel;
@end

@implementation CouponsCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"CouponsCell";
    CouponsCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[CouponsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

-(void)initView {
    UIImageView *backImageView = [[UIImageView alloc]init];
    backImageView.image = [UIImage imageNamed:@"juxing-1"];
    [self.contentView addSubview:backImageView];
    
    backImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
    UILabel *topLabel = [[UILabel alloc]init];
    topLabel.font = TFont(13.0);
    topLabel.text = @"黑色星期五 1500-150";
    topLabel.textColor = LQRGBColor(190, 224, 0, 1);
    [backImageView addSubview:topLabel];
    [backImageView addSubview:topLabel];
    self.topLabel = topLabel;
    
    UILabel *leftLabel = [[UILabel alloc]init];
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.text = @"￥150";
    leftLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    [backImageView addSubview:leftLabel];
    self.leftLabel = leftLabel;

    UILabel *leftBottomLabel = [[UILabel alloc]init];
    leftBottomLabel.textColor = LQRGBColor(190, 224, 0, 1);
    leftBottomLabel.font = TFont(13);
    leftBottomLabel.text = @"满￥1500使用";
    [backImageView addSubview:leftBottomLabel];
    self.leftBottomLabel = leftBottomLabel;

    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.textColor = [UIColor lightGrayColor];
    rightLabel.font = TFont(12);
    rightLabel.text = @"2016.11.27到期";
    [backImageView addSubview:rightLabel];
    self.rightLabel = rightLabel;
    
    UILabel *rightBottomLabel = [[UILabel alloc]init];
    rightBottomLabel.textColor = [UIColor whiteColor];
    rightBottomLabel.font = TFont(13);
    rightBottomLabel.text = @"日本直邮仓-母婴商品使用";
    [backImageView addSubview:rightBottomLabel];
    self.rightBottomLabel = rightBottomLabel;
    
    topLabel.sd_layout
    .leftSpaceToView(backImageView,20)
    .topSpaceToView(backImageView,12)
    .widthIs(200).heightIs(20);
    
    leftBottomLabel.sd_layout
    .bottomSpaceToView(backImageView,15)
    .leftSpaceToView(backImageView,20)
    .widthIs(ScreenWidth/2).heightIs(20);
    
    leftLabel.sd_layout
    .bottomSpaceToView(leftBottomLabel,5)
    .leftSpaceToView(backImageView,20)
    .heightIs(25).widthIs(ScreenWidth/2);
    
    rightBottomLabel.sd_layout
    .bottomSpaceToView(backImageView,15)
    .leftSpaceToView(backImageView,ScreenWidth/2-20)
    .rightSpaceToView(backImageView,5).heightIs(20);
    
    rightLabel.sd_layout
    .bottomSpaceToView(rightBottomLabel,5)
    .leftSpaceToView(backImageView,ScreenWidth/2-20)
    .heightIs(15).widthIs(ScreenWidth/2);
    
}

-(void)setModel:(ModelMemberSaleCouponCollection *)model {
    
    _model = model;
    
    self.topLabel.text = model.Description;
    self.leftLabel.text = model.SaleCouponValue;
    self.leftBottomLabel.text = model.BuyRule;
    self.rightLabel.text = model.DisplayStatus;
    self.rightBottomLabel.text = model.BuyRange;
    
    
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
