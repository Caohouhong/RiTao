//
//  SettlementCangkuCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementCangkuCell.h"

@interface SettlementCangkuCell ()

@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation SettlementCangkuCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementCangkuCell";
    SettlementCangkuCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementCangkuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.image = [UIImage imageNamed:@"cangku"];
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconimageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"上海保税仓";
    nameLabel.font = TFont(13);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(15).heightIs(15);
    
    nameLabel.sd_layout
    .leftSpaceToView(iconimageView,5)
    .centerYEqualToView(iconimageView)
    .rightSpaceToView(self.contentView,20)
    .heightIs(15);
    
    
}

- (void)setModel:(ModelMemberShopCartDetailCollection *)model
{
    _model = model;
    
    self.nameLabel.text = model.WarehouseName;
}

@end
