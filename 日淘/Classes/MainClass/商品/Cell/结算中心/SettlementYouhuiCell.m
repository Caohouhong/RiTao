//
//  SettlementYouhuiCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementYouhuiCell.h"

@interface SettlementYouhuiCell ()

@property (nonatomic, weak) UILabel *kuaidiLabel;

@end

@implementation SettlementYouhuiCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementYouhuiCell";
    SettlementYouhuiCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementYouhuiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    [self addUnderlineWithLeftMargin:25 rightMargin:25 lineHeight:0.5];
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"优惠卷";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Black;
    [self.contentView addSubview:nameLabel];
    
    UILabel *kuaidiLabel = [[UILabel alloc]init];
    kuaidiLabel.text = @"慢128-100";
    kuaidiLabel.font = TFont(12);
    [self.contentView addSubview:kuaidiLabel];
    self.kuaidiLabel = kuaidiLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(100).heightIs(15);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(8).heightIs(10);
    
    kuaidiLabel.sd_layout
    .rightSpaceToView(arrowimageView,5)
    .centerYEqualToView(self.contentView)
    .heightIs(15);
    [kuaidiLabel setSingleLineAutoResizeWithMaxWidth:100];

}

- (void)setModel:(ModelWfxPrepareSaleOrder *)model
{
    _model = model;
    
    self.kuaidiLabel.text = model.CouponDescription;
}

@end
