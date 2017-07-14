//
//  MainProductCellTypeOne.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainProductCellTypeOne.h"
#import "MianProductView.h"
#import "ModelTopicProductCollection.h"
#import "SpecialDetailsVC.h"

@interface MainProductCellTypeOne ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *productImageView;

@property (nonatomic, strong) ModelTopicCollection *model;

@end

@implementation MainProductCellTypeOne

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(ModelTopicCollection *)model
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.model = model;
        
        [self drawView];
    }
    
    return self;
}

+ (MainProductCellTypeOne *)cellWithTableView:(UITableView *)tableView model:(ModelTopicCollection *)model
{
    NSString *idenifier = model.Guid;
    MainProductCellTypeOne *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MainProductCellTypeOne alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier model:model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    //self.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
    
    UIImageView *productImageView = [[UIImageView alloc] init];
    productImageView.image = [UIImage imageNamed:@"default"];
    productImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:productImageView];
    self.productImageView = productImageView;
    
    productImageView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(ScreenWidth*9/16);
    
    
    CGFloat width = ScreenWidth/3.5*(self.model.TopicProductCollection.count + 1);
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.contentSize = CGSizeMake(width>ScreenWidth?width:ScreenWidth, 0);
    scrollView.delegate = self;
    [self.contentView addSubview:scrollView];
    
    scrollView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(productImageView,0)
    .bottomSpaceToView(self.contentView,0);
    
    for (int i = 0; i < self.model.TopicProductCollection.count; i ++)
    {
        ModelTopicProductCollection *modelmodel = self.model.TopicProductCollection[i];
        
        MianProductView *mianProductView1 = [[MianProductView alloc] init];
        mianProductView1.model = modelmodel;
        [scrollView addSubview:mianProductView1];
        
        CGFloat itemW = ScreenWidth/3.5; //100
        CGFloat itemH = 140;
        
        mianProductView1.frame = CGRectMake(i * itemW, 0, itemW, itemH);
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [productImageView addGestureRecognizer:tap];
    
    [productImageView sd_setImageWithURL:IMAGE_URL(self.model.DisplayPicture) placeholderImage:[UIImage imageNamed:@"default"]];
    
    UIImageView *baV = [[UIImageView alloc]init];
    baV.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.contentView addSubview:baV];
    
    baV.sd_layout
    .leftSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(5);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = HEXCOLOR(0x898989);
    titleLabel.text = @"查看更多\nView  More";
    titleLabel.numberOfLines = 2;
    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.layer.borderColor = HEXCOLOR(0x333333).CGColor;
//    titleLabel.layer.borderWidth = 0.5;
    titleLabel.userInteractionEnabled = YES;
    [scrollView addSubview:titleLabel];
    titleLabel.frame = CGRectMake((self.model.TopicProductCollection.count) * (ScreenWidth/3.5), 5, 100, 140);
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [titleLabel addGestureRecognizer:tap2];
    
}

- (void)tap
{
    SpecialDetailsVC *vc = [SpecialDetailsVC new];
    vc.guid = self.model.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = self.model.Name;
    [DCURLRouter pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"移动了.....");
}


@end
