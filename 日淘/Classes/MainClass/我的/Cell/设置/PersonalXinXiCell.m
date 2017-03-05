//
//  PersonalXinXiCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PersonalXinXiCell.h"

@implementation PersonalXinXiCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PersonalXinXiCell";
    PersonalXinXiCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PersonalXinXiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    nameLabel.font = TFont(12);
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIImageView *arrowimageView = [[UIImageView alloc]init];
    arrowimageView.image = [UIImage imageNamed:@"jiantou"];
    arrowimageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowimageView];
    
    UILabel *subLabel = [[UILabel alloc]init];
    subLabel.font = TFont(12);
    subLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:subLabel];
    self.subLabel = subLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(100).heightIs(15);
    
    arrowimageView.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(8).heightIs(12);
    
    subLabel.sd_layout
    .rightSpaceToView(arrowimageView,5)
    .centerYEqualToView(self.contentView)
    .heightIs(15);
    [subLabel setSingleLineAutoResizeWithMaxWidth:100];
    
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
