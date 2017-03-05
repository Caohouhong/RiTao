//
//  SettlementShengfenCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettlementShengfenCell.h"

@interface SettlementShengfenCell ()

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *fenLabel;

@end

@implementation SettlementShengfenCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettlementShengfenCell";
    SettlementShengfenCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettlementShengfenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *xinxiLabel = [[UILabel alloc]init];
    xinxiLabel.text = @"身份信息";
    xinxiLabel.font = TFont(14);
    [self.contentView addSubview:xinxiLabel];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"唐硕";
    nameLabel.font = TFont(14);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *fenLabel = [[UILabel alloc]init];
    fenLabel.text = @"身份证: 2302323023023023023";
    fenLabel.font = TFont(14);
    [self.contentView addSubview:fenLabel];
    self.fenLabel = fenLabel;
    
    
    xinxiLabel.sd_layout
    .leftSpaceToView(self.contentView,25)
    .topSpaceToView(self.contentView,10)
    .widthIs(200).heightIs(15);
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,25)
    .topSpaceToView(xinxiLabel,10)
    .widthIs(200).heightIs(15);
    
    fenLabel.sd_layout
    .leftEqualToView(xinxiLabel)
    .topSpaceToView(nameLabel,5)
    .widthIs(200).heightIs(13);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,25)
    .centerYEqualToView(self.contentView)
    .widthIs(15).heightIs(17);
 
}

- (void)setModel:(ModelWfxPrepareSaleOrder *)model
{
    _model = model;
    
    self.nameLabel.text = model.CustomClearName;
    self.fenLabel.text = [NSString stringWithFormat:@"身份证:%@",model.CustomClearID];
}

- (void)setModel2:(ModelIDCardCollection *)model2
{
    _model2 = model2;
    
    self.nameLabel.text = model2.Name;
    self.fenLabel.text = [NSString stringWithFormat:@"身份证:%@",model2.ID];
}


@end
