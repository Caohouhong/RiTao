//
//  CommoditySearchVC.m
//  日淘
//
//  Created by 唐硕 on 17/1/6.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "CommoditySearchVC.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "CommoditySearchCell.h"
#import "TTGroupTagView.h"
#import "CommoditySearchHeadView.h"
#import "ProductListVC.h"
#import "ModelProductSearch.h"
#import "ModelSearchResultContent.h"


@interface CommoditySearchVC ()<UITableViewDelegate, UITableViewDataSource,TTGroupTagViewDelegate,UISearchBarDelegate>
/**
 *  用来展示标签列表的
 */
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *recentHeightArray;
@property (nonatomic, strong) NSMutableArray *hotHeightArray;
@property (nonatomic, weak) CommoditySearchCell *cell;

@property (nonatomic, strong) NSString *searchText;

@property (nonatomic, strong) ModelProductSearch *proSearchModel;

@property (nonatomic, strong) NSMutableArray *resentArray;
@property (nonatomic, strong) NSMutableArray *hotArray;
@end

@implementation CommoditySearchVC

- (NSMutableArray *)recentHeightArray {
    if (_recentHeightArray == nil) {
        _recentHeightArray = [NSMutableArray array];
    }
    return _recentHeightArray;
}

- (NSMutableArray *)hotHeightArray
{
    if (_hotHeightArray == nil) {
        _hotHeightArray = [NSMutableArray array];
    }
    return _hotHeightArray;
}

- (NSMutableArray *)resentArray {
    if (_resentArray == nil) {
        _resentArray = [NSMutableArray array];
    }
    return _resentArray;
}

- (NSMutableArray *)hotArray {
    if (_hotArray == nil) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    [self initTableView];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestSearchHistory];
}

-(void)setNav {
    
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-SizeScale(50), 30)];
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    //    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, ScreenWidth-SizeScale(50), 30);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 4;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:1];
    searchBar.delegate = self;
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    searchBar.placeholder = @"搜索商品";
    [titleView addSubview:searchBar];
    
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    
    UIView *searchTextField = nil;
    searchBar.barTintColor = [UIColor whiteColor];
    searchTextField = [[[searchBar.subviews firstObject] subviews] lastObject];
    searchTextField.backgroundColor = HEXCOLOR(0xeeeeee);
    
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(quxiao)];
    self.navigationItem.rightBarButtonItem = itrm;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
}

-(void)quxiao {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initTableView {
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}


#pragma mark -
#pragma mark ================= UISearchBarDelegate =================
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    self.searchText = searchBar.text;
    
    ProductListVC *vc = [[ProductListVC alloc] init];
    //H 测试  搜索有问题(只有面膜有数据)
    vc.SearchContent = searchBar.text;
    [DCURLRouter pushViewController:vc animated:YES];
    
    searchBar.text = @"";
    
    //添加搜索关键字
    [self requestAddSearchWord];
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelSelectedTag)];
    [cell.contentView addGestureRecognizer:tap];
    [cell.contentView addSubview:[self addHistoryViewTagsWithCGRect:CGRectMake(0, 0, ScreenWidth, 44) andIndex:indexPath]];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && self.recentHeightArray.count > 0){
        return [self.recentHeightArray.firstObject floatValue];
    }else if (indexPath.section == 1 && self.hotHeightArray.count > 0)
    {
        return [self.hotHeightArray.firstObject floatValue];
    }else {
        return 0;
    }
}

#pragma mark - 返回组标题
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSArray *array = self.dataArray[section];
    
    CommoditySearchHeadView *headview = [[CommoditySearchHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    
    if(section == 0 && array.count > 0) {
        headview.nameLabel.text = @"最近搜索";
        headview.removeBtn.hidden  = NO;
        [headview.removeBtn addTarget:self action:@selector(removeBtnAction) forControlEvents:UIControlEventTouchUpInside];
        return headview;
    }else if(section == 1 && array.count > 0){
        headview.nameLabel.text = @"热门搜索";
        headview.removeBtn.hidden  = YES;
        return headview;
    }else {
        return [[UIView alloc] init];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    NSArray *array = self.dataArray[section];
    
    if (array.count>0){
         return 40;
    }else {
        return 0.01;
    }
}


#pragma mark - 添加标签列表视图
- (TTGroupTagView *)addHistoryViewTagsWithCGRect:(CGRect)rect andIndex:(NSIndexPath *)indexPath{
    
    TTGroupTagView *tagView = [[TTGroupTagView alloc] initWithFrame:rect];
    tagView.tag = indexPath.section + 1000;
    tagView.translatesAutoresizingMaskIntoConstraints = YES;
    tagView.delegate = self;
    tagView.backgroundColor = [UIColor clearColor];
    
    if (self.dataArray.count > 0) {
        [tagView addTags:self.dataArray[indexPath.section] withCornerScale:0.1];
        
        NSArray *array = self.dataArray[indexPath.section];
        
        if (indexPath.section == 0 && array.count > 0){
            [self.recentHeightArray removeAllObjects];
            [self.recentHeightArray addObject:[NSString stringWithFormat:@"%f", tagView.changeHeight]];
        }else if (indexPath.section == 1 && array.count > 0){
            [self.hotHeightArray removeAllObjects];
            [self.hotHeightArray addObject:[NSString stringWithFormat:@"%f", tagView.changeHeight]];
        }
    }

    return tagView;
}

-(void)cancelSelectedTag {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//删除最近搜索
- (void)removeBtnAction{
    
    [self requestClearSearchWord];
}

#pragma mark - TTGroupTagViewDelegate 标签的点击事件
- (void)buttonClick:(NSString *)string and:(BOOL)isDelete
{
    self.searchText = string;
    
    ProductListVC *vc = [[ProductListVC alloc] init];
    vc.SearchContent = string;
    [DCURLRouter pushViewController:vc animated:YES];
    
    //添加搜索关键字
    [self requestAddSearchWord];
}

#pragma mark ======网络========
//请求搜索数据
-(void)requestSearchHistory {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSearchHistoryForMemberResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSearchHistoryForMemberAction" forKey:@"Action"];
    
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [self.resentArray removeAllObjects];
        [self.hotArray removeAllObjects];
        [self.dataArray removeAllObjects];
        
        self.proSearchModel = [ModelProductSearch mj_objectWithKeyValues:responseObject];
        
        for(NSDictionary *dic in self.proSearchModel.SearchHistoryForMember) {
            ModelSearchResultContent *model = [ModelSearchResultContent mj_objectWithKeyValues:dic];
            [self.resentArray addObject:model.Content];
        }
        
        for(NSDictionary *dic in self.proSearchModel.SearchHistorySuggestion) {
            ModelSearchResultContent *model = [ModelSearchResultContent mj_objectWithKeyValues:dic];
            [self.hotArray addObject:model.Content];
        }
        
        [self.dataArray addObjectsFromArray:@[self.resentArray,self.hotArray]];
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

//添加搜索数据
-(void)requestAddSearchWord {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddSearchContentForMemberResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddSearchContentForMemberAction" forKey:@"Action"];
    
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:self.searchText forKey:@"SearchContent"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

//删除搜索数据
-(void)requestClearSearchWord {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.ClearMemberSearchHistoryResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.ClearMemberSearchHistoryAction" forKey:@"Action"];
    
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"删除成功"];
        
        [self.recentHeightArray removeAllObjects];
        
        [self requestSearchHistory];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
