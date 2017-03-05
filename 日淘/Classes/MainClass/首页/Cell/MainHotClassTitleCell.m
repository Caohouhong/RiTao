//
//  MainHotClassTitleCell.m
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MainHotClassTitleCell.h"

@implementation MainHotClassTitleCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"MainHotClassTitleCell";
    MainHotClassTitleCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MainHotClassTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.image = GETIMAGE(@"remenfenlei");
    iconimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconimageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    //nameLabel.text = @"精选商品 为您推荐";
    nameLabel.font = TFont(14.0);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    nameLabel.sd_layout
    .bottomSpaceToView(self.contentView,0)
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,0);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    
    iconimageView.sd_layout
    .rightSpaceToView(nameLabel,3)
    .centerYEqualToView(nameLabel)
    .widthIs(15).heightIs(15);
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
