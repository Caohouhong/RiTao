//
//  OrderDetailsShouJianCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsShouJianCell.h"

@interface OrderDetailsShouJianCell ()

@property (nonatomic, weak) UILabel *shoujianLabel;
@property (nonatomic, weak) UILabel *fenLabel;
@property (nonatomic, weak) UILabel *addressLabel;

@end

@implementation OrderDetailsShouJianCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderDetailsShouJianCell";
    OrderDetailsShouJianCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderDetailsShouJianCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    [self addUnderlineWithLeftMargin:10 rightMargin:10 lineHeight:3];
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    //iconimageView.backgroundColor = [UIColor orangeColor];
    iconimageView.image = [UIImage imageNamed:@"dizhi"];
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconimageView];
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UILabel *shoujianLabel = [[UILabel alloc]init];
    shoujianLabel.text = @"收件人:唐  18800540333";
    shoujianLabel.font = TFont(13);
    [self.contentView addSubview:shoujianLabel];
    self.shoujianLabel = shoujianLabel;
    
    UILabel *fenLabel = [[UILabel alloc]init];
    fenLabel.text = @"身份证: 2302323023023023023";
    fenLabel.font = TFont(11);
    [self.contentView addSubview:fenLabel];
    self.fenLabel = fenLabel;
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.text = @"江苏省 无锡市 南长区 水仙里 ";
    addressLabel.font = TFont(11);
    [self.contentView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .widthIs(15).heightIs(18);
    
    shoujianLabel.sd_layout
    .leftSpaceToView(iconimageView,5)
    .centerYEqualToView(iconimageView)
    .rightSpaceToView(self.contentView,20)
    .heightIs(15);
    
    fenLabel.sd_layout
    .leftEqualToView(shoujianLabel)
    .topSpaceToView(shoujianLabel,5)
    .widthIs(200).heightIs(13);
    
    addressLabel.sd_layout
    .leftEqualToView(shoujianLabel)
    .topSpaceToView(fenLabel,5)
    .rightSpaceToView(self.contentView,25)
    .heightIs(13);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(shoujianLabel)
    .widthIs(8).heightIs(12);
}

- (void)setModel:(ModelWfxSaleOrderDetail *)model
{
    _model = model;
    
    self.shoujianLabel.text = [NSString stringWithFormat:@"收件人:%@ %@",model.Consignee,model.ConsigneeTelephone];
    self.fenLabel.text = [NSString stringWithFormat:@"身份证: %@",model.ConsigneeIDCardNumber];
    self.addressLabel.text = model.ConsigneeAddress;
}

@end
