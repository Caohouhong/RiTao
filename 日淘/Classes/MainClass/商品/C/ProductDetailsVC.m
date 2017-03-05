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

//vc

//model
#import "ModelProductDetail.h"

#define footerViewHeight 45
#define tableViewHeight ScreenHeight2 - footerViewHeight
#define productDetailScrollViewHeight ScreenHeight2 - footerViewHeight

@interface ProductDetailsVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, assign) float maxContentOffSet_Y;
@property (nonatomic, strong) ModelSaleProductDetail *modelSaleProductDetail;

@property (nonatomic, strong) UILabel *headLab;
@property (nonatomic, strong) UIScrollView *productDetailScrollView;

@end

@implementation ProductDetailsVC

- (UIScrollView *)productDetailScrollView
{
    if (!_productDetailScrollView) {
        _productDetailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,  _tableView.contentSize.height, ScreenWidth, productDetailScrollViewHeight)];
        _productDetailScrollView.contentSize = CGSizeMake(0, ScreenHeight);
        _productDetailScrollView.backgroundColor = [UIColor greenColor];
        _productDetailScrollView.delegate = self;
    }
    
    return _productDetailScrollView;
}

- (UILabel *)headLab
{
    if(!_headLab){
        _headLab = [[UILabel alloc] init];
        _headLab.text = @"上拉，返回详情";
        _headLab.textAlignment = NSTextAlignmentCenter;
        _headLab.font = [UIFont systemFontOfSize:14];
        
    }
    
    _headLab.frame = CGRectMake(0, 0, ScreenWidth, 40.f);
    _headLab.alpha = 0.f;
    _headLab.textColor = HEXCOLOR(0x999999);
    
    return _headLab;
}

- (NSMutableArray *)cellsArray
{
    if (!_cellsArray) {
        _cellsArray = [NSMutableArray array];
    }
    
    return _cellsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xinxi"] style:UIBarButtonItemStylePlain target:self action:@selector(DidClickShare)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.navigationItem.title = @"商品详情";
    
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
    // second view
    [self.view addSubview:self.productDetailScrollView];
    
    UILabel *hv = self.headLab;
    // headLab
    [self.productDetailScrollView addSubview:hv];
    [self.headLab bringSubviewToFront:self.view];
    
    // 开始监听_webView.scrollView的偏移量
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
    shouCangBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [footerView addSubview:shouCangBtn];
    
    UIButton *shopCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shouCangBtn.frame), 0, ScreenWidth/7, 45)];
    [shopCarBtn setImage:[UIImage imageNamed:@"gouwuche1"] forState:UIControlStateNormal];
    [shopCarBtn setImage:[UIImage imageNamed:@"gouwuche2"] forState:UIControlStateSelected];
    [shopCarBtn setTitle:@"购物车" forState:UIControlStateNormal];
    [shopCarBtn setTitleColor:HEXCOLOR(0x9d9c9c) forState:UIControlStateNormal];
    shopCarBtn.titleLabel.font = [UIFont systemFontOfSize:10];
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
    
    UIButton *buyBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopCarBtn.frame), 0, (ScreenWidth - ScreenWidth/7*3)/2, 45)];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    buyBtn.backgroundColor = HEXCOLOR(0xfd9426);
    [footerView addSubview:buyBtn];
    
    UIButton *addShopCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(buyBtn.frame), 0, buyBtn.width, buyBtn.height)];
    [addShopCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addShopCarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addShopCarBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    addShopCarBtn.backgroundColor = HEXCOLOR(0x689c1c);
    [footerView addSubview:addShopCarBtn];
}

- (void)updataCells
{
    self.cellsArray = [NSMutableArray array];
    
    if (self.modelSaleProductDetail.SaleProductPictureCollection.count)
    {
        NSDictionary *cell1 = @{kCell:@"ProductDetailImageCell",kValue:self.modelSaleProductDetail.SaleProductPictureCollection};//图片
        [self.cellsArray addObject:cell1];
    }
    
    if (self.modelSaleProductDetail.MarketPrice)
    {
        NSDictionary *cell2 = @{kCell:@"ProductDetailPriceCell",kValue:self.modelSaleProductDetail};//价格
        [self.cellsArray addObject:cell2];
    }
    
    NSDictionary *cell3 = @{kCell:@"ProductDetailBriefIntroductionCell",kValue:self.modelSaleProductDetail};//标题简介
    [self.cellsArray addObject:cell3];
    
    NSDictionary *cell4 = @{kCell:@"ProductDetailHaveChooseCell",kValue:self.modelSaleProductDetail};//已选
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
    
    if (self.modelSaleProductDetail.SaleProductCommentDetail)
    {
        NSDictionary *cell9 = @{kCell:@"ProductDetailCommentTitleCell"};//已购买小伙伴的评论
        [self.cellsArray addObject:cell9];
        
        NSDictionary *cell10 = @{kCell:@"ProductCommentCell",kValue:self.modelSaleProductDetail.SaleProductCommentDetail};//评论
        [self.cellsArray addObject:cell10];
    }
    
    NSDictionary *cell11 = @{kCell:@"ProductDetailMoreCommentCell",kValue:self.modelSaleProductDetail};//查看更多评论
    [self.cellsArray addObject:cell11];
    
    if (self.modelSaleProductDetail.BrandObject)
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

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailAction" forKey:@"Action"];
    [params setValue:@"7de2c631-816b-48e3-975a-cd6d8a556254" forKey:@"SaleProductID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        ModelProductDetail *model = [ModelProductDetail whc_ModelWithJson:responseObject];
        
        self.modelSaleProductDetail = model.SaleProductDetail;
        
        [self drawView];
        
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
        cell.model = dic[kValue];
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
        cell.model = dic[kValue];
        return cell;
    }
    else if ([dic[kCell] isEqualToString:@"ProductDetailNeedMoreCell"])
    {
        ProductDetailNeedMoreCell *cell = [ProductDetailNeedMoreCell cellWithTableView:tableView dataArray:dic[kValue]];
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
        return 45;
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
        NSLog(@"-----webView-------");
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
    [self.productDetailScrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
