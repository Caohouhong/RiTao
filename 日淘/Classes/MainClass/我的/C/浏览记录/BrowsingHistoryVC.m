//
//  BrowsingHistoryVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BrowsingHistoryVC.h"
#import "NormalCollectionCell.h"
#import "SpecialDetailsHeaderView.h"
#import "SpecialDetailsCell.h"

#import "ModelMainProductList.h"
#import "ModelMasterSaleProductCollection.h"

static NSString *const normalCollectionCell = @"NormalCollectionCell";
static NSString *const headerViewID = @"SpecialDetailsHeaderView";
static NSString *const collectionID = @"SpecialDetailsCell";
@interface BrowsingHistoryVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) int StartIndex;
@end

@implementation BrowsingHistoryVC

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"浏览记录";
    
    self.StartIndex = 0;
    [self requestGetMasterSaleProductCollectionForHistoryAction];
    [self initNav];
    [self initView];

}

- (void)requestClearMemberBrowsingHistoryResult
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.ClearMemberBrowsingHistoryResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.ClearMemberBrowsingHistoryAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"清空成功"];
        
        self.dataArray = [NSMutableArray array];
        [self.collectionView reloadData];
        
        self.collectionView.hidden = YES;
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)requestGetMasterSaleProductCollectionForHistoryAction {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MasterSaleProductCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMasterSaleProductCollectionForHistoryAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@(self.StartIndex) forKey:@"StartIndex"];
    [params setValue:@"10" forKey:@"Count"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        if(self.StartIndex == 0) {
            self.dataArray = [[NSMutableArray alloc]init];
        }
        
        ModelMainProductList *model = [ModelMainProductList mj_objectWithKeyValues:responseObject];
        for(NSDictionary *dic in model.MasterSaleProductCollection) {
            ModelMasterSaleProductCollection *mo = [ModelMasterSaleProductCollection mj_objectWithKeyValues:dic];
            [self.dataArray addObject:mo];
        }
        
        self.collectionView.hidden = NO;
        
        if (self.dataArray.count == 0)
        {
            self.collectionView.hidden = YES;
            
            [UIAlertView showAlertViewWithTitle:@"提示" message:@"亲，还没有浏览商品记录哦" cancelButtonTitle:@"确定" otherButtonTitles:@[] onDismiss:^(int buttonIndex) {
            } onCancel:^{
                
            }];
        }
        
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } successBackfailError:^(id responseObject) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        
        self.collectionView.hidden = NO;
        
        if (self.dataArray.count == 0)
        {
            self.collectionView.hidden = YES;
        }
    } failure:^(NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        
        self.collectionView.hidden = NO;
        
        if (self.dataArray.count == 0)
        {
            self.collectionView.hidden = YES;
        }
    }];
    
}

-(void)headerRefersh {
    self.StartIndex = 0;
    [self requestGetMasterSaleProductCollectionForHistoryAction];
}

-(void)footerRefersh {
    self.StartIndex ++;
    [self requestGetMasterSaleProductCollectionForHistoryAction];
}

-(void)initNav {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"清空" target:self action:@selector(add)];
}

-(void)initView
{
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = HEXCOLOR(0x999999);
    tipLabel.text = @"您还没有浏览任何商品";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tipLabel];
    
    tipLabel.sd_layout
    .leftSpaceToView(self.view ,0)
    .topSpaceToView(self.view ,0)
    .rightSpaceToView(self.view ,0)
    .heightIs(150);
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = HEXCOLOR(0xeeeeee);
    //collectionView.scrollEnabled = NO;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(self.view ,0)
    .topSpaceToView(self.view ,0)
    .rightSpaceToView(self.view ,0)
    .bottomSpaceToView(self.view ,0);
    
    [collectionView registerClass:[NormalCollectionCell class] forCellWithReuseIdentifier:normalCollectionCell];
    [collectionView registerClass:[SpecialDetailsHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewID];
    [collectionView registerClass:[SpecialDetailsCell class] forCellWithReuseIdentifier:collectionID];

    collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefersh)];
    collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefersh)];
    
}

-(void)add
{
    __weak typeof(self) weakSelf = self;
    [UIAlertView showAlertViewWithTitle:@"清空浏览记录？" message:@"" cancelButtonTitle:@"不清空" otherButtonTitles:@[@"清空"] onDismiss:^(int buttonIndex) {
        [weakSelf requestClearMemberBrowsingHistoryResult];
    } onCancel:^{
        
    }];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
