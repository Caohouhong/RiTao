//
//  PopGoodsDetailsView.m
//  日淘
//
//  Created by 唐硕 on 16/12/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PopGoodsDetailsView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "PopGoodsDetailsCell.h"
#import "PopGoodsDetailsHeadView.h"

@interface PopGoodsDetailsView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@end
@implementation PopGoodsDetailsView

static NSString *const collectionID = @"PopGoodsDetailsCell.h";
static NSString *const headerViewID = @"PopGoodsDetailsHeadView.h";

+(PopGoodsDetailsView *)shareInstance {
    
    static PopGoodsDetailsView *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[PopGoodsDetailsView alloc]init];
    });
    [shareInstance showPopView];
    return shareInstance;
}

-(instancetype)init {
    if(self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 5;
    [self addSubview:backView];
    
    backView.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(BACKW).heightIs(ScreenWidth);
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"资生堂男士洗面闹";
    nameLabel.font = TFont(15);
    [backView addSubview:nameLabel];
    
    UIButton *xBtn = [[UIButton alloc]init];
    [xBtn setTitle:@"X" forState:UIControlStateNormal];
    [xBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UIView *lineViewT = [[UIView alloc]init];
    lineViewT.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:lineViewT];
    
    UIView *lineViewB = [[UIView alloc]init];
    lineViewB.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:lineViewB];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥ 288.00";
    priceLabel.font = TFont(15);
    priceLabel.textColor = [UIColor redColor];
    [backView addSubview:priceLabel];
    
    UIButton *buyBtn = [[UIButton alloc]init];
    buyBtn.titleLabel.font = TFont(15);
    buyBtn.backgroundColor = [UIColor redColor];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backView addSubview:buyBtn];
    
    nameLabel.sd_layout
    .topSpaceToView(backView,10)
    .leftSpaceToView(backView,10)
    .rightSpaceToView(backView,20)
    .heightIs(20);
    
    xBtn.sd_layout
    .rightSpaceToView(backView,10)
    .centerYEqualToView(nameLabel)
    .heightIs(15).widthIs(15);
    
    lineViewT.sd_layout
    .leftSpaceToView(backView,0)
    .rightSpaceToView(backView,0)
    .topSpaceToView(nameLabel,10)
    .heightIs(0.5);
    
    priceLabel.sd_layout
    .bottomSpaceToView(backView,15)
    .leftSpaceToView(backView,10)
    .widthIs(100).heightIs(20);
    
    buyBtn.sd_layout
    .rightSpaceToView(backView,10)
    .centerYEqualToView(priceLabel)
    .heightIs(25).widthIs(90);
    buyBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    lineViewB.sd_layout
    .leftSpaceToView(backView,0)
    .rightSpaceToView(backView,0)
    .bottomSpaceToView(priceLabel,15)
    .heightIs(0.5);
    
    
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [backView addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(backView,0)
    .topSpaceToView(lineViewT,0)
    .rightSpaceToView(backView,0)
    .bottomSpaceToView(lineViewB,0);
    
    [collectionView registerClass:[PopGoodsDetailsCell class] forCellWithReuseIdentifier:collectionID];
    [collectionView registerClass:[PopGoodsDetailsHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID];
}

-(void)removeView {
    [self removeFromSuperview];
}

-(void)showPopView {
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PopGoodsDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    return cell;
    return [UICollectionViewCell new];
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    PopGoodsDetailsHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID forIndexPath:indexPath];;
    return headerView;
}

// cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat flowLayoutW = (BACKW-40)/3;
    return CGSizeMake(flowLayoutW, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(BACKW, 35);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}




@end
