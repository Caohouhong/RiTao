//
//  ClassificationMainVC.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ClassificationMainVC.h"
#import "ClassificationMainCell.h"
#import "ClassCollectionHeaderView.h"
#import "ClassCollectionCell.h"
#import "TopCategoryCollectionModel.h"
#import "TopLayerCollectionModel.h"
#import "CategoryCollectionModel.h"
#import "CommonUsageCategoryCollectionModel.h"
#import "HotUsageCategoryCollectionModel.h"
#import "ModelSuggestionCategoryPictureResult.h"

#import "ProductListVC.h"
#import "CommoditySearchVC.h"


@interface ClassificationMainVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *leftArray;
@property (nonatomic, strong) NSMutableArray *rightArray;
@property (nonatomic, strong) NSMutableArray *rightFirstArray;
@property (nonatomic, strong) NSMutableArray *threeArray;
@property (nonatomic, strong) TopCategoryCollectionModel *topCategoryCollectionModel;
@property (nonatomic, assign) NSInteger selectNum;
@property (nonatomic, weak) UIImageView *headImageView;

//三级请求
@property (nonatomic, strong) NSMutableArray *requestThreeArray;

@property (nonatomic, assign) int requestNum; //请求次数
@end

@implementation ClassificationMainVC
static NSString *const headerViewID = @"ClassCollectionHeaderView.h";
static NSString *const collectionID = @"ClassCollectionCell.h";

-(NSMutableArray *)requestThreeArray {
    if(_requestThreeArray == nil) {
        _requestThreeArray = [NSMutableArray array];
    }
    return _requestThreeArray;
}


-(NSMutableArray *)threeArray {
    if(_threeArray == nil) {
        _threeArray = [NSMutableArray array];
    }
    return _threeArray;
}

-(NSMutableArray *)leftArray {
    if(_leftArray == nil) {
        _leftArray = [NSMutableArray array];
    }
    return _leftArray;
}

-(NSMutableArray *)rightArray {
    if(_rightArray == nil) {
        _rightArray = [NSMutableArray array];
    }
    return _rightArray;
}

-(NSMutableArray *)rightFirstArray {
    if(_rightFirstArray == nil) {
        _rightFirstArray = [NSMutableArray array];
    }
    return _rightFirstArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.selectNum = 0;
    self.requestNum = 0;
    
    [self initNav];
    [self initTableView];
    [self initCollectionView];
    [self initleftData];
    //[self requestSuggestionCategoryPictureResult];
    //[self initCommonData];
    //[self initHotData];
    //[self initrightData];
    
}


#pragma mark =====网络请求======
//左边数据
-(void)initleftData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopCategoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopCategoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.topCategoryCollectionModel = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
        
        TopLayerCollectionModel *TopLayermodel = [[TopLayerCollectionModel alloc]init];
        TopLayermodel.Name = @"为你推荐";
        TopLayermodel.Guid = @"00000000-0000-0000-0000-000000000000";
        [self.leftArray addObject:TopLayermodel];
        
        for(NSDictionary *dic in self.topCategoryCollectionModel.TopCategoryCollection) {
            TopLayerCollectionModel *model = [TopLayerCollectionModel mj_objectWithKeyValues:dic];
            [self.leftArray addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
        [self initCommonDataWithGuid:TopLayermodel];
       
        [self requestSuggestionCategoryPictureResult];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 右边第一个头部图片
-(void)requestSuggestionCategoryPictureResult {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSuggestionCategoryPictureResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSuggestionCategoryPictureAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
//        self.topCategoryCollectionModel = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
//        
        ModelSuggestionCategoryPictureResult *model = [ModelSuggestionCategoryPictureResult mj_objectWithKeyValues:responseObject];
        
        [self.headImageView sd_setImageWithURL:IMAGE_URL(model.Value) placeholderImage:nil];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 二级分类
-(void)initrightDataWithGuid:(TopLayerCollectionModel *)model {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"ParentCategoryGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.topCategoryCollectionModel = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
        
        [self.headImageView sd_setImageWithURL:IMAGE_URL(self.topCategoryCollectionModel.MainCategoryPicture) placeholderImage:nil];
        
        self.rightArray = [NSMutableArray array];
        self.threeArray = [NSMutableArray array];
        
        [self.requestThreeArray removeAllObjects];
        
        for(NSDictionary *dic in self.topCategoryCollectionModel.CategoryCollection) {
            CategoryCollectionModel *model = [CategoryCollectionModel mj_objectWithKeyValues:dic];
            
            //请求三级数据的
            [self.requestThreeArray addObject:model];
        }
        
        if (self.requestThreeArray.count > 0){
            self.requestNum = 0;
            [self initThreeData:self.requestThreeArray.firstObject];
        }
    
        [self.collectionView reloadData];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 三级分类
-(void)initThreeData:(CategoryCollectionModel *)modelmodel {
    
    self.requestNum ++;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCategoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:modelmodel.Guid forKey:@"ParentCategoryGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
    
        TopCategoryCollectionModel *model = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
        NSMutableArray *array = [[NSMutableArray array]init];
        for(NSDictionary *dic in model.CategoryCollection) {
            CategoryCollectionModel *model = [CategoryCollectionModel mj_objectWithKeyValues:dic];
            [array addObject:model];
        }
        
        if (array.count)
        {
            [self.rightArray addObject:modelmodel];
            [self.threeArray addObject:array];
        }
        [self.collectionView reloadData];
        
        //如果请求的次数少于组数，进行请求
        if (self.requestNum <  self.requestThreeArray.count){
            [self initThreeData:self.requestThreeArray[self.requestNum]];
        }
        
    } successBackfailError:^(id responseObject) {

    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 右边第一组常用
-(void)initCommonDataWithGuid:(TopLayerCollectionModel *)model {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCommonUsageCategoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetCommonUsageCategoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"ParentCategoryGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.topCategoryCollectionModel = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
        
        NSMutableArray *commonArray = [[NSMutableArray alloc]init];
        for(NSDictionary *dic in self.topCategoryCollectionModel.CommonUsageCategoryCollection) {
            CategoryCollectionModel *model = [CategoryCollectionModel mj_objectWithKeyValues:dic];
            [commonArray addObject:model];
        }
        [self.rightFirstArray addObject:commonArray];
        
        [self initHotDataWithGuid:model];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - 右边第一组热门
-(void)initHotDataWithGuid:(TopLayerCollectionModel *)model {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetHotUsageCategoryCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetHotUsageCategoryCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:model.Guid forKey:@"ParentCategoryGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        self.topCategoryCollectionModel = [TopCategoryCollectionModel mj_objectWithKeyValues:responseObject];
        
        NSMutableArray *hotArray = [[NSMutableArray alloc]init];
        for(NSDictionary *dic in self.topCategoryCollectionModel.HotUsageCategoryCollection) {
            CategoryCollectionModel *model = [CategoryCollectionModel mj_objectWithKeyValues:dic];
            [hotArray addObject:model];
        }
        [self.rightFirstArray addObject:hotArray];
        [self.collectionView reloadData];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)initNav {
    
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"zaixiankefu"] style:UIBarButtonItemStylePlain target:self action:@selector(LeftClick)];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xiaoxi"] style:UIBarButtonItemStylePlain target:self action:@selector(RightClick)];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.navigationItem.rightBarButtonItem = rightBar;
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"zaixiankefu" target:self action:@selector(LeftClick)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"xiaoxi" target:self action:@selector(RightClick)];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, ScreenWidth - 80, 40);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 4;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:1];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    searchBar.placeholder = @"搜索商品 分类 功效 用户";
    [titleView addSubview:searchBar];
    
//    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = searchBar;
    
    UIView *searchTextField = nil;
    searchBar.barTintColor = [UIColor whiteColor];
    searchTextField = [[[searchBar.subviews firstObject] subviews] lastObject];
    searchTextField.backgroundColor = HEXCOLOR(0xeeeeee);
}

-(void)initCollectionView {
    
    
    CGFloat ItemWidth = (ScreenWidth-TABLEVIEW_W-28*UIRate)/3.0;
    CGFloat ItemHeight = ItemWidth + 30*UIRate;
    UICollectionViewFlowLayout * aLayOut = [[UICollectionViewFlowLayout alloc]init];
    aLayOut.itemSize = CGSizeMake(ItemWidth, ItemHeight);
    aLayOut.minimumLineSpacing = 10*UIRate*UIRate;
    aLayOut.minimumInteritemSpacing = 6*UIRate;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:aLayOut];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.contentInset = UIEdgeInsetsMake(120, 0, 0, 0);
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(self.tableView,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,50);
    
    [collectionView registerClass:[ClassCollectionCell class] forCellWithReuseIdentifier:collectionID];
    [collectionView registerClass:[ClassCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID];
    
    [self initHeadView];
}

-(void)initHeadView {
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, -120, ScreenWidth - 100 - 20 , 120)];
    [self.collectionView addSubview:headImage];
    self.headImageView = headImage;
}


-(void)initTableView {
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,50).widthIs(TABLEVIEW_W);
    
}

-(void)LeftClick {
    [LCProgressHUD showMessage:@"尚未开通"];
}

-(void)RightClick {
    [LCProgressHUD showMessage:@"尚未开通"];
}


#pragma mark - tableView 代理和数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leftArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassificationMainCell *cell = [ClassificationMainCell cellWithTableview:tableView];
    cell.model = self.leftArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectNum = indexPath.row;
    
    TopLayerCollectionModel *model = self.leftArray[indexPath.row];
    
    if(self.selectNum == 0) {
        [self.rightFirstArray removeAllObjects];
        [self requestSuggestionCategoryPictureResult];
        [self initCommonDataWithGuid:model];
    }else {
        self.headImageView.image = nil;
        [self initrightDataWithGuid:model];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - collectionView 代理和数据源
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if(self.selectNum == 0) {
        return self.rightFirstArray.count;
    }
    return self.threeArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.selectNum == 0) {
        NSArray *array = self.rightFirstArray[section];
        return array.count;
    }
    NSArray *array = self.threeArray[section];
    return array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.selectNum == 0) {
      ClassCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
      cell.model = self.rightFirstArray[indexPath.section][indexPath.row];
      return cell;
    }
    ClassCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    cell.model = self.threeArray[indexPath.section][indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"-----%ld-------%ld", (long)indexPath.section, (long)indexPath.row);
    
    if(self.selectNum == 0) {
        CategoryCollectionModel *model = self.rightFirstArray[indexPath.section][indexPath.row];
        ProductListVC *listVC = [[ProductListVC alloc]init];
        listVC.CategoryGuid = model.ParentGuid;
        listVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
        
        return;
    }
    CategoryCollectionModel *model = self.threeArray[indexPath.section][indexPath.row];
    ProductListVC *listVC = [[ProductListVC alloc]init];
    listVC.CategoryGuid = model.Guid;
    listVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:listVC animated:YES];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if(self.selectNum == 0) {
        ClassCollectionHeaderView *HeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID forIndexPath:indexPath];
        if(indexPath.section == 0) {
          HeaderView.nameLabel.text = @"常用分类";
        }else {
          HeaderView.nameLabel.text = @"热门分类";
        }
        return HeaderView;
    }
    CategoryCollectionModel *model = self.rightArray[indexPath.section];
    ClassCollectionHeaderView *HeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID forIndexPath:indexPath];
    HeaderView.nameLabel.text = model.Name;
    return HeaderView;
}

// 头部大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(ScreenWidth, 35);
}

//// cell大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat flowLayoutW = (ScreenWidth-TABLEVIEW_W-30-2)/3.0;
//    return CGSizeMake(flowLayoutW, flowLayoutW+30);
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 7*UIRate, 0, 7*UIRate);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ================= UISearchBarDelegate =================
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    CommoditySearchVC *vc = [[CommoditySearchVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    return NO;
}

@end
