//
//  MainEveryoneBuyCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainEveryoneBuyCell.h"

@implementation MainEveryoneBuyCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"MainEveryoneBuyCell";
    MainEveryoneBuyCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MainEveryoneBuyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
