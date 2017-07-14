//
//  ProductListVC.m
//  日淘
//
//  Created by 李强 on 2016/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductListVC.h"
#import "ProductPinPaiChooseVC.h"

#import "NormalCollectionCell.h"
#import "SpecialDetailsHeaderView.h"
#import "SpecialDetailsCell.h"
#import "ProductFenLeiChooseVC.h"
#import "ProductDetailsVC.h"

//model
#import "ModelMainProductList.h"
#import "ModelMasterSaleProductCollection.h"
#import "ModelCategoryCollection.h"
#import "ModelBrandCollection.h"

static NSString *const normalCollectionCell = @"NormalCollectionCell";
static NSString *const collectionID = @"SpecialDetailsCell";

@interface ProductListVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIButton *renQiBtn;
@property (nonatomic, weak) UIButton *jiaGeBtn;
@property (nonatomic, weak) UIButton *pingPaiBtn;
@property (nonatomic, weak) UIButton *fenLeiBtn;
@property (nonatomic, weak) UIView *productPinPaiChooseView;
@property (nonatomic, weak) UIView *productFenLeiChooseView;

@property (nonatomic, assign) int StartIndex;
@property (nonatomic, copy) NSString *PriceOrderStr;
@property (nonatomic, copy) NSString *PopularityOrderStr;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *pinpaiArray;
@property (nonatomic, strong) NSMutableArray *fenleiArray;
@property (nonatomic, strong) NSMutableArray *choosePingPaiArray;
@property (nonatomic, strong) NSMutableArray *chooseFenleiArray;

@end

@implementation ProductListVC

- (NSMutableArray *)choosePingPaiArray
{
    if (!_choosePingPaiArray) {
        _choosePingPaiArray = [NSMutableArray array];
    }
    
    return _choosePingPaiArray;
}

- (NSMutableArray *)chooseFenleiArray
{
    if (!_chooseFenleiArray) {
        _chooseFenleiArray = [NSMutableArray array];
    }
    
    return _chooseFenleiArray;
}

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(NSMutableArray *)pinpaiArray {
    if(_pinpaiArray == nil) {
        _pinpaiArray = [[NSMutableArray alloc]init];
    }
    return _pinpaiArray;
}

-(NSMutableArray *)fenleiArray {
    if(_fenleiArray == nil) {
        _fenleiArray = [[NSMutableArray alloc]init];
    }
    return _fenleiArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"商品列表";
    
    self.StartIndex = 0;
    self.PriceOrderStr = @"";
    self.PopularityOrderStr = @"";
    [self requestGetMasterSaleProductCollection];
    [self drawHeaderView];
    
}

-(void)requestGetMasterSaleProductCollection
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:self.PriceOrderStr forKey:@"PriceOrderStr"];
    [params setValue:self.PopularityOrderStr forKey:@"PopularityOrderStr"];
    [params setValue:@(self.StartIndex) forKey:@"StartIndex"];
    [params setValue:@(10) forKey:@"Count"];
    
    if (self.choosePingPaiArray.count) {
        [params setValue:self.choosePingPaiArray forKey:@"BrandGuidList"];
    }
    if (self.chooseFenleiArray.count) {
        [params setValue:self.chooseFenleiArray forKey:@"CategoryGuidList"];
    }
    
    
    if (self.SearchContent.length)
    {
        [params setValue:self.SearchContent forKey:@"SearchContent"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForSearchContentAction" forKey:@"Action"];
    }
    else if (self.CategoryGuid.length)
    {
        [params setValue:self.CategoryGuid forKey:@"CategoryGuid"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForCategoryAction" forKey:@"Action"];
    }
    else if (self.baoYouDic)
    {
        [params setValue:[self.baoYouDic valueForKey:@"DeliveryFeeGuid"] forKey:@"DeliveryFeeGuid"];
//        [params setValue:[self.baoYouDic valueForKey:@"WarehouseGuid"] forKey:@"WarehouseGuid"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForDeliveryFeeAction" forKey:@"Action"];
    }
    else if (self.manJianDic)
    {
        [params setValue:[self.manJianDic valueForKey:@"SaleCouponGuid"] forKey:@"SaleCouponGuid"];
//        [params setValue:[self.baoYouDic valueForKey:@"WarehouseGuid"] forKey:@"WarehouseGuid"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForCouponAction" forKey:@"Action"];
    }
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.fenleiArray = [NSMutableArray array];
        self.pinpaiArray = [NSMutableArray array];
        
        if (self.StartIndex == 0)
        {
            self.dataArray = [NSMutableArray array];
        }
        
        ModelMainProductList *model = [ModelMainProductList mj_objectWithKeyValues:responseObject];
        for(NSDictionary *dic in model.MasterSaleProductCollection) {
            ModelMasterSaleProductCollection *model = [ModelMasterSaleProductCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:model];
        }
        
        for(NSDictionary *dic in model.CategoryCollection) {
            ModelCategoryCollection *model = [ModelCategoryCollection mj_objectWithKeyValues:dic];
            [self.fenleiArray addObject:model];
        }
        for(NSDictionary *dic in model.BrandCollection) {
            ModelBrandCollection *model = [ModelBrandCollection mj_objectWithKeyValues:dic];
            [self.pinpaiArray addObject:model];
        }
        
        if (!self.collectionView)
        {
            [self drawView];
        }
        
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } successBackfailError:^(id responseObject) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    }];

}

- (void)drawHeaderView
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    self.headerView = headerView;
    
    headerView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(45);
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    [headerView addSubview:stackView];
    
    stackView.sd_layout
    .leftSpaceToView(self.headerView,0)
    .rightSpaceToView(self.headerView,0)
    .topSpaceToView(self.headerView,0)
    .bottomSpaceToView(self.headerView,0);
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [headerView addSubview:lineView];
    
    lineView.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .bottomSpaceToView(headerView,0)
    .heightIs(0.5);
    
    UIButton *renQiBtn = [[UIButton alloc] init];
    [renQiBtn setTitle:@"人气" forState:UIControlStateNormal];
    [renQiBtn setImage:[UIImage imageNamed:@"xiala2"] forState:UIControlStateNormal];
    [renQiBtn setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateSelected];
    [renQiBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
    [renQiBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, -30)];
    [renQiBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [renQiBtn setTitleColor:COLOR_Red forState:UIControlStateSelected];
    renQiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [renQiBtn addTarget:self action:@selector(didChoosetRenQi:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:renQiBtn];
    self.renQiBtn = renQiBtn;
    
    UIButton *jiaGeBtn = [[UIButton alloc] init];
    [jiaGeBtn setTitle:@"价格" forState:UIControlStateNormal];
    [jiaGeBtn setImage:[UIImage imageNamed:@"xiala2"] forState:UIControlStateNormal];
    [jiaGeBtn setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateSelected];
    [jiaGeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
    [jiaGeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, -30)];
    [jiaGeBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [jiaGeBtn setTitleColor:COLOR_Red forState:UIControlStateSelected];
    jiaGeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [jiaGeBtn addTarget:self action:@selector(didChoosetJiGe:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:jiaGeBtn];
    self.jiaGeBtn = jiaGeBtn;
    
    UIButton *pingPaiBtn = [[UIButton alloc] init];
    [pingPaiBtn setTitle:@"品牌" forState:UIControlStateNormal];
    [pingPaiBtn setImage:[UIImage imageNamed:@"xiala2"] forState:UIControlStateNormal];
    [pingPaiBtn setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateSelected];
    [pingPaiBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
    [pingPaiBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, -30)];
    [pingPaiBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [pingPaiBtn setTitleColor:COLOR_Red forState:UIControlStateSelected];
    pingPaiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [pingPaiBtn addTarget:self action:@selector(didChoosetPingTai:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:pingPaiBtn];
    self.pingPaiBtn = pingPaiBtn;
    
    UIButton *fenLeiBtn = [[UIButton alloc] init];
    [fenLeiBtn setTitle:@"分类" forState:UIControlStateNormal];
    [fenLeiBtn setImage:[UIImage imageNamed:@"xiala2"] forState:UIControlStateNormal];
    [fenLeiBtn setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateSelected];
    [fenLeiBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -11, 0, 11)];
    [fenLeiBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, -30)];
    [fenLeiBtn setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    [fenLeiBtn setTitleColor:COLOR_Red forState:UIControlStateSelected];
    fenLeiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [fenLeiBtn addTarget:self action:@selector(didChoosetFenLei:) forControlEvents:UIControlEventTouchUpInside];
    [stackView addArrangedSubview:fenLeiBtn];
    self.fenLeiBtn = fenLeiBtn;
    
}

- (void)drawView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,45)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    [collectionView registerClass:[NormalCollectionCell class] forCellWithReuseIdentifier:normalCollectionCell];
    [collectionView registerClass:[SpecialDetailsCell class] forCellWithReuseIdentifier:collectionID];
    
    ProductPinPaiChooseVC *vc = [[ProductPinPaiChooseVC alloc] init];
    vc.dataArray = self.pinpaiArray;
    [self addChildViewController:vc];
    self.productPinPaiChooseView = vc.view;
    [self.view addSubview:self.productPinPaiChooseView];
    self.productPinPaiChooseView.hidden = YES;
    
    
    ProductFenLeiChooseVC *vc2 = [[ProductFenLeiChooseVC alloc] init];
    vc2.dataArray = self.fenleiArray;
    [self addChildViewController:vc2];
    self.productFenLeiChooseView = vc2.view;
    [self.view addSubview:self.productFenLeiChooseView];
    self.productFenLeiChooseView.hidden = YES;
    
    [self.view bringSubviewToFront:self.headerView];
    
    collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
    collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
    
    
    __weak typeof(self) weakSelf = self;
    vc.pingPaiChooseBLock = ^(NSMutableArray *array){
        weakSelf.choosePingPaiArray = [NSMutableArray arrayWithArray:array];
        [weakSelf headerRefersh];
    };
    
    vc2.fenLeiChooseBLock = ^(NSMutableArray *array){
        weakSelf.chooseFenleiArray = [NSMutableArray arrayWithArray:array];
        [weakSelf headerRefersh];
    };
}

-(void)headerRefersh {
    self.StartIndex = 0;
    [self requestGetMasterSaleProductCollection];
}

-(void)footerRefersh {
    self.StartIndex += 10;
    [self requestGetMasterSaleProductCollection];
}

- (void)didChoosetRenQi:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.pingPaiBtn.selected = NO;
    self.fenLeiBtn.selected = NO;
    self.productFenLeiChooseView.hidden = YES;
    self.productPinPaiChooseView.hidden = YES;
    
    self.PopularityOrderStr = btn.selected?@"desc":@"asc";
    [self requestGetMasterSaleProductCollection];
}

- (void)didChoosetJiGe:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.pingPaiBtn.selected = NO;
    self.fenLeiBtn.selected = NO;
    self.productFenLeiChooseView.hidden = YES;
    self.productPinPaiChooseView.hidden = YES;
    
   
    self.PriceOrderStr = btn.selected?@"desc":@"asc";
    [self requestGetMasterSaleProductCollection];
}

- (void)didChoosetPingTai:(UIButton *)btn
{
    self.fenLeiBtn.selected = NO;
    btn.selected = !btn.selected;
    self.productFenLeiChooseView.hidden = YES;
    self.productPinPaiChooseView.hidden = !self.productPinPaiChooseView.hidden;
}

- (void)didChoosetFenLei:(UIButton *)btn
{
    self.pingPaiBtn.selected = NO;
    btn.selected = !btn.selected;
    self.productPinPaiChooseView.hidden = YES;
    self.productFenLeiChooseView.hidden = !self.productFenLeiChooseView.hidden;
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
    SpecialDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    cell.model2 = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelMasterSaleProductCollection *modelmodel = self.dataArray[indexPath.row];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.guid = modelmodel.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
    
}

#pragma mark -
#pragma mark ================= UICollectionViewDelegateFlowLayout =================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat flowLayoutW = (ScreenWidth-30)/2;
    return CGSizeMake(flowLayoutW, flowLayoutW+60);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 10, 10);
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
