//
//  SettlementLiuYanCell.m
//  日淘
//
//  Created by 李强 on 2017/2/15.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "SettlementLiuYanCell.h"

@implementation SettlementLiuYanCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (SettlementLiuYanCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"SettlementLiuYanCell";
    SettlementLiuYanCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[SettlementLiuYanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *hejiLabel = [[UILabel alloc]init];
    hejiLabel.text = @"买家留言:";
    hejiLabel.font = TFont(12);
    //hejiLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:hejiLabel];
    
    UITextField *textField = [[UITextField alloc]init];
    textField.font = [UIFont systemFontOfSize:12];
    textField.placeholder = @"选填，对本次购物的说明，留言给客服哦";
    [self.contentView addSubview:textField];
    
    
    hejiLabel.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,25)
    .widthIs(54)
    .bottomSpaceToView(self.contentView,0);
    
    textField.sd_layout
    .leftSpaceToView(hejiLabel,5)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,10);
}

@end
