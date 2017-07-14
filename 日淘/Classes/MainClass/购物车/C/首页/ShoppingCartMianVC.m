//
//  ShoppingCartMianVC.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ShoppingCartMianVC.h"
#import "ShoppingCartHeaderCell.h"
#import "ShoppingCartFooterCell.h"
#import "ShoppingCartProductCell.h"
#import "ShoppingCartCouDanTypeOneCell.h"
#import "ShoppingCartCouDanTypeTwoCell.h"
#import "ShoppingCartCouDanTypeThreeCell.h"
#import "ProductListVC.h"
#import "NormalCollectionCell.h"
#import "SpecialDetailsHeaderView.h"
#import "SpecialDetailsCell.h"
#import "SettlementCenterVC.h"
#import "ShoppingBackViewCell.h"
#import "ProductDetailsVC.h"

//model
#import "ModelMemberShopCartAction.h"
#import "ModelWfxMemberShopCart.h"
#import "ModelWfxMemberShopCartWarehouseCollection.h"
#import "ModelWarehouse.h"
#import "ModelWfxMemberShopCartDeliveryCollection.h"
#import "ModelWfxMemberShopCartSaleCouponCollection.h"
#import "ModelMemberShopCartDetailCollection.h"
#import "ModelTotalAmount.h"

static NSString *const normalCollectionCell = @"NormalCollectionCell";
static NSString *const headerViewID = @"SpecialDetailsHeaderView";
static NSString *const collectionID = @"SpecialDetailsCell";

@interface ShoppingCartMianVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIView *recommendView;
@property (nonatomic, weak) UILabel *heJiPriceLabel;
@property (nonatomic, weak) UILabel *numLabel;
@property (nonatomic, weak) UIBarButtonItem *bianJiBarBtn;

@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) NSMutableArray *ShopCarArray;

@property (nonatomic, strong) ModelMemberShopCartAction *ModelMain;

@property (nonatomic, assign) int numm;//暂时用的

@end

@implementation ShoppingCartMianVC

- (NSMutableArray *)cellsArray
{
    if (!_cellsArray) {
        _cellsArray = [NSMutableArray array];
    }
    
    return _cellsArray;
}

- (NSMutableArray *)ShopCarArray {
    if (!_ShopCarArray) {
        _ShopCarArray = [NSMutableArray array];
    }
    return _ShopCarArray;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestMemberShopCartResult];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.numm = 10;
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xiaoxi"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightBar)];
    UIBarButtonItem *bianJiBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightBar2)];
    self.bianJiBarBtn = bianJiBarBtn;
    self.navigationItem.rightBarButtonItems = @[rightBar,bianJiBarBtn];
    
    [self drawBottomView];
    [self drawView];
    [self drawRecommendView];
    [self updataCells];
    
}

- (void)drawView
{
//    ShoppingCartRecommendVC *recommendVC = [[ShoppingCartRecommendVC alloc] init];
//    [self addChildViewController:recommendVC];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = HEXCOLOR(0xeeeeee);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.bottomView,0);
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
}

- (void)drawBottomView
{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
    
    bottomView.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,48)
    .rightSpaceToView(self.view,0)
    .heightIs(50);
    
    UIView *centerLineView = [[UIView alloc] init];
    centerLineView.backgroundColor = [UIColor clearColor];
    [bottomView addSubview:centerLineView];
    
//    UIButton *selectBtn = [[UIButton alloc] init];
//    [selectBtn setImage:[UIImage imageNamed:@"Base"] forState:UIControlStateNormal];
//    [selectBtn setImage:[UIImage imageNamed:@"RadioOn"] forState:UIControlStateSelected];
//    [selectBtn addTarget:self action:@selector(clickselectBtn) forControlEvents:UIControlEventTouchUpInside];
//    [bottomView addSubview:selectBtn];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = HEXCOLOR(0x999999);
    label.text = @"合计";
    label.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:label];
    
    UILabel *heJiPriceLabel = [[UILabel alloc] init];
    heJiPriceLabel.font = [UIFont systemFontOfSize:14];
    heJiPriceLabel.textColor = HEXCOLOR(0xdf596a);
    heJiPriceLabel.text = @"¥0.00";
    heJiPriceLabel.textAlignment = NSTextAlignmentLeft;
    heJiPriceLabel.adjustsFontSizeToFitWidth = YES;
    [bottomView addSubview:heJiPriceLabel];
    self.heJiPriceLabel = heJiPriceLabel;
    
    UILabel *numLabel = [[UILabel alloc] init];
    numLabel.font = [UIFont systemFontOfSize:12];
    numLabel.textColor = HEXCOLOR(0x999999);
    numLabel.text = @"共 0 件";
    numLabel.textAlignment = NSTextAlignmentLeft;
    [bottomView addSubview:numLabel];
    self.numLabel = numLabel;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HEXCOLOR(0xeeeeee);
    [bottomView addSubview:lineView];
    
    UIButton *jieSuanBtn = [[UIButton alloc] init];
    [jieSuanBtn setTitle:@"去结算" forState:UIControlStateNormal];
    [jieSuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    jieSuanBtn.backgroundColor = HEXCOLOR(0xdf596a);
    jieSuanBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [jieSuanBtn addTarget:self action:@selector(quJieSuan) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:jieSuanBtn];
    
    centerLineView.sd_layout
    .leftSpaceToView(bottomView,0)
    .rightSpaceToView(bottomView,0)
    .centerYEqualToView(bottomView)
    .heightIs(0.5);
    
//    selectBtn.sd_layout
//    .leftSpaceToView(bottomView,15)
//    .centerYEqualToView(bottomView)
//    .heightIs(50)
//    .widthIs(20);
    
    jieSuanBtn.sd_layout
    .rightSpaceToView(bottomView,0)
    .topSpaceToView(bottomView,0)
    .bottomSpaceToView(bottomView,0)
    .widthIs(ScreenWidth/2);
    
    label.sd_layout
    .leftSpaceToView(bottomView,20)
    .bottomSpaceToView(centerLineView,5)
    .autoHeightRatio(0)
    .widthIs(25);
    
    heJiPriceLabel.sd_layout
    .leftSpaceToView(label,3)
    .bottomEqualToView(label)
    .heightIs(16)
    .rightSpaceToView(jieSuanBtn,5);
    
    numLabel.sd_layout
    .leftEqualToView(label)
    .rightEqualToView(heJiPriceLabel)
    .topSpaceToView(centerLineView,5)
    .autoHeightRatio(0);
    
    lineView.sd_layout
    .leftSpaceToView(bottomView,0)
    .rightSpaceToView(bottomView,0)
    .topSpaceToView(bottomView,0)
    .heightIs(0.5);
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
    collectionView.backgroundColor = [UIColor whiteColor];
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
}

- (void)headerRefersh
{
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRefersh
{
    self.numm += 10;
    
    [self reloadView];
    
    [self.tableView.mj_footer endRefreshing];
}

- (void)updataCells
{
    self.cellsArray = [NSMutableArray array];
    
    for(ModelWfxMemberShopCartWarehouseCollection *model in self.ShopCarArray) {
        
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *ShopCartDetailArray = [NSMutableArray array];
        for (ModelWfxMemberShopCartDeliveryCollection *Delivery in model.WfxMemberShopCartDeliveryCollection) {
            for(ModelWfxMemberShopCartSaleCouponCollection *SaleCoupon in Delivery.WfxMemberShopCartSaleCouponCollection) {
                [ShopCartDetailArray addObjectsFromArray:SaleCoupon.MemberShopCartDetailCollection];
            }
        }
        //仓库
        NSDictionary *dic1 = @{kCell:@"ShoppingCartHeaderCell",kValue:model, kArray:ShopCartDetailArray};
        [array addObject:dic1];
        
        for (ModelWfxMemberShopCartDeliveryCollection *Delivery in model.WfxMemberShopCartDeliveryCollection) {
            
            for(ModelWfxMemberShopCartSaleCouponCollection *SaleCoupon in Delivery.WfxMemberShopCartSaleCouponCollection) {
                
                if(SaleCoupon.SaleCouponDescription.length) { //优惠
                    NSDictionary *dic4 = @{kCell:@"ShoppingCartCouDanTypeOneCell",kValue:SaleCoupon,kValue2:model};
                    [array addObject:dic4];
                }
                
                for(ModelMemberShopCartDetailCollection *Detail in SaleCoupon.MemberShopCartDetailCollection) {
                    NSDictionary *dic2 = @{kCell:@"ShoppingCartProductCell",kValue:Detail,kArray:ShopCartDetailArray,kType:model};  //商品数据
                    [array addObject:dic2];
                }
            }
        
            if(Delivery.DeilveryDescription.length) {
                NSDictionary *dic3 = @{kCell:@"ShoppingCartCouDanTypeTwoCell",kValue:Delivery,kValue2:model};
                [array addObject:dic3]; //包邮
            }
        }
        
//        NSDictionary *dic4 = @{kCell:@"ShoppingCartFooterCell",kValue:model};
//        [array addObject:dic4];  // 底部优惠
        
        [self.cellsArray addObject:array];
    }
    
    if(!self.cellsArray.count) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        NSDictionary *dic = @{kCell:@"ShoppingBackViewCell"};
        [array addObject:dic];
        [self.cellsArray addObject:array];
    }
    
//    NSMutableArray *array1 = [NSMutableArray array];
//    NSDictionary *dic1_1 = @{kCell:@"ShoppingCartHeaderCell"};
//    NSDictionary *dic1_6 = @{kCell:@"ShoppingCartCouDanTypeOneCell"};
//    NSDictionary *dic1_2 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic1_4 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic1_5 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic1_7 = @{kCell:@"ShoppingCartCouDanTypeTwoCell"};
//    NSDictionary *dic1_3 = @{kCell:@"ShoppingCartFooterCell"};
//    [array1 addObject:dic1_1];
//    [array1 addObject:dic1_6];
//    [array1 addObject:dic1_2];
//    [array1 addObject:dic1_4];
//    [array1 addObject:dic1_5];
//    [array1 addObject:dic1_7];
//    [array1 addObject:dic1_3];
//    
//    NSMutableArray *array2 = [NSMutableArray array];
//    NSDictionary *dic2_1 = @{kCell:@"ShoppingCartHeaderCell"};
//    NSDictionary *dic2_6 = @{kCell:@"ShoppingCartCouDanTypeOneCell"};
//    NSDictionary *dic2_2 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic2_4 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic2_5 = @{kCell:@"ShoppingCartProductCell"};
//    NSDictionary *dic2_7 = @{kCell:@"ShoppingCartCouDanTypeThreeCell"};
//    NSDictionary *dic2_3 = @{kCell:@"ShoppingCartFooterCell"};
//    [array2 addObject:dic2_1];
//    [array2 addObject:dic2_6];
//    [array2 addObject:dic2_2];
//    [array2 addObject:dic2_4];
//    [array2 addObject:dic2_5];
//    [array2 addObject:dic2_7];
//    [array2 addObject:dic2_3];
//    
//    [self.cellsArray addObject:array1];
//    [self.cellsArray addObject:array2];
    
    [self reloadView];
}

- (void)reloadView
{
    [self.tableView reloadData];
    [self.collectionView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
        NSLog(@"===>%f",height);
        self.recommendView.frame = CGRectMake(0, 0, ScreenWidth, height);
        self.tableView.tableFooterView = self.recommendView;
    });
}


#pragma MARK --网络
-(void)requestMemberShopCartResult {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    //[params setValue:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.ModelMain = [ModelMemberShopCartAction mj_objectWithKeyValues:responseObject];

        self.ShopCarArray = [NSMutableArray array];
        
        for (NSDictionary *dic  in self.ModelMain.WfxMemberShopCart.WfxMemberShopCartWarehouseCollection) {
            ModelWfxMemberShopCartWarehouseCollection *model = [ModelWfxMemberShopCartWarehouseCollection mj_objectWithKeyValues:dic];
            [self.ShopCarArray addObject:model];
        }
        
        NSString *Value = self.ModelMain.WfxMemberShopCart.TotalAmount.Value;
        NSString *MoneySymbol = self.ModelMain.WfxMemberShopCart.TotalAmount.MoneySymbol;
        self.heJiPriceLabel.text = [NSString stringWithFormat:@"%@%@",MoneySymbol,Value];
        self.numLabel.text = [NSString stringWithFormat:@"共 %@ 件",self.ModelMain.WfxMemberShopCart.TotalQuantity];
        NSLog(@"------%@=-----%@",self.heJiPriceLabel.text,self.numLabel.text );
        
        [self updataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark ==选中接口
-(void)SelectFromShopCartAction:(ModelMemberShopCartDetailCollection *)model {
    NSLog(@"-----MemberGuid-%@-----SaleProductGuid-%@-----WarehouseGuid-%@", model.MemberGuid,model.SaleProductGuid,model.WarehouseGuid);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.SelectFromShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:model.SaleProductGuid forKey:@"SaleProductGuid"];
    [params setValue:@"00000000-0000-0000-0000-000000000000" forKey:@"WarehouseGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.ModelMain = [ModelMemberShopCartAction mj_objectWithKeyValues:responseObject];
        
        self.ShopCarArray = [NSMutableArray array];
        
        for (NSDictionary *dic  in self.ModelMain.WfxMemberShopCart.WfxMemberShopCartWarehouseCollection) {
            ModelWfxMemberShopCartWarehouseCollection *model = [ModelWfxMemberShopCartWarehouseCollection mj_objectWithKeyValues:dic];
            [self.ShopCarArray addObject:model];
        }
        
        NSString *Value = self.ModelMain.WfxMemberShopCart.TotalAmount.Value;
        NSString *MoneySymbol = self.ModelMain.WfxMemberShopCart.TotalAmount.MoneySymbol;
        self.heJiPriceLabel.text = [NSString stringWithFormat:@"%@%@",MoneySymbol,Value];
        self.numLabel.text = [NSString stringWithFormat:@"共 %@ 件",self.ModelMain.WfxMemberShopCart.TotalQuantity];
        NSLog(@"------%@=-----%@",self.heJiPriceLabel.text,self.numLabel.text );
        
        [self updataCells];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)ModelWfxMemberShopCartWarehouseCollection:(ModelWfxMemberShopCartWarehouseCollection *)model {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.SelectFromShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:model.Warehouse.Guid forKey:@"WarehouseGuid"]; //WarehouseGuid
    [params setValue:@"00000000-0000-0000-0000-000000000000" forKey:@"SaleProductGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.ModelMain = [ModelMemberShopCartAction mj_objectWithKeyValues:responseObject];
        
        self.ShopCarArray = [NSMutableArray array];
        
        for (NSDictionary *dic  in self.ModelMain.WfxMemberShopCart.WfxMemberShopCartWarehouseCollection) {
            ModelWfxMemberShopCartWarehouseCollection *model = [ModelWfxMemberShopCartWarehouseCollection mj_objectWithKeyValues:dic];
            [self.ShopCarArray addObject:model];
        }
        
        NSString *Value = self.ModelMain.WfxMemberShopCart.TotalAmount.Value;
        NSString *MoneySymbol = self.ModelMain.WfxMemberShopCart.TotalAmount.MoneySymbol;
        self.heJiPriceLabel.text = [NSString stringWithFormat:@"%@%@",MoneySymbol,Value];
        self.numLabel.text = [NSString stringWithFormat:@"共 %@ 件",self.ModelMain.WfxMemberShopCart.TotalQuantity];
        NSLog(@"------%@=-----%@",self.heJiPriceLabel.text,self.numLabel.text );
        
        [self updataCells];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)UpdateToShopCartAction:(ModelMemberShopCartDetailCollection *)model num:(NSInteger)num {
    NSLog(@"-------%@-------%ld",model.SaleProductGuid, (long)num);
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UpdateToShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:model.SaleProductGuid forKey:@"SaleProductGuid"];
    [params setValue:@(num) forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.ModelMain = [ModelMemberShopCartAction mj_objectWithKeyValues:responseObject];
        
        self.ShopCarArray = [NSMutableArray array];
        
        for (NSDictionary *dic  in self.ModelMain.WfxMemberShopCart.WfxMemberShopCartWarehouseCollection) {
            ModelWfxMemberShopCartWarehouseCollection *model = [ModelWfxMemberShopCartWarehouseCollection mj_objectWithKeyValues:dic];
            [self.ShopCarArray addObject:model];
        }
        
        NSString *Value = self.ModelMain.WfxMemberShopCart.TotalAmount.Value;
        NSString *MoneySymbol = self.ModelMain.WfxMemberShopCart.TotalAmount.MoneySymbol;
        self.heJiPriceLabel.text = [NSString stringWithFormat:@"%@%@",MoneySymbol,Value];
        self.numLabel.text = [NSString stringWithFormat:@"共 %@ 件",self.ModelMain.WfxMemberShopCart.TotalQuantity];
        NSLog(@"------%@=-----%@",self.heJiPriceLabel.text,self.numLabel.text );
        
        [self updataCells];

    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];

}

-(void)didClickRightBar {
    
}
-(void)didClickRightBar2 {
    
    BOOL isEditing = self.tableView.isEditing;
    
    [self.tableView setEditing:!isEditing animated:YES];
    
    if (!isEditing) {
        self.bianJiBarBtn.title = @"完成";
    }else{
        self.bianJiBarBtn.title = @"编辑";
    }
}

/**
 去结算
 */
- (void)quJieSuan
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.PrepareSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.PrepareSaleOrderAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        SettlementCenterVC *vc = [[SettlementCenterVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [DCURLRouter pushViewController:vc animated:YES];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cellsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *array = self.cellsArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if([dic[kCell]isEqualToString:@"ShoppingBackViewCell"]) {
        ShoppingBackViewCell *cell = [ShoppingBackViewCell cellWithTableview:tableView];
        cell.block = ^() {
            weakSelf.tabBarController.selectedIndex = 0;
        };
        return cell;
    }
    if ([dic[kCell] isEqualToString:@"ShoppingCartHeaderCell"])
    {
        ShoppingCartHeaderCell *cell = [ShoppingCartHeaderCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        WEAK(WeakSelf)
        cell.allBlock = ^() {
            [self ModelWfxMemberShopCartWarehouseCollection:dic[kValue]];
            [WeakSelf.tableView reloadData];
        };
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartProductCell"])
    {
        ShoppingCartProductCell *cell = [ShoppingCartProductCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        cell.btnBlock = ^() {
            [weakSelf SelectFromShopCartAction:dic[kValue]];
            [weakSelf.tableView reloadData];
        };
        cell.addBlcok = ^(NSInteger num) {
            [weakSelf UpdateToShopCartAction:dic[kValue] num:num];
        };
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartFooterCell"])
    {
        ShoppingCartFooterCell *cell = [ShoppingCartFooterCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeOneCell"])
    {
        ShoppingCartCouDanTypeOneCell *cell = [ShoppingCartCouDanTypeOneCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeTwoCell"])
    {
        ShoppingCartCouDanTypeTwoCell *cell = [ShoppingCartCouDanTypeTwoCell cellWithTableView:tableView];
        cell.model = dic[kValue];
        return cell;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeThreeCell"])
    {
        ShoppingCartCouDanTypeThreeCell *cell = [ShoppingCartCouDanTypeThreeCell cellWithTableView:tableView];
        return cell;
    }
    
    return [UITableViewCell new];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if ([dic[kCell] isEqualToString:@"ShoppingCartProductCell"])
    {
        ModelMemberShopCartDetailCollection *model =  dic[kValue];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberShopCartResult" forKey:@"ResultType"];
        [params setValue:@"RiTaoErp.Business.Front.Actions.DeleteFromShopCartAction" forKey:@"Action"];
        [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
        [params setValue:model.SaleProductGuid forKey:@"SaleProductGuid"];
        [params setValue:AppID forKey:@"AppID"];
        
        [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
            
            self.ModelMain = [ModelMemberShopCartAction mj_objectWithKeyValues:responseObject];
            
            self.ShopCarArray = [NSMutableArray array];
            for (NSDictionary *dic  in self.ModelMain.WfxMemberShopCart.WfxMemberShopCartWarehouseCollection) {
                ModelWfxMemberShopCartWarehouseCollection *model = [ModelWfxMemberShopCartWarehouseCollection mj_objectWithKeyValues:dic];
                [self.ShopCarArray addObject:model];
            }
            
            NSString *Value = self.ModelMain.WfxMemberShopCart.TotalAmount.Value;
            NSString *MoneySymbol = self.ModelMain.WfxMemberShopCart.TotalAmount.MoneySymbol;
            self.heJiPriceLabel.text = [NSString stringWithFormat:@"%@%@",MoneySymbol,Value];
            self.numLabel.text = [NSString stringWithFormat:@"共 %@ 件",self.ModelMain.WfxMemberShopCart.TotalQuantity];
            
            [self updataCells];


        } successBackfailError:^(id responseObject) {
            
        } failure:^(NSError *error) {
            
        }];
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if ([dic[kCell] isEqualToString:@"ShoppingCartProductCell"]){
        return YES;
    }
    return NO;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if([dic[kCell]isEqualToString:@"ShoppingBackViewCell"]) {
        return ScreenHeight/2;
    }
    if ([dic[kCell] isEqualToString:@"ShoppingCartHeaderCell"])
    {
        return 40;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartProductCell"])
    {
        return 100;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartFooterCell"])
    {
        return 40;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeOneCell"])
    {
        return 30;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeTwoCell"])
    {
        return 30;
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeThreeCell"])
    {
        return 30;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeOneCell"])
    {
        ModelWfxMemberShopCartWarehouseCollection *model1 = dic[kValue2];//仓库
        ModelWfxMemberShopCartSaleCouponCollection *model2 = dic[kValue2];//满减
        
        ProductListVC *vc = [[ProductListVC alloc] init];
        NSDictionary *dic = @{@"SaleCouponGuid":model2.Guid,@"WarehouseGuid":model1.Guid};
        vc.manJianDic = dic;
        vc.hidesBottomBarWhenPushed = YES;
        [DCURLRouter pushViewController:vc animated:YES];
    }
    
    if ([dic[kCell] isEqualToString:@"ShoppingCartCouDanTypeTwoCell"])
    {
        
        ModelWfxMemberShopCartWarehouseCollection *model1 = dic[kValue2];//仓库
        ModelWfxMemberShopCartDeliveryCollection *model2 = dic[kValue2];//包邮
        
        ProductListVC *vc = [[ProductListVC alloc] init];
        NSDictionary *dic = @{@"DeliveryFeeGuid":model2.Guid,@"WarehouseGuid":model1.Guid};
        vc.baoYouDic = dic;
        vc.hidesBottomBarWhenPushed = YES;
        [DCURLRouter pushViewController:vc animated:YES];
    }
    
    //点击商品跳转
    if ([dic[kCell] isEqualToString:@"ShoppingCartProductCell"])
    {
        ModelMemberShopCartDetailCollection *model =  dic[kValue];
        
        ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
        vc.guid = model.SaleProductGuid;
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
    return self.ModelMain.WfxMemberShopCart.WfxShopCartSuggestionSaleProductCollection.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SpecialDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    cell.model2 = self.ModelMain.WfxMemberShopCart.WfxShopCartSuggestionSaleProductCollection[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelMasterSaleProductCollection *modelmodel = self.ModelMain.WfxMemberShopCart.WfxShopCartSuggestionSaleProductCollection[indexPath.row];
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    vc.guid = modelmodel.ProductGuid;
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 35);
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SpecialDetailsHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID forIndexPath:indexPath];
    headerView.nameLabel.text = @"为您推荐";
    return headerView;
}


@end
