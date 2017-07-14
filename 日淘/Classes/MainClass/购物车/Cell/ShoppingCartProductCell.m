//
//  ShoppingCartProductCell.m
//  日淘
//
//  Created by 李强 on 2016/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartProductCell.h"
#import "CountView.h"
#import "ModelProductDetail.h"

@interface ShoppingCartProductCell()
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *guiGeLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UIButton *selectBtn;
@property (nonatomic, strong) CountView *countView;
@end

@implementation ShoppingCartProductCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}

+ (ShoppingCartProductCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ShoppingCartProductCell";
    ShoppingCartProductCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ShoppingCartProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"default"];
    //iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.text = @"标题";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *guiGeLabel = [[UILabel alloc] init];
    guiGeLabel.font = [UIFont systemFontOfSize:12];
    guiGeLabel.textColor = HEXCOLOR(0x999999);
    guiGeLabel.text = @"商品规格";
    guiGeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:guiGeLabel];
    self.guiGeLabel = guiGeLabel;
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:16];
    priceLabel.textColor = HEXCOLOR(0xdf596a);
    priceLabel.text = @"¥0.00";
    priceLabel.textAlignment = NSTextAlignmentLeft;
    priceLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    CountView *countView = [[CountView alloc] initWithFrame:CGRectMake(0, 0, 80, 25)];
    countView.count = 1;
    [self.contentView addSubview:countView];
    self.countView = countView;
    
    selectBtn.sd_layout
    .leftSpaceToView(self.contentView,0)
    .centerYEqualToView(self.contentView)
    .heightIs(50)
    .widthIs(50);
    
    iconImageView.sd_layout
    .leftSpaceToView(selectBtn,10)
    .centerYEqualToView(self.contentView)
    .widthIs(80)
    .heightIs(80);
    
    nameLabel.sd_layout
    .leftSpaceToView(iconImageView,10)
    .topEqualToView(iconImageView)
    .rightSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [nameLabel setMaxNumberOfLinesToShow:2];
    
    guiGeLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(nameLabel,3)
    .rightEqualToView(nameLabel)
    .heightIs(15);
    
    priceLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(guiGeLabel,3)
    .heightIs(20).widthIs(200);
    
    countView.sd_layout
    .rightEqualToView(nameLabel)
    .centerYEqualToView(priceLabel)
    .widthIs(80)
    .heightIs(25);
    

    

    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:0.5];
    
    countView.CountBlock = ^(NSInteger num){
        NSLog(@"====>%ld",num);
        
        if(self.addBlcok) {
            self.addBlcok(num);
        }
    };
    
}

-(void)clickselectBtn {
    if(self.btnBlock){
        self.btnBlock();
    }
}

-(void)setModel:(ModelMemberShopCartDetailCollection *)model {
    
    _model = model;
    
    self.selectBtn.selected = model.IsSelected;
    [self.iconImageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    self.nameLabel.text = model.Description;
    self.guiGeLabel.text = model.ShortDescription;
    if(!self.guiGeLabel.text.length) {
        self.guiGeLabel.sd_layout.heightIs(0);
    }
    NSString *priceStr = [NSString strWhithFloat:[model.Price.Value floatValue]];
    self.priceLabel.text = [NSString stringWithFormat:@"%@%@",model.Price.MoneySymbol,priceStr];
    self.countView.count = [model.Quantity integerValue];
}


@end
