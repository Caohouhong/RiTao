//
//  MainProductCellTypeTwo.m
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainProductCellTypeTwo.h"
#import "ModelTopicCollection.h"
#import "SpecialDetailsVC.h"

@interface MainProductCellTypeTwo ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *productNameLabel1;
@property (nonatomic, weak) UILabel *productNameLabel1_1;
@property (nonatomic, weak) UILabel *productNameLabel2;
@property (nonatomic, weak) UILabel *productNameLabel2_1;
@property (nonatomic, weak) UIImageView *productFirstImageView;
@property (nonatomic, weak) UIImageView *productSecondImageView;
@property (nonatomic, weak) UIImageView *productThirdImageView;

@end

@implementation MainProductCellTypeTwo


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MainProductCellTypeTwo *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MainProductCellTypeTwo";
    MainProductCellTypeTwo *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MainProductCellTypeTwo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:5 backgroundColor:HEXCOLOR(0xeeeeee)];
    
    
//    UIImageView *bgV = [[UIImageView alloc]init];
//    bgV.backgroundColor = HEXCOLOR(0xeeeeee);
//    [self.contentView addSubview:bgV];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:view1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x666666);
    titleLabel.text = @"限时特价名称";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *productFirstImageView = [[UIImageView alloc] init];
    productFirstImageView.image = [UIImage imageNamed:@"default"];
//    productFirstImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:productFirstImageView];
    self.productFirstImageView = productFirstImageView;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.contentView addSubview:lineView];
    
    UILabel *productNameLabel1 = [[UILabel alloc] init];
    productNameLabel1.font = [UIFont systemFontOfSize:12];
    productNameLabel1.textColor = HEXCOLOR(0x333333);
    productNameLabel1.text = @"名称1";
    [self.contentView addSubview:productNameLabel1];
    self.productNameLabel1 = productNameLabel1;
    
    UILabel *productNameLabel1_1 = [[UILabel alloc] init];
    productNameLabel1_1.font = [UIFont systemFontOfSize:12];
    productNameLabel1_1.textColor = HEXCOLOR(0x666666);
    productNameLabel1_1.text = @"名称2";
    [self.contentView addSubview:productNameLabel1_1];
    self.productNameLabel1_1 = productNameLabel1_1;
    
    UIImageView *productSecondImageView = [[UIImageView alloc] init];
    productSecondImageView.image = [UIImage imageNamed:@"default"];
    productSecondImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:productSecondImageView];
    self.productSecondImageView = productSecondImageView;
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.contentView addSubview:lineView1];
    
    UILabel *productNameLabel2 = [[UILabel alloc] init];
    productNameLabel2.font = [UIFont systemFontOfSize:12];
    productNameLabel2.textColor = HEXCOLOR(0x333333);
    productNameLabel2.text = @"名称1";
    [self.contentView addSubview:productNameLabel2];
    self.productNameLabel2 = productNameLabel2;
    
    UILabel *productNameLabel2_1 = [[UILabel alloc] init];
    productNameLabel2_1.font = [UIFont systemFontOfSize:12];
    productNameLabel2_1.textColor = HEXCOLOR(0x666666);
    productNameLabel2_1.text = @"名称2";
    [self.contentView addSubview:productNameLabel2_1];
    self.productNameLabel2_1 = productNameLabel2_1;
    
    UIImageView *productThirdImageView = [[UIImageView alloc] init];
    productThirdImageView.image = [UIImage imageNamed:@"default"];
//    productThirdImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:productThirdImageView];
    self.productThirdImageView = productThirdImageView;
    
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 addTarget:self action:@selector(didClickBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 addTarget:self action:@selector(didClickBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    [btn3 addTarget:self action:@selector(didClickBtn3) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn3];
    
    
    lineView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView,5)
    .bottomSpaceToView(self.contentView,5)
    .widthIs(0.5);
    
    lineView1.sd_layout
    .leftSpaceToView(lineView,0)
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView,5)
    .heightIs(0.5);
    
//    bgV.sd_layout
//    .leftSpaceToView(self.contentView,0)
//    .topSpaceToView(self.contentView,0)
//    .rightSpaceToView(self.contentView,0)
//    .heightIs(20);
    
    
    view1.sd_layout
    .leftSpaceToView(self.contentView,5)
    .topSpaceToView(self.contentView,5)
    .widthIs(5)
    .heightIs(20);
    
    titleLabel.sd_layout
    .leftSpaceToView(view1,5)
    .topEqualToView(view1)
    .bottomEqualToView(view1)
    .widthIs((ScreenWidth - 20)/2);
    
    productFirstImageView.sd_layout
    .leftEqualToView(view1)
    .topSpaceToView(view1,5)
    .bottomSpaceToView(self.contentView,10)
    .rightSpaceToView(lineView,5);
    
    productNameLabel1.sd_layout
    .leftSpaceToView(lineView,5)
    .topSpaceToView(view1,-10)
    .widthIs((ScreenWidth - 25)/4)
    .heightIs(20);
    
    productNameLabel1_1.sd_layout
    .leftEqualToView(productNameLabel1)
    .rightEqualToView(productNameLabel1)
    .topSpaceToView(productNameLabel1,5)
    .heightIs(20);
    
    productSecondImageView.sd_layout
    .leftSpaceToView(productNameLabel1,5)
    .topEqualToView(productNameLabel1)
    .widthIs(70)
    .heightIs(70);
    
    productNameLabel2.sd_layout
    .leftSpaceToView(lineView,5)
    .topSpaceToView(lineView1,15)
    .widthIs((ScreenWidth - 25)/4)
    .heightIs(20);
    
    productNameLabel2_1.sd_layout
    .leftEqualToView(productNameLabel2)
    .rightEqualToView(productNameLabel2)
    .topSpaceToView(productNameLabel2,5)
    .heightIs(20);
    
    productThirdImageView.sd_layout
    .leftSpaceToView(productNameLabel2,5)
    .topEqualToView(productNameLabel2)
    .widthIs(70)
    .heightIs(70);
    
    btn1.sd_layout
    .leftEqualToView(view1)
    .topEqualToView(view1)
    .rightEqualToView(productFirstImageView)
    .bottomEqualToView (productFirstImageView);
    
    btn2.sd_layout
    .leftEqualToView(productNameLabel1)
    .topEqualToView(productNameLabel1)
    .rightSpaceToView(self.contentView,0)
    .bottomEqualToView (lineView1);
    
    btn3.sd_layout
    .leftEqualToView(productNameLabel2)
    .topEqualToView(productNameLabel2)
    .rightSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
}

- (void)didClickBtn1
{
    ModelTopicCollection *model1 = self.dataArray[0];
    
    SpecialDetailsVC *vc = [SpecialDetailsVC new];
    vc.guid = model1.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = model1.Name;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)didClickBtn2
{
    ModelTopicCollection *model1 = self.dataArray[1];
    
    SpecialDetailsVC *vc = [SpecialDetailsVC new];
    vc.guid = model1.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = model1.Name;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)didClickBtn3
{
    ModelTopicCollection *model1 = self.dataArray[2];
    
    SpecialDetailsVC *vc = [SpecialDetailsVC new];
    vc.guid = model1.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = model1.Name;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    
    if (dataArray.count == 3)
    {
        ModelTopicCollection *model1 = dataArray[0];
        [self.productFirstImageView sd_setImageWithURL:IMAGE_URL(model1.DisplayPicture) placeholderImage:[UIImage imageNamed:@"default"]];
        self.titleLabel.text = model1.Name;
        
        ModelTopicCollection *model2 = dataArray[1];
        [self.productSecondImageView sd_setImageWithURL:IMAGE_URL(model2.DisplayPicture) placeholderImage:[UIImage imageNamed:@"default"]];
        self.productNameLabel1.text = model2.Name;
        self.productNameLabel1_1.text = model2.SecondName;
        
        ModelTopicCollection *model3 = dataArray[2];
        [self.productThirdImageView sd_setImageWithURL:IMAGE_URL(model3.DisplayPicture) placeholderImage:[UIImage imageNamed:@"default"]];
        self.productNameLabel2.text = model3.Name;
        self.productNameLabel2_1.text = model3.SecondName;
    }
}


@end
