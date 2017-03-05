//
//  MainVC.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainVC.h"
#import "NinaPagerView.h"
#import "MianChildModuleVC.h"
#import "AFNetworking.h"
#import "ModelTopLayerCollectionResult.h"
#import "ModelTopLayerCollection.h"
#import "CommoditySearchVC.h"

@interface MainVC ()<NinaPagerViewDelegate,UISearchBarDelegate>

@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@property (nonatomic, strong) ModelTopLayerCollectionResult *modelTopLayerCollectionResult;

@property (nonatomic, strong) NSMutableArray *VCArray;
@property (nonatomic, strong) NSMutableArray *modelTopLayerCollectionArray;
@property (nonatomic, strong) NSMutableArray *childModuleTitileArray;

@end

@implementation MainVC


- (NSMutableArray *)VCArray
{
    if (!_VCArray) {
        _VCArray = [NSMutableArray array];
    }
    
    return _VCArray;
}

- (NSMutableArray *)modelTopLayerCollectionArray
{
    if (!_modelTopLayerCollectionArray) {
        _modelTopLayerCollectionArray = [NSMutableArray array];
    }
    return _modelTopLayerCollectionArray;
}

- (NSMutableArray *)childModuleTitileArray
{
    if (!_childModuleTitileArray)
    {
        _childModuleTitileArray = [NSMutableArray array];
    }
    return _childModuleTitileArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawNav];
    [self drawView];
    [self requestChildModuleTitile];
}

- (void)drawNav
{
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"zaixiankefu"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftBar)];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xiaoxi"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightBar)];
    self.navigationItem.leftBarButtonItem = leftBar;
    self.navigationItem.rightBarButtonItem = rightBar;
    
    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 80, 40)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
//    [titleView setBackgroundColor:color];
//    self.navigationItem.titleView = titleView;
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0, 0, ScreenWidth - 80, 40);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 4;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:1];
    searchBar.delegate = self;
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    searchBar.placeholder = @"搜索商品 品类";
//    [titleView addSubview:searchBar];
    self.navigationItem.titleView = searchBar;
    
//    [self.navigationItem.titleView sizeToFit];
    
    UIView *searchTextField = nil;
    searchBar.barTintColor = [UIColor whiteColor];
    searchTextField = [[[searchBar.subviews firstObject] subviews] lastObject];
    searchTextField.backgroundColor = HEXCOLOR(0xeeeeee);
    
}

- (void)drawView
{
    NSMutableArray *titleArray = [NSMutableArray array];
    
    for (ModelTopLayerCollection *model in self.modelTopLayerCollectionArray)
    {
        [titleArray addObject:model.Name];
        
        MianChildModuleVC *vc = [[MianChildModuleVC alloc] init];
        vc.TopLayerGuid = model.Guid;
        [self.VCArray addObject:vc];
    }
    
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49 - 64 ) WithTitles:titleArray WithVCs:self.VCArray];
    ninaPagerView.delegate = self;
    ninaPagerView.titleFont = 12;
    ninaPagerView.selectTitleColor = ninaPagerView.sliderBlockColor;
    [self.view addSubview:ninaPagerView];
    
}

- (void)didClickLeftBar
{
    
}

- (void)didClickRightBar
{
    
}

#pragma mark -
#pragma mark ================= UISearchBarDelegate =================
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    CommoditySearchVC *vc = [[CommoditySearchVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    return NO;
}

#pragma mark -
#pragma mark ================= 网络 =================
/**
 获取子模块标题
 */
- (void)requestChildModuleTitile
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopLayerCollectionForFrontResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopLayerCollectionForFrontAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.modelTopLayerCollectionResult = [ModelTopLayerCollectionResult mj_objectWithKeyValues:responseObject];
        
        self.modelTopLayerCollectionArray = [NSMutableArray array];
        for (NSDictionary *dic  in self.modelTopLayerCollectionResult.TopLayerCollection)
        {
            ModelTopLayerCollection *model = [ModelTopLayerCollection mj_objectWithKeyValues:dic];
            [self.modelTopLayerCollectionArray addObject:model];
        }
        
        [self drawView];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark -
#pragma mark ================= NinaPagerViewDelegate =================
- (void)ninaCurrentPageIndex:(NSString *)currentPage
{
    NSLog(@"%@",currentPage);
}

@end
