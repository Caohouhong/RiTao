//
//  AuthenticationCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AuthenticationCell.h"

@interface AuthenticationCell()
@property (nonatomic, weak) UIButton *stateBtn;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *cardLabel;

@end

@implementation AuthenticationCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"AuthenticationCell";
    AuthenticationCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[AuthenticationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *cardLabel = [[UILabel alloc]init];
    cardLabel.font = TFont(12.0);
    cardLabel.text = @"身份证 320320302020302002";
    [backView addSubview:cardLabel];
    self.cardLabel = cardLabel;
    
    UIButton *stateBtn = [[UIButton alloc]init];
    stateBtn.titleLabel.font = TFont(13);
    [stateBtn setTitle:@"账户默认实名人" forState:UIControlStateNormal];
    [stateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stateBtn setImage:GETIMAGE(@"Base") forState:UIControlStateNormal];
    [stateBtn setImage:GETIMAGE(@"RadioOn2") forState:UIControlStateSelected];
    stateBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [stateBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:stateBtn];
    self.stateBtn = stateBtn;
    
    UILabel *defaultLabel = [[UILabel alloc]init];
    defaultLabel.font = TFont(13.0);
    defaultLabel.hidden = YES;
    defaultLabel.text = @"账户默认实名人";
    [backView addSubview:defaultLabel];
    
    UIImageView *deleteImage = [[UIImageView alloc]init];
    deleteImage.image = [UIImage imageNamed:@"shanchu"];
    //deleteImage.backgroundColor = [UIColor orangeColor];
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
    
    cardLabel.sd_layout
    .leftSpaceToView(backView,10)
    .rightSpaceToView(backView,10)
    .bottomSpaceToView(lineView,10)
    .heightIs(15);
    
    stateBtn.sd_layout
    .leftSpaceToView(backView,10)
    .topSpaceToView(lineView,10)
    .bottomSpaceToView(backView,10).widthIs(120);
    
    defaultLabel.sd_layout
    .leftSpaceToView(stateBtn,5)
    .topSpaceToView(lineView,5)
    .bottomSpaceToView(backView,5).widthIs(150);
    
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
    NSLog(@"点了");
//    btn.selected = !btn.selected;
//    self.stateBtn.backgroundColor = (btn.selected)?[UIColor orangeColor]:[UIColor redColor];
//    [self.stateBtn setImage:(btn.selected)?GETIMAGE(@"RadioOn2"):GETIMAGE(@"Base") forState:UIControlStateNormal];
    if(self.selectedBlock) {
        self.selectedBlock(self.model);
    }

}

-(void)clickdeleteBtn {
    NSLog(@"点了删除");
    if(self.removeBlock){
        self.removeBlock(self.model);
    }
    
}


- (void)setModel:(ModelIDCardCollection *)model
{
    _model = model;
    
    self.nameLabel.text = model.Name;
    self.stateBtn.selected = model.moRen;
    self.cardLabel.text = [NSString stringWithFormat:@"身份证 %@",model.ID];
}

@end
