//
//  ProductPinPaiChooseVC.m
//  日淘
//
//  Created by 李强 on 2016/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductPinPaiChooseVC.h"
#import "ProductPinPaiChooseCell.h"

static NSString *const productPinPaiChooseCell = @"ProductPinPaiChooseCell";

@interface ProductPinPaiChooseVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation ProductPinPaiChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self drawView];
}

- (void)drawView
{
    UIView *coverView = [[UIView alloc] init];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    [self.view addSubview:coverView];
    
    coverView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    UIView *bgv = [[UIView alloc] init];
    bgv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgv];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [bgv addSubview:collectionView];
    self.collectionView = collectionView;
    
    [collectionView registerClass:[ProductPinPaiChooseCell class] forCellWithReuseIdentifier:productPinPaiChooseCell];
    
    UIButton *resetBtn = [[UIButton alloc] init];
    [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    [resetBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    resetBtn.backgroundColor = [UIColor whiteColor];
    resetBtn.layer.borderWidth = 0.5;
    resetBtn.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    resetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [resetBtn addTarget:self action:@selector(didReset) forControlEvents:UIControlEventTouchUpInside];
    [bgv addSubview:resetBtn];
    
    UIButton *sureBtn = [[UIButton alloc] init];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.backgroundColor = COLOR_Red;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sureBtn addTarget:self action:@selector(didSure) forControlEvents:UIControlEventTouchUpInside];
    [bgv addSubview:sureBtn];
    
    bgv.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(ScreenWidth);
    
    resetBtn.sd_layout
    .leftSpaceToView(bgv,20)
    .bottomSpaceToView(bgv,10)
    .heightIs(25)
    .widthIs((ScreenWidth - 50)/2);
    resetBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    sureBtn.sd_layout
    .rightSpaceToView(bgv,20)
    .bottomSpaceToView(bgv,10)
    .heightIs(25)
    .widthIs((ScreenWidth - 50)/2);
    sureBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    collectionView.sd_layout
    .leftSpaceToView(bgv,0)
    .topSpaceToView(bgv,0)
    .rightSpaceToView(bgv,0)
    .bottomSpaceToView(resetBtn,10);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSelf)];
    [coverView addGestureRecognizer:tap];
}

- (void)hideSelf
{
    self.view.hidden = YES;
}

- (void)didReset
{
    for (ModelBrandCollection *model in self.dataArray)
    {
        model.isSelect = NO;
    }
    
    [self.collectionView reloadData];
    
    if (self.pingPaiChooseBLock)
    {
        NSMutableArray *array = [NSMutableArray array];
        
        self.pingPaiChooseBLock(array);
    }
    
    [self hideSelf];
}

- (void)didSure
{
    if (self.pingPaiChooseBLock)
    {
        NSMutableArray *array = [NSMutableArray array];
        
        
        for (ModelBrandCollection *model in self.dataArray)
        {
            if (model.isSelect)
            {
                [array addObject:model.Guid];
            }
        }
        
        self.pingPaiChooseBLock(array);
    }
    
    [self hideSelf];
}

#pragma mark -
#pragma mark ================= UICollectionViewDelegate,UICollectionViewDataSource =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductPinPaiChooseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:productPinPaiChooseCell forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
    //return  [collectionView dequeueReusableCellWithReuseIdentifier:productPinPaiChooseCell forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelBrandCollection *model = self.dataArray[indexPath.row];
    model.isSelect = !model.isSelect;
    
    [collectionView reloadData];
}

#pragma mark -
#pragma mark ================= UICollectionViewDelegateFlowLayout =================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat flowLayoutW = (ScreenWidth-70)/2;
    return CGSizeMake(flowLayoutW, 25);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 30, 10, 30);
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
