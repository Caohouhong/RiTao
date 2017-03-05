//
//  SettingCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SettingCell";
    SettingCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = TFont(13);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *versionLabel = [[UILabel alloc]init];
    versionLabel.font = TFont(11);
    versionLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:versionLabel];
    self.versionLabel = versionLabel;
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self.contentView addSubview:lineView];
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(150).heightIs(15);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(8).heightIs(12);
    
    versionLabel.sd_layout
    .rightSpaceToView(arrowimageView,5)
    .centerYEqualToView(self.contentView)
    .heightIs(10);
    [versionLabel setSingleLineAutoResizeWithMaxWidth:100];
    
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
