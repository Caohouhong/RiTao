//
//  ClassificationMainCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ClassificationMainCell.h"


@interface ClassificationMainCell()
@property (nonatomic, weak) UIButton *nameBtn;
@end
@implementation ClassificationMainCell


+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"ClassificationMainCell";
    ClassificationMainCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ClassificationMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:0.5];
    
    UIButton *nameBtn = [[UIButton alloc]init];
    [nameBtn setTitle:@"居家日用" forState:UIControlStateNormal];
    nameBtn.titleLabel.font = TFont(14);
    nameBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:nameBtn];
    self.nameBtn = nameBtn;
    
    nameBtn.sd_layout
    .leftSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,10)
    .centerXEqualToView(self.contentView)
    .centerYEqualToView(self.contentView)
    .heightIs(25);
}


-(void)setModel:(TopLayerCollectionModel *)model {
    _model = model;
    [self.nameBtn setTitle:model.Name forState:UIControlStateNormal];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.nameBtn.backgroundColor = selected ? [UIColor colorWithRed:0.894 green:0.000 blue:0.153 alpha:1.00] : [UIColor clearColor];
    [self.nameBtn setTitleColor:selected ? [UIColor whiteColor] : [UIColor blackColor] forState:UIControlStateNormal];
    self.nameBtn.layer.cornerRadius = selected ? 12.5 : 0;
    
}

@end
