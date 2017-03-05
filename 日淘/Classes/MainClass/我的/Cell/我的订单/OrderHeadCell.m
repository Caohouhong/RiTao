//
//  OrderHeadCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderHeadCell.h"

@interface OrderHeadCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *stateLabel;
@end
@implementation OrderHeadCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderHeadCell";
    OrderHeadCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    nameLabel.text = @"订单号 1008427178";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *stateLabel = [[UILabel alloc]init];
    stateLabel.text = @"已发货";
    stateLabel.font = TFont(12);
    stateLabel.textColor = COLOR_Black;
    [self.contentView addSubview:stateLabel];
    self.stateLabel = stateLabel;
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .widthIs(ScreenWidth).heightIs(15);
    
    stateLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(self.contentView)
    .heightIs(15);
    [stateLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    
}


-(void)setModel:(ModelWfxSaleOrderCollection *)model {
    _model = model;
    
    self.nameLabel.text = [NSString stringWithFormat:@"订单号 %@",model.SaleOrderID];
    self.stateLabel.text = model.SaleOrderStatus;
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
