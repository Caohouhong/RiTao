//
//  ShoppingCartHeaderCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartHeaderCell.h"
#import "ModelWarehouse.h"

@interface ShoppingCartHeaderCell()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIButton *selectBtn;
@end

@implementation ShoppingCartHeaderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ShoppingCartHeaderCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartHeaderCell";
    ShoppingCartHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIButton *selectBtn = [[UIButton alloc] init];
    [selectBtn setImage:[UIImage imageNamed:@"Base"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"RadioOn"] forState:UIControlStateSelected];
    [selectBtn addTarget:self action:@selector(clickselectBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:selectBtn];
    self.selectBtn = selectBtn;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.text = @"上海保税仓";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    selectBtn.sd_layout
    .leftSpaceToView(self.contentView,0)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(50);
    
    titleLabel.sd_layout
    .leftSpaceToView(selectBtn,20)
    .centerYEqualToView(selectBtn)
    .heightIs(20)
    .rightSpaceToView(self.contentView,15);
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
}

-(void)clickselectBtn {
    if(self.allBlock) {
        self.allBlock();
    }
    NSLog(@"...");
}



-(void)setModel:(ModelWfxMemberShopCartWarehouseCollection *)model {
    _model = model;
    
    self.titleLabel.text = model.Warehouse.Name;
    self.selectBtn.selected = model.IsSelected;
}


@end
