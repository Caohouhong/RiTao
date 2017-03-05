//
//  MianChildModuleVC.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MianChildModuleVC.h"
#import "MainAdvertisingCell.h"
#import "MianQuickEntryCell.h"
#import "MainProductCellTypeOne.h"
#import "MainProductCellTypeTwo.h"
#import "MainRecommendShopCell.h"
#import "MainHeadRecommendCell.h"
#import "MainEveryoneBuyCell.h"
#import "ProductDetailsVC.h"
#import "MainHotClassCell.h"
#import "MainHotClassTitleCell.h"
#import "SpecialDetailsFooterView.h"

#import "ModelTopicCollectionResult.h"
#import "ModelTopicCollection.h"
#import "ModelMasterSaleProductCollection.h"
#import "ModelHotCategoryCollection.h"

#import "NormalCollectionCell.h"
#import "SpecialDetailsHeaderView.h"
#import "SpecialDetailsCell.h"
#import "PopGoodsDetailsView.h"
#import "ProductListVC.h"

static NSString *const normalCollectionCell = @"NormalCollectionCell";
static NSString *const headerViewID = @"SpecialDetailsHeaderView";
static NSString *const footerViewID = @"SpecialDetailsFooterView";
static NSString *const collectionID = @"SpecialDetailsCell";

@interface MianChildModuleVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIView *recommendView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *advertisingArray;
@property (nonatomic, strong) NSMutableArray *quickEntryArray;
@property (nonatomic, strong) NSMutableArray *specialAndSuggestionArray;
@property (nonatomic, strong) NSMutableArray *recommendArray;
@property (nonatomic, strong) NSMutableArray *weAllBuyArray;
@property (nonatomic, strong) NSMutableArray *hotClassArray;

@property (nonatomic, strong) NSMutableArray *cellsArray;

@end

@implementation MianChildModuleVC

- (NSMutableArray *)weAllBuyArray
{
    if (!_weAllBuyArray)
    {
        _weAllBuyArray = [NSMutableArray array];
    }
    
    return _weAllBuyArray;
}

- (NSMutableArray *)recommendArray
{
    if (!_recommendArray) {
        _recommendArray = [NSMutableArray array];
    }
    return _recommendArray;
}

- (NSMutableArray *)specialAndSuggestionArray
{
    if (!_specialAndSuggestionArray) {
        _specialAndSuggestionArray = [NSMutableArray array];
    }
    return _specialAndSuggestionArray;
}

- (NSMutableArray *)quickEntryArray
{
    if (!_quickEntryArray) {
        _quickEntryArray = [NSMutableArray array];
    }
    
    return _quickEntryArray;
}

- (NSMutableArray *)advertisingArray
{
    if (!_advertisingArray) {
        _advertisingArray = [NSMutableArray array];
    }
    
    return _advertisingArray;
}

- (NSMutableArray *)cellsArray
{
    if (!_cellsArray)
    {
        _cellsArray = [NSMutableArray array];
    }
    
    return _cellsArray;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

-(NSMutableArray *)hotClassArray {
    if(_hotClassArray == nil) {
        _hotClassArray = [NSMutableArray array];
    }
    return _hotClassArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self requsetData];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = HEXCOLOR(0xeeeeee);
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,40);
    
//    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
    
    [self updataCells];
}

- (void)drawRecommendView
{
    UIView *recommendView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    recommendView.backgroundColor = [UIColor whiteColor];
    self.recommendView = recommendView;
    self.tableView.tableFooterView = recommendView;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//     collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = HEXCOLOR(0xeeeeee);
    collectionView.scrollEnabled = NO;
    [recommendView addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(recommendView,0)
    .topSpaceToView(recommendView,0)
    .rightSpaceToView(recommendView,0)
    .bottomSpaceToView(recommendView,0);
    
    [collectionView registerClass:[NormalCollectionCell class] forCellWithReuseIdentifier:normalCollectionCell];
    [collectionView registerClass:[SpecialDetailsHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID];
    [collectionView registerClass:[SpecialDetailsCell class] forCellWithReuseIdentifier:collectionID];
    [collectionView registerClass:[SpecialDetailsFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerViewID];
}

#pragma mark -- 弹出商品详情
-(void)PopShopPageView {
    
    AppDelegate *app = APPDELEGATE;
    PopGoodsDetailsView *popView = [PopGoodsDetailsView shareInstance];
    [app.window addSubview:popView];
}



- (void)updataCells
{
    self.cellsArray = [NSMutableArray array];
    
    self.advertisingArray = [NSMutableArray array];
    self.quickEntryArray = [NSMutableArray array];
    self.specialAndSuggestionArray = [NSMutableArray array];
    
    for (ModelTopicCollection *model in self.dataArray)
    {
        if ([model.Type isEqualToString:@"1"])
        {
            [self.advertisingArray addObject:model];
        }
        if ([model.Type isEqualToString:@"2"])
        {
            [self.quickEntryArray addObject:model];
        }
        if ([model.Type isEqualToString:@"3"])
        {
            [self.specialAndSuggestionArray addObject:model];
        }
        if ([model.Type isEqualToString:@"4"])
        {
            [self.specialAndSuggestionArray addObject:model];
        }
    }
    
    
    for (ModelTopicCollection *model in self.dataArray)
    {
        if ([model.Type isEqualToString:@"1"])
        {
            int i = 0;
            
            for (NSDictionary *dic in self.cellsArray)
            {
                if ([dic[kCell] isEqualToString:@"MainAdvertisingCell"])
                {
                    i ++;
                    break;
                }
            }
            
            if ( i == 0)
            {
                [self.cellsArray addObject:@{kCell:@"MainAdvertisingCell"}];
            }
        }
        
        if ([model.Type isEqualToString:@"2"])
        {
            int i = 0;
            for (NSDictionary *dic in self.cellsArray)
            {
                if ([dic[kCell] isEqualToString:@"MianQuickEntryCell"])
                {
                    i ++;
                    break;
                }
            }
            if ( i == 0)
            {
                [self.cellsArray addObject:@{kCell:@"MianQuickEntryCell"}];
            }
        }
        
        if ([model.Type isEqualToString:@"3"])
        {
//            int i = 0;
//            for (NSDictionary *dic in self.cellsArray)
//            {
//                if ([dic[kCell] isEqualToString:@"MainProductCellTypeTwo"])
//                {
//                    i ++;
//                    break;
//                }
//            }
//            
//            if ( i == 0)
//            {
//                [self.cellsArray addObject:@{kCell:@"MainProductCellTypeTwo"}];
//            }
            
            [self.cellsArray addObject:@{kCell:@"MainProductCellTypeTwo"}];
        }
        
//        if ([model.Type isEqualToString:@"4"])
//        {
//            int i = 0;
//            for (NSDictionary *dic in self.cellsArray)
//            {
//                if ([dic[kCell] isEqualToString:@"MainProductCellTypeTwo"])
//                {
//                    i ++;
//                    break;
//                }
//            }
//            
//            if ( i == 0)
//            {
//                [self.cellsArray addObject:@{kCell:@"MainProductCellTypeTwo"}];
//            }
//        }
        
        if ([model.Type isEqualToString:@"5"])
        {
            [self.cellsArray addObject:@{kCell:@"MainProductCellTypeOne",kValue:model}];
        }
    }
    
//    for(ModelHotCategoryCollection *hotModel in self.hotClassArray) {
//        int i = 0;
//        for(NSDictionary *dic in self.cellsArray) {
//            if([dic[kCell] isEqualToString:@"MainHotClassCell"]) {
//                i++;
//                break;
//            }
//        }
//        if(i == 0) {
//          [self.cellsArray addObject:@{kCell:@"MainHotClassCell"}];
//        }
//    }
    
    if(self.hotClassArray.count) {
       [self.cellsArray addObject:@{kCell:@"MainHotClassTitleCell",kValue:@"热门分类"}];
       [self.cellsArray addObject:@{kCell:@"MainHotClassCell"}];
    }
    
    [self.cellsArray addObject:@{kCell:@"MainHeadRecommendCell",kValue:@"精选商品 为您推荐"}];
    
    for(ModelMasterSaleProductCollection *model in self.recommendArray)
    {
        [self.cellsArray addObject:@{kCell:@"MainRecommendShopCell",kValue:model}];
    }
    
//    [self.cellsArray addObject:@{kCell:@"MainHeadRecommendCell",kValue:@"大家都在买"}];
//    [self.cellsArray addObject:@{kCell:@"MainEveryoneBuyCell"}];
    
    [self.tableView reloadData];
    
    
    [self.collectionView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
        self.recommendView.frame = CGRectMake(0, 0, ScreenWidth, height);
        self.tableView.tableFooterView = self.recommendView;
    });
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requsetData
{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.TopLayerGuid forKey:@"TopLayerGuid"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopicCollectionForFrontResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopicCollectionForFrontAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {

        ModelTopicCollectionResult *model = [ModelTopicCollectionResult mj_objectWithKeyValues:responseObject];
        
        self.dataArray = [NSMutableArray array];
        for (NSDictionary *dic in model.TopicCollection)
        {
            ModelTopicCollection *modelmodel = [ModelTopicCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:modelmodel];
        }
        
        [self requestGetCategoryCollectionForFrontAction];
        [self initrecommendationData];
        [self requestGetMasterSaleProductForTopLayerAction];
        
        [self drawView];
        [self drawRecommendView];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

/*
 热门分类
 */
-(void)requestGetCategoryCollectionForFrontAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.TopLayerGuid forKey:@"TopLayerGuid"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionForFrontResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionForFrontAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelTopicCollectionResult *model = [ModelTopicCollectionResult mj_objectWithKeyValues:responseObject];
        
        self.hotClassArray = [NSMutableArray array];
        for (NSDictionary *dic in model.CategoryCollection)
        {
            ModelHotCategoryCollection *modelmodel = [ModelHotCategoryCollection mj_objectWithKeyValues:dic];
            [self.hotClassArray addObject:modelmodel];
        }
        
        [self updataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
 
}

/*
 商品推荐
 */
-(void)initrecommendationData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.TopLayerGuid forKey:@"TopLayerGuid"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSuggestedProdcutCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSuggestedProdcutCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelTopicCollectionResult *model = [ModelTopicCollectionResult mj_objectWithKeyValues:responseObject];
        
        self.recommendArray = [NSMutableArray array];
        for (NSDictionary *dic in model.MasterSaleProductCollection)
        {
            ModelMasterSaleProductCollection *modelmodel = [ModelMasterSaleProductCollection mj_objectWithKeyValues:dic];
            [self.recommendArray addObject:modelmodel];
        }
        
        [self updataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

/**
 获取大家都在卖
 */
- (void)requestGetMasterSaleProductForTopLayerAction
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.TopLayerGuid forKey:@"TopLayerGuid"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductForTopLayerResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductForTopLayerAction" forKey:@"Action"];
    [params setValue:@"0" forKey:@"StartIndex"];
    [params setValue:@"20" forKey:@"Count"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelTopicCollectionResult *model = [ModelTopicCollectionResult mj_objectWithKeyValues:responseObject];
        
        self.weAllBuyArray = [NSMutableArray array];
        for (NSDictionary *dic in model.MasterSaleProductCollection)
        {
            ModelMasterSaleProductCollection *modelmodel = [ModelMasterSaleProductCollection mj_objectWithKeyValues:dic];
            [self.weAllBuyArray addObject:modelmodel];
        }
        
        [self updataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)addToShopCartAction:(ModelMasterSaleProductCollection *)model {
    NSLog(@"-------%@",model.ProductGuid);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:model.Guid forKey:@"SaleProductGuid"];
    [params setValue:@"1" forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        [LCProgressHUD showSuccess:@"添加成功"];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}


#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"MainAdvertisingCell"])
    {
        MainAdvertisingCell *cell = [MainAdvertisingCell cellWithTableView:tableView dataArray:self.advertisingArray];
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MianQuickEntryCell"])
    {
        MianQuickEntryCell *cell = [MianQuickEntryCell cellWithTableView:tableView dataArray:self.quickEntryArray];
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainProductCellTypeOne"])
    {
        MainProductCellTypeOne *cell = [MainProductCellTypeOne cellWithTableView:tableView model:dic[kValue]];
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainProductCellTypeTwo"])
    {
        MainProductCellTypeTwo *cell = [MainProductCellTypeTwo cellWithTableView:tableView];
        cell.dataArray = self.specialAndSuggestionArray;
        return cell;
    }
    if([dic[kCell] isEqualToString:@"MainHotClassTitleCell"]) {
        MainHotClassTitleCell *cell = [MainHotClassTitleCell cellWithTableview:tableView];
        cell.nameLabel.text = dic[kValue];
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainHotClassCell"])
    {
        MainHotClassCell *cell = [MainHotClassCell cellWithTableview:tableView dataArray:self.hotClassArray];
        
        cell.hotClassCell = ^(NSString *productId){
            ProductListVC *listVC = [[ProductListVC alloc]init];
            listVC.CategoryGuid = productId;
            listVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:listVC animated:YES];
        };
        
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainHeadRecommendCell"])
    {
        MainHeadRecommendCell *cell = [MainHeadRecommendCell cellWithTableview:tableView];
        cell.nameLabel.text = dic[kValue];
        
        if ([dic[kValue] isEqualToString:@"精选商品 为您推荐"])
        {
            cell.contentView.backgroundColor = HEXCOLOR(0xeeeeee);
        }else{
            cell.contentView.backgroundColor = [UIColor whiteColor];
        }
        
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainRecommendShopCell"])
    {
        MainRecommendShopCell *cell = [MainRecommendShopCell cellWithTableview:tableView];
        cell.model = dic[kValue];
        cell.carBlock = ^() {
            [self addToShopCartAction:dic[kValue]];
        };
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"MainEveryoneBuyCell"])
    {
        MainEveryoneBuyCell *cell = [MainEveryoneBuyCell cellWithTableview:tableView];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"MainAdvertisingCell"])
    {
        return ScreenWidth *9/16;
    }
    if ([dic[kCell] isEqualToString:@"MianQuickEntryCell"])
    {
        long rowIndex = ceilf(self.quickEntryArray.count / 4.0);
        return 100 * rowIndex;
    }
    if ([dic[kCell] isEqualToString:@"MainProductCellTypeOne"])
    {
        return ScreenWidth *9/16 + 140 + 5;
    }
    if ([dic[kCell] isEqualToString:@"MainProductCellTypeTwo"])
    {
        return 200;
    }
    if([dic[kCell] isEqualToString:@"MainHotClassTitleCell"]) {
        return 40;
    }
    if ([dic[kCell] isEqualToString:@"MainHotClassCell"])
    {
        long rowIndex = ceilf(self.hotClassArray.count / 5.0);
        return 90 * rowIndex;
    }
    if ([dic[kCell] isEqualToString:@"MainHeadRecommendCell"])
    {
        return 40;
    }
    if ([dic[kCell] isEqualToString:@"MainRecommendShopCell"])
    {
        return (ScreenWidth - 10)/3;
    }
    if ([dic[kCell] isEqualToString:@"MainEveryoneBuyCell"])
    {
        return 300;
    }
    
    return 0;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"MainRecommendShopCell"])
    {
        
        ModelMasterSaleProductCollection *model = dic[kValue];
        
        ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
        vc.guid = model.Guid;
        vc.hidesBottomBarWhenPushed = YES;
        [DCURLRouter pushViewController:vc animated:YES];
    }
}

#pragma mark -
#pragma mark ================= UICollectionViewDelegate,UICollectionViewDataSource =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.weAllBuyArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SpecialDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    cell.model2 = self.weAllBuyArray[indexPath.row];
    __weak typeof(self) WeakSelf = self;
    cell.shopcarBlock = ^() {
        [WeakSelf PopShopPageView];
    };
    return cell;
    //return  [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelMasterSaleProductCollection *model = self.weAllBuyArray[indexPath.row];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.guid = model.Guid;
    vc.hidesBottomBarWhenPushed = YES;
    [DCURLRouter pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark ================= UICollectionViewDelegateFlowLayout =================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat flowLayoutW = (ScreenWidth-15)/2;
    return CGSizeMake(flowLayoutW, flowLayoutW+SizeScale(60));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 35);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 35);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        SpecialDetailsHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID forIndexPath:indexPath];
        headerView.backgroundColor = HEXCOLOR(0xeeeeee);
        headerView.nameLabel.text = @"大家都在买";
        return headerView;
    }
    else if (kind == UICollectionElementKindSectionFooter)
    {
        SpecialDetailsFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerViewID forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor clearColor];
        return footerView;
    }
    
    return nil;
}



@end
