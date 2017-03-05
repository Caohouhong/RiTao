//
//  ProductDetailsVC.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailsVC.h"

//cell
#import "ProductDetailImageCell.h"
#import "ProductDetailPriceCell.h"
#import "ProductDetailBriefIntroductionCell.h"
#import "ProductDetailHaveChooseCell.h"
#import "ProductDetailFreeShippingCell.h"
#import "ProductDetailDeliverGoodsCell.h"
#import "ProductDetailReturnGoodsCell.h"
#import "ProductDetailTagCell.h"
#import "ProductDetailCommentTitleCell.h"
#import "ProductCommentCell.h"
#import "ProductDetailMoreCommentCell.h"
#import "ProductDetailBrandCell.h"
#import "ProductDetailNeedMoreCell.h"
#import "ProductDetailRelatedTopicsCell.h"
#import "PurchaseCarAnimationTool.h"

//v
#import "PopDetailsPageView.h"

//vc
#import "SpecialDetailsVC.h"

//model
#import "ModelProductDetail.h"
#import "ModelShouCang.h"

//other
#import "XHWebImageAutoSize.h"

#import "ProductListVC.h"

#define footerViewHeight 45
#define tableViewHeight ScreenHeight2 - footerViewHeight
#define productDetailScrollViewHeight ScreenHeight2 - footerViewHeight

@interface ProductDetailsVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    BOOL isRequestSuccess; //是否请求功，判断移除
    NSString *isStock; //是否有库存
}
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, assign) float maxContentOffSet_Y;
@property (nonatomic, strong) ModelSaleProductDetail *modelSaleProductDetail;

@property (nonatomic, strong) UILabel *headLab;
@property (nonatomic, strong) UIScrollView *productDetailScrollView;
@property (nonatomic, weak) UIButton *shouCangBtn;

@property (nonatomic, assign) int chooseGuiGeIndex;

@end

@implementation ProductDetailsVC

- (UIScrollView *)productDetailScrollView
{
    if (!_productDetailScrollView)
    {
        _productDetailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _tableView.contentSize.height, ScreenWidth, productDetailScrollViewHeight)];
        _productDetailScrollView.contentSize = CGSizeMake(0, ScreenHeight);
//        _productDetailScrollView.backgroundColor = [UIColor greenColor];
        
        _productDetailScrollView.delegate = self;
    }
    
    return _productDetailScrollView;
}

- (UILabel *)headLab
{
    if(!_headLab)
    {
        _headLab = [[UILabel alloc] init];
        _headLab.text = @"上拉，返回详情";
        _headLab.textAlignment = NSTextAlignmentCenter;
        _headLab.font = [UIFont systemFontOfSize:14];
        
    }
    
    _headLab.frame = CGRectMake(0, 0, ScreenWidth, 40.f);
    _headLab.alpha = 0.f;
    _headLab.textColor = HEXCOLOR(0x666666);
    
    return _headLab;
}

- (NSMutableArray *)cellsArray
{
    if (!_cellsArray)
    {
        _cellsArray = [NSMutableArray array];
    }
    
    return _cellsArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xinxi"] style:UIBarButtonItemStylePlain target:self action:@selector(DidClickShare)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.navigationItem.title = @"商品详情";
    
    self.chooseGuiGeIndex = -1;
    
    [self requestData];
    
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, tableViewHeight) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
    UILabel *tabFootLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    tabFootLab.text = @"上拉查看图文详情";
    tabFootLab.font = [UIFont systemFontOfSize:14];
    tabFootLab.textColor = HEXCOLOR(0x999999);
    tabFootLab.textAlignment = NSTextAlignmentCenter;
    tableView.tableFooterView = tabFootLab;
    
    
    [self updataCells];
    
    self.maxContentOffSet_Y = 40;
    [self.view addSubview:self.productDetailScrollView];
    
    UILabel *hv = self.headLab;
    [self.productDetailScrollView addSubview:hv];
    [self.headLab bringSubviewToFront:self.view];
    
    [self.productDetailScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self drawFooterView];
    
}

- (void)drawFooterView
{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footerView];
    
    footerView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(footerViewHeight);
    
    UIButton *keFuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/7, 45)];
    [keFuBtn setImage:[UIImage imageNamed:@"kefu2"] forState:UIControlStateNormal];
    [keFuBtn setImage:[UIImage imageNamed:@"kefu1"] forState:UIControlStateSelected];
    [keFuBtn setTitle:@"客服" forState:UIControlStateNormal];
    [keFuBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    keFuBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [footerView addSubview:keFuBtn];
    
    UIButton *shouCangBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(keFuBtn.frame), 0, ScreenWidth/7, 45)];
    [shouCangBtn setImage:[UIImage imageNamed:@"shoucang"] forState:UIControlStateNormal];
    [shouCangBtn setImage:[UIImage imageNamed:@"shoucang2"] forState:UIControlStateSelected];
    [shouCangBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [shouCangBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    [shouCangBtn addTarget:self action:@selector(AddToFavoriteBtn) forControlEvents:UIControlEventTouchUpInside];
    shouCangBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    shouCangBtn.selected = self.modelSaleProductDetail.IsFavorite;
    [footerView addSubview:shouCangBtn];
    self.shouCangBtn = shouCangBtn;
    
    UIButton *shopCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shouCangBtn.frame), 0, ScreenWidth/7, 45)];
    [shopCarBtn setImage:[UIImage imageNamed:@"gouwuche1"] forState:UIControlStateNormal];
    //[shopCarBtn setImage:[UIImage imageNamed:@"gouwuche2"] forState:UIControlStateSelected];
    [shopCarBtn setTitle:@"购物车" forState:UIControlStateNormal];
    [shopCarBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    [shopCarBtn addTarget:self action:@selector(popshopCarBtn) forControlEvents:UIControlEventTouchUpInside];
    shopCarBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    //shopCarBtn.selected = self.modelSaleProductDetail.IsInShopCart;
    [footerView addSubview:shopCarBtn];
    
    CGFloat space = 5.0;
    [keFuBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [shouCangBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    [shopCarBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                             imageTitleSpace:space];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    lineView.backgroundColor = COLOR_LineViewColor;
    [footerView addSubview:lineView];
    
//    UIButton *buyBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopCarBtn.frame), 0, (ScreenWidth - ScreenWidth/7*3)/2, 45)];
//    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
//    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    buyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//    buyBtn.backgroundColor = HEXCOLOR(0xfd9426);
//    [footerView addSubview:buyBtn];
    
    UIButton *addShopCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopCarBtn.frame), 0, ScreenWidth/7*4, 45)];
    [addShopCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addShopCarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addShopCarBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [addShopCarBtn addTarget:self action:@selector(clickaddShopCarBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [footerView addSubview:addShopCarBtn];
    
    if ([isStock isEqualToString:@"已售罄"]){
        addShopCarBtn.backgroundColor = [UIColor grayColor];
        [addShopCarBtn setTitle:isStock forState:UIControlStateNormal];
        [addShopCarBtn setUserInteractionEnabled:NO];
    }else {
        addShopCarBtn.backgroundColor = HEXCOLOR(0xF5405E);
        [addShopCarBtn setUserInteractionEnabled:YES];
    }
}

- (void)drawProductImageDetailView
{
    int i = 0;
    for (ModelSaleProductDetailPictureCollection *model in self.modelSaleProductDetail.SaleProductDetailPictureCollection)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 1000+i;
        [self.productDetailScrollView addSubview:imageView];
        
        __weak typeof(self) weakSelf = self;
        [imageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:[UIImage imageNamed:@"default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [XHWebImageAutoSize storeImageSize:image forURL:imageURL completed:^(BOOL result) {
                [weakSelf reloadProductImageDetailViewHeight];
            }];
        }];
        
        i ++;
    }
    
    [self reloadProductImageDetailViewHeight];
}

- (void)reloadProductImageDetailViewHeight
{
    int i = 0;
    CGFloat scrollViewContent_H = 0.0;
    for (ModelSaleProductDetailPictureCollection *model in self.modelSaleProductDetail.SaleProductDetailPictureCollection)
    {
        UIImageView *imageView = [self.productDetailScrollView viewWithTag:i + 1000];
        
        CGFloat image_h = [XHWebImageAutoSize imageHeightForURL:IMAGE_URL(model.Picture) layoutWidth:ScreenWidth estimateHeight:ScreenWidth];
        
        imageView.frame = CGRectMake(0, scrollViewContent_H, ScreenWidth, image_h);
        
        scrollViewContent_H += image_h;
        
        i ++;
    }
    
    if (scrollViewContent_H > ScreenHeight)
    {
        self.productDetailScrollView.contentSize = CGSizeMake(0, scrollViewContent_H);
    }
    else
    {
        self.productDetailScrollView.contentSize = CGSizeMake(0, ScreenHeight);
    }
}

- (void)updataCells
{
    self.cellsArray = [NSMutableArray array];
    
    ModelSaleProductDetail *model;
    if (self.chooseGuiGeIndex == -1)
    {
        model = self.modelSaleProductDetail;
    }
    else
    {
        if (self.modelSaleProductDetail.SaleProductCollection.count)
        {
            model = self.modelSaleProductDetail.SaleProductCollection[self.chooseGuiGeIndex];
        }
    }
    
    if (self.modelSaleProductDetail.SaleProductPictureCollection.count)
    {
        NSDictionary *cell1 = @{kCell:@"ProductDetailImageCell",kValue:self.modelSaleProductDetail.SaleProductPictureCollection};//图片
        [self.cellsArray addObject:cell1];
    }
    
    if (self.modelSaleProductDetail.MarketPrice)
    {
        NSDictionary *cell2 = @{kCell:@"ProductDetailPriceCell",kValue:model,kType:self.modelSaleProductDetail};//价格
        [self.cellsArray addObject:cell2];
    }
    
    NSDictionary *cell3 = @{kCell:@"ProductDetailBriefIntroductionCell",kValue:model};//标题简介
    [self.cellsArray addObject:cell3];
    
    NSDictionary *cell4 = @{kCell:@"ProductDetailHaveChooseCell",kValue:self.modelSaleProductDetail.SaleProductCollection,kIndex:@(self.chooseGuiGeIndex)};//已选
    [self.cellsArray addObject:cell4];
    
    if (self.modelSaleProductDetail.DeliveryFeeRuleObject)
    {
        NSDictionary *cell5 = @{kCell:@"ProductDetailFreeShippingCell",kValue:self.modelSaleProductDetail.DeliveryFeeRuleObject};//包邮
        [self.cellsArray addObject:cell5];
    }
    
    if (self.modelSaleProductDetail.ReturnRuleObject)
    {
        NSDictionary *cell6 = @{kCell:@"ProductDetailDeliverGoodsCell",kValue:self.modelSaleProductDetail.DeliverySpeedRuleObject};//发货
        [self.cellsArray addObject:cell6];
    }
    
    if (self.modelSaleProductDetail.ReturnRuleObject)
    {
        NSDictionary *cell7 = @{kCell:@"ProductDetailReturnGoodsCell",kValue:self.modelSaleProductDetail.ReturnRuleObject};//7天退货
        [self.cellsArray addObject:cell7];
    }
    
    if (self.modelSaleProductDetail.SaleProductSpecialCollection.count) {
        NSDictionary *cell8 = @{kCell:@"ProductDetailTagCell",kValue:self.modelSaleProductDetail.SaleProductSpecialCollection};//标签
        [self.cellsArray addObject:cell8];
    }
    
    if ([self.modelSaleProductDetail.SaleProductCommentQuantity intValue]>0)
    {
        NSDictionary *cell9 = @{kCell:@"ProductDetailCommentTitleCell"};//已购买小伙伴的评论
        [self.cellsArray addObject:cell9];
        
        NSDictionary *cell10 = @{kCell:@"ProductCommentCell",kValue:self.modelSaleProductDetail.SaleProductCommentDetail};//评论
        [self.cellsArray addObject:cell10];
        
        NSDictionary *cell11 = @{kCell:@"ProductDetailMoreCommentCell",kValue:self.modelSaleProductDetail};//查看更多评论
        [self.cellsArray addObject:cell11];
    }
    
    
    if ([self.modelSaleProductDetail.BrandProductQuantity intValue] > 0)
    {
        NSDictionary *cell12 = @{kCell:@"ProductDetailBrandCell",kValue:self.modelSaleProductDetail};//推荐的品牌
        [self.cellsArray addObject:cell12];
    }
    
    if (self.modelSaleProductDetail.SaleProductSimpleDetailCollectionForLinked.count)
    {
        NSDictionary *cell13 = @{kCell:@"ProductDetailNeedMoreCell",kValue:self.modelSaleProductDetail.SaleProductSimpleDetailCollectionForLinked};//您也许还需要
        [self.cellsArray addObject:cell13];
    }
    
    if (self.modelSaleProductDetail.TopicCollection.count)
    {
        NSDictionary *cell14 = @{kCell:@"ProductDetailRelatedTopicsCell",kValue:self.modelSaleProductDetail.TopicCollection};//关联专题
        [self.cellsArray addObject:cell14];
    }
    
    [self.tableView reloadData];
}

- (void)DidClickShare
{

}

-(void)popshopCarBtn
{
    
    self.tabBarController.selectedIndex = 2;
//    NSMutableArray *arr = [NSMutableArray arrayWithObject:@"1"];
//    AppDelegate *app = APPDELEGATE;
//    PopDetailsPageView *popView = [PopDetailsPageView shareInstance];
//    popView.dataArray = arr;
//    [app.window addSubview:popView];
}

//收藏
-(void)AddToFavoriteBtn {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToFavoriteProductForMemberResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToFavoriteProductForMemberAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.modelSaleProductDetail.ProductGuid forKey:@"SaleProductGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        //H 测试  收藏按钮变红（接口问题）
        ModelShouCang *model = [ModelShouCang whc_ModelWithJson:responseObject];
        self.shouCangBtn.selected = model.IsAdd;
        NSLog(@"---%d", model.IsAdd);
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}

//添加购物侧
-(void)clickaddShopCarBtn
{
    AppDelegate *app = APPDELEGATE;
    PopDetailsPageView *popView = [PopDetailsPageView shareInstance];
    popView.chooseIndex = self.chooseGuiGeIndex;
    popView.dataArray = [NSMutableArray arrayWithArray:self.modelSaleProductDetail.SaleProductCollection];
    [app.window addSubview:popView];
    
    __weak typeof(self) weakSelf = self;
    popView.didChooseGuiGeBlock = ^(int index){
        weakSelf.chooseGuiGeIndex = index;
        [weakSelf updataCells];
    };
    
    popView.didAddShopCarSuccess = ^(){
        
    };
}


#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailAction" forKey:@"Action"];
    [params setValue:self.guid forKey:@"SaleProductID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberID"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
//        ModelProductDetail *model = [ModelProductDetail whc_ModelWithJson:responseObject];
        
        isRequestSuccess = YES;
        
        ModelProductDetail *model = [ModelProductDetail mj_objectWithKeyValues:responseObject];
        
        //库存
        isStock = model.SaleProductDetail.StockInfo;
        
        self.modelSaleProductDetail = model.SaleProductDetail;
        
        int i = 0;
        for (ModelSaleProductDetail *modelmodel in self.modelSaleProductDetail.SaleProductCollection)
        {
            if ([modelmodel.ShortDescription isEqualToString:self.modelSaleProductDetail.ShortDescription])
            {
                self.chooseGuiGeIndex = i;
                break;
            }
            
            i ++;
        }
        
        [self drawView];
        [self drawProductImageDetailView];
        [self.tableView reloadData];
        
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
    
    if ([dic[kCell] isEqualToString:@"ProductDetailImageCell"])
    {
        ProductDetailImageCell *cell = [ProductDetailImageCell cellWithTableView:tableView dataArray:dic[kValue]];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailPriceCell"])
    {
        ProductDetailPriceCell *cell = [ProductDetailPriceCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        cell.model2 = dic[kType];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailBriefIntroductionCell"])
    {
        ProductDetailBriefIntroductionCell *cell = [ProductDetailBriefIntroductionCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailHaveChooseCell"])
    {
        ProductDetailHaveChooseCell *cell = [ProductDetailHaveChooseCell cellWithTableView:tableView];
        cell.chooseIndex = [dic[kIndex] intValue];
        cell.dataArray = dic[kValue];
        
        __weak typeof(self) weakSelf = self;
        cell.didChooseGuiGeBlock = ^(int index){
            weakSelf.chooseGuiGeIndex = index;
            [weakSelf updataCells];
        };
        
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailFreeShippingCell"])
    {
        ProductDetailFreeShippingCell *cell = [ProductDetailFreeShippingCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailDeliverGoodsCell"])
    {
        ProductDetailDeliverGoodsCell *cell = [ProductDetailDeliverGoodsCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailReturnGoodsCell"])
    {
        ProductDetailReturnGoodsCell *cell = [ProductDetailReturnGoodsCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailTagCell"])
    {
        ProductDetailTagCell *cell = [ProductDetailTagCell cellWithTableView:tableView dataArray:dic[kValue]];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailCommentTitleCell"])
    {
        ProductDetailCommentTitleCell *cell = [ProductDetailCommentTitleCell cellWithTableView:tableView];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductCommentCell"])
    {
        ProductCommentCell *cell = [ProductCommentCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailMoreCommentCell"])
    {
        ProductDetailMoreCommentCell *cell = [ProductDetailMoreCommentCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailBrandCell"])
    {
        ProductDetailBrandCell *cell = [ProductDetailBrandCell cellWithTableView:tableView];
        //跳转商品详情
        cell.brandCellBlock = ^(NSString *productId) {
            ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
            vc.guid = productId;
            vc.hidesBottomBarWhenPushed = YES;
            [DCURLRouter pushViewController:vc animated:YES];
        };
        
        //跳转到类别
        cell.seeMoreBlock = ^(NSString *brandId){
            
            //H 测试 类别字段有问题
            ProductListVC *listVC = [[ProductListVC alloc]init];
            listVC.CategoryGuid = brandId;
            listVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:listVC animated:YES];
        };
        
//        707524e6-de72-4abc-8d89-45fe849af49e
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailNeedMoreCell"])
    {
        ProductDetailNeedMoreCell *cell = [ProductDetailNeedMoreCell cellWithTableView:tableView dataArray:dic[kValue]];
        
        //跳转商品详情
        cell.needMoreBlock = ^(NSString *productId){
          
            ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
            vc.guid = productId;
            vc.hidesBottomBarWhenPushed = YES;
            [DCURLRouter pushViewController:vc animated:YES];
        };
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailRelatedTopicsCell"])
    {
        ProductDetailRelatedTopicsCell *cell = [ProductDetailRelatedTopicsCell cellWithTableView:tableView dataArray:dic[kValue]];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"ProductDetailImageCell"])
    {
        return ScreenWidth;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailPriceCell"])
    {
        return 45;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailBriefIntroductionCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"model" cellClass:[ProductDetailBriefIntroductionCell class] contentViewWidth:ScreenWidth];
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailHaveChooseCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"dataArray" cellClass:[ProductDetailHaveChooseCell class] contentViewWidth:ScreenWidth];
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailFreeShippingCell"])
    {
        return 45;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailDeliverGoodsCell"])
    {
        return 45;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailReturnGoodsCell"])
    {
        return 45;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailTagCell"])
    {
        return productDetailTagViewItemH + 2;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailCommentTitleCell"])
    {
        return 35;
    }
    else if ([dic[kCell] isEqualToString:@"ProductCommentCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model: dic[kValue] keyPath:@"model" cellClass:[ProductCommentCell class] contentViewWidth:ScreenWidth];
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailMoreCommentCell"])
    {
        return 45;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailBrandCell"])
    {
        return [tableView cellHeightForIndexPath:indexPath model:dic[kValue] keyPath:@"model" cellClass:[ProductDetailBrandCell class] contentViewWidth:ScreenWidth];
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailNeedMoreCell"])
    {
        NSMutableArray *array = dic[kValue];
        long rowIndex = ceil(array.count / 3.0);
        
        return 48 + rowIndex *(ProductViewHeight + 15) + 10;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailRelatedTopicsCell"])
    {
        return 180;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.cellsArray[indexPath.row];
    if ([dic[kCell] isEqualToString:@"ProductDetailFreeShippingCell"])//包邮
    {
        WebViewVC *vc = [[WebViewVC alloc] init];
        vc.navigationItem.title = @"包邮说明";
        vc.UrlLinkType = @"1";
        [DCURLRouter pushViewController:vc animated:YES];
    }
    if ([dic[kCell] isEqualToString:@"ProductDetailDeliverGoodsCell"])//发货
    {
        WebViewVC *vc = [[WebViewVC alloc] init];
        vc.navigationItem.title = @"发货说明";
        vc.UrlLinkType = @"2";
        [DCURLRouter pushViewController:vc animated:YES];
    }
    if ([dic[kCell] isEqualToString:@"ProductDetailReturnGoodsCell"])//7天退货
    {
        WebViewVC *vc = [[WebViewVC alloc] init];
        vc.navigationItem.title = @"退货说明";
        vc.UrlLinkType = @"3";
        [DCURLRouter pushViewController:vc animated:YES];
    }
    
}


#pragma mark ---- scrollView delegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if([scrollView isKindOfClass:[UITableView class]]) // tableView界面上的滚动
    {
        // 能触发翻页的理想值:tableView整体的高度减去屏幕本省的高度
        CGFloat valueNum = _tableView.contentSize.height -ScreenHeight;
        if ((offsetY - valueNum) > self.maxContentOffSet_Y)
        {
            [self goToDetailAnimation]; // 进入图文详情的动画
        }
    }
    
    else // webView页面上的滚动
    {
        if(offsetY<0 && -offsetY>_maxContentOffSet_Y)
        {
            [self backToFirstPageAnimation]; // 返回基本详情界面的动画
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if(object == self.productDetailScrollView && [keyPath isEqualToString:@"contentOffset"])
    {
        [self headLabAnimation:[change[@"new"] CGPointValue].y];
    }else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

// 头部提示文本动画
- (void)headLabAnimation:(CGFloat)offsetY
{
    _headLab.alpha = -offsetY/60;
    _headLab.center = CGPointMake(ScreenWidth/2, -offsetY/2.f);
    // 图标翻转，表示已超过临界值，松手就会返回上页
    if(-offsetY>_maxContentOffSet_Y){
        _headLab.text = @"释放，返回详情";
    }else{
        _headLab.text = @"上拉，返回详情";
    }
}

// 进入详情的动画
- (void)goToDetailAnimation
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.productDetailScrollView.frame = CGRectMake(0, 0, ScreenWidth, productDetailScrollViewHeight);
        self.tableView.frame = CGRectMake(0, -tableViewHeight, ScreenWidth, tableViewHeight);
    } completion:^(BOOL finished) {
        
    }];
}


// 返回第一个界面的动画
- (void)backToFirstPageAnimation
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.tableView.frame = CGRectMake(0, 0, ScreenWidth, tableViewHeight);
        self.productDetailScrollView.frame = CGRectMake(0, self.tableView.contentSize.height, ScreenWidth, productDetailScrollViewHeight);
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dealloc
{
    if (isRequestSuccess){
        [self.productDetailScrollView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

@end
