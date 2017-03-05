//
//  MeMainCell_7.m
//  日淘
//
//  Created by 李强 on 2017/1/23.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MeMainCell_7.h"
@interface MeMainCell_7()
@property (nonatomic, strong)  UIImageView *iconImageView;
@end
@implementation MeMainCell_7


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MeMainCell_7 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MeMainCell_7";
    MeMainCell_7 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MeMainCell_7 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"default"];
    _iconImageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_iconImageView];
    
    _iconImageView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
}

- (void)setModel:(ModelPicture *)model
{
    _model = model;
    
    [_iconImageView sd_setImageWithURL:IMAGE_URL(model.Value) placeholderImage:[UIImage imageNamed:@"default"]];
}

@end
