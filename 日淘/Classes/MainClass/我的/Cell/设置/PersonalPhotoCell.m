//
//  PersonalPhotoCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PersonalPhotoCell.h"

@implementation PersonalPhotoCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PersonalPhotoCell";
    PersonalPhotoCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PersonalPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    //iconimageView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:iconimageView];
    self.iconimageView = iconimageView;
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"修改头像";
    nameLabel.font = TFont(12);
    nameLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:nameLabel];
    
    iconimageView.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(40).heightIs(40);
    iconimageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(8).heightIs(12);
    
    nameLabel.sd_layout
    .rightSpaceToView(arrowimageView,5)
    .centerYEqualToView(self.contentView)
    .heightIs(15);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:100];
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
