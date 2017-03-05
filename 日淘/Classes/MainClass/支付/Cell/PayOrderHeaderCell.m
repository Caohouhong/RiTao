//
//  PayOrderHeaderCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PayOrderHeaderCell.h"

@implementation PayOrderHeaderCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"PayOrderHeaderCell";
    PayOrderHeaderCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[PayOrderHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    UILabel *nameLabel = [UILabel createLabelWithText:@"选择支付方式" font:13];
    [self.contentView addSubview:nameLabel];
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,5)
    .widthIs(100).heightIs(20);
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
