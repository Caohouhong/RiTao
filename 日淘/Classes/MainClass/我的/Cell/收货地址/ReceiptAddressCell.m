//
//  ReceiptAddressCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ReceiptAddressCell.h"
#import "ModelIDCardInfo.h"

@interface ReceiptAddressCell()
@property (nonatomic, weak) UIButton *stateBtn;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *phoneLabel;
@property (nonatomic, weak) UILabel *addressLabel;

@end
@implementation ReceiptAddressCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"ReceiptAddressCell";
    ReceiptAddressCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ReceiptAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    
    backView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0);
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = COLOR_BackgroundColor;
    [backView addSubview:lineView];
    
    lineView.sd_layout
    .leftSpaceToView(backView,10)
    .rightSpaceToView(backView,10)
    .bottomSpaceToView(backView,40).heightIs(0.5);
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont systemFontOfSize:13];
    nameLabel.text = @"王二牛";
    [backView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.font = TFont(13.0);
    phoneLabel.text = @"11012011900";
    [backView addSubview:phoneLabel];
    self.phoneLabel = phoneLabel;
    
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.font = TFont(12.0);
    addressLabel.text = @"江苏省 无锡市 南长区 水仙里 11号22室";
    [backView addSubview:addressLabel];
    self.addressLabel = addressLabel;
    
    UIButton *stateBtn = [[UIButton alloc]init];
//    stateBtn.backgroundColor = [UIColor redColor];
    [stateBtn setImage:GETIMAGE(@"Base") forState:UIControlStateNormal];
    [stateBtn setImage:GETIMAGE(@"RadioOn") forState:UIControlStateSelected];
    [stateBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:stateBtn];
    self.stateBtn = stateBtn;
    
    UILabel *defaultLabel = [[UILabel alloc]init];
    defaultLabel.font = TFont(13.0);
    defaultLabel.text = @"默认地址";
    [backView addSubview:defaultLabel];
    
    UIImageView *deleteImage = [[UIImageView alloc]init];
    deleteImage.image = [UIImage imageNamed:@"shanchu"];
   // deleteImage.backgroundColor = [UIColor orangeColor];
    [backView addSubview:deleteImage];
    
    UIButton *deleteBtn = [[UIButton alloc]init];
    //deleteBtn.backgroundColor = [UIColor clearColor];
    deleteBtn.titleLabel.font = TFont(13.0);
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [deleteBtn addTarget:self action:@selector(clickdeleteBtn) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:deleteBtn];
    
    nameLabel.sd_layout
    .leftSpaceToView(backView,10)
    .topSpaceToView(backView,10)
    .widthIs(150).heightIs(20);
    
    phoneLabel.sd_layout
    .rightSpaceToView(backView,10)
    .topSpaceToView(backView,10)
    .heightIs(20);
    [phoneLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    addressLabel.sd_layout
    .leftSpaceToView(backView,10)
    .rightSpaceToView(backView,10)
    .bottomSpaceToView(lineView,10)
    .heightIs(15);
    
    stateBtn.sd_layout
    .leftSpaceToView(backView,10)
    .topSpaceToView(lineView,10)
    .bottomSpaceToView(backView,10).widthIs(20);
    
    defaultLabel.sd_layout
    .leftSpaceToView(stateBtn,5)
    .topSpaceToView(lineView,5)
    .bottomSpaceToView(backView,5).widthIs(100);
    
    deleteBtn.sd_layout
    .rightSpaceToView(backView,10)
    .topSpaceToView(lineView,5)
    .bottomSpaceToView(backView,5).widthIs(60);
    
    deleteImage.sd_layout
    .rightSpaceToView(backView,40)
    .centerYEqualToView(deleteBtn)
    .heightIs(20).widthIs(15);
    
    
}


-(void)clickStateBtn:(UIButton *)btn {
   // btn.selected = !btn.selected;
   
    if(self.selectedBlock) {
        self.selectedBlock(self.model);
    }
}

-(void)clickdeleteBtn {
    if(self.removeBlock) {
        self.removeBlock(self.model);
    }
}


-(void)setModel:(AddReceiptAddressModel *)model {
    _model = model;
    
    self.nameLabel.text = model.IDCardInfo.Name;
    self.phoneLabel.text = model.MobilePhone;
    self.addressLabel.text = model.IDCardInfo.Address;
    self.stateBtn.selected = model.IsDefault;
    //[self.stateBtn setImage:(model.IsDefault)?GETIMAGE(@"RadioOn"):GETIMAGE(@"Base") forState:UIControlStateNormal];
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
