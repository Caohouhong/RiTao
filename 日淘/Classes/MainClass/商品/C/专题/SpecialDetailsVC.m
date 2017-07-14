//
//  SpecialDetailsVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsVC.h"
#import "SpecialDetailsCell.h"
#import "CollectionHeaderView.h"
#import "CollectionViewFlowLayout.h"
#import "SpecialDetailsHeadCell.h"
#import "ModelMainTopicDetail.h"
#import "ModelTopicProductCollection.h"
#import "ModelTopicLabelList.h"
#import "ModelTopicDetail.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "SpecialDetailsTopCell.h"
#import "ProductDetailsVC.h"

@interface SpecialDetailsVC ()<UICollectionViewDelegate,UICollectionViewDataSource,SelectButtonTagDelegate,UIScrollViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIView *recommendView;
@property (nonatomic, weak) UIButton *nameBtn;
@property (nonatomic, strong) NSMutableArray *cellsArray;
@property (nonatomic, strong) NSMutableArray *ListArray;
@property (nonatomic, strong) ModelMainTopicDetail *Mainmodel;
@end

@implementation SpecialDetailsVC

static NSString *const collectiontopID = @"SpecialDetailsTopCell";
static NSString *const collectionID = @"SpecialDetailsCell";
static NSString *const headerViewID = @"SpecialDetailsHeadCell";
static NSString *const collectionHeaderID = @"CollectionHeaderView";

-(NSMutableArray *)cellsArray {
    if(!_cellsArray) {
        _cellsArray = [[NSMutableArray alloc]init];
    }
    return _cellsArray;
}

-(NSMutableArray *)ListArray {
    if(!_ListArray) {
        _ListArray = [[NSMutableArray alloc]init];
    }
    return _ListArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    self.title = @"活动详情页";
    [self initCollectionView];
    [self initData];
    [self initNav];
}

-(void)initNav {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"xinxi" target:self action:@selector(shareClick)];
}

-(void)initCollectionView {
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    [collectionView registerClass:[SpecialDetailsCell class] forCellWithReuseIdentifier:collectionID];
    [collectionView registerClass:[SpecialDetailsTopCell class] forCellWithReuseIdentifier:collectiontopID];

    [collectionView registerClass:[SpecialDetailsHeadCell class] forCellWithReuseIdentifier:headerViewID];
    
     [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [collectionView registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderID];
}

-(void)upDataCells {
    
    self.cellsArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *arr_1 = [[NSMutableArray alloc]init];
    [arr_1 addObject:@{kCell:@"SpecialDetailsTopCell",@"kSection":@(0),@"kRow":@(0)}];
    [self.cellsArray addObject:arr_1];
    
    NSMutableArray *arr_2 = [[NSMutableArray alloc]init];
    
    int i = 0;
    int j = 0;
    for(NSString *title in self.Mainmodel.TopicDetail.TopicLabelList)
    {
        [arr_2 addObject:@{kCell:@"SpecialDetailsHeadCell", kTitle:title,@"kSection":@(i),@"kRow":@(j)}];
        j ++;
        for(ModelTopicProductCollection *model in self.ListArray)
        {
             if([model.Label isEqualToString:title])
             {
                 [arr_2 addObject:@{kCell:@"SpecialDetailsCell", kValue:model,@"kSection":@(i),@"kRow":@(j)}];
                 j ++;
             }
        }
        
        i ++;
    }
    [self.cellsArray addObject:arr_2];
    [self.collectionView reloadData];
}


-(void)initData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.guid forKey:@"TopicGuid"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopicProductCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetTopicProductCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.Mainmodel = [ModelMainTopicDetail mj_objectWithKeyValues:responseObject];
        
        for(NSDictionary *dic in self.Mainmodel.TopicDetail.TopicProductCollection) {
            ModelTopicProductCollection *modelmodel = [ModelTopicProductCollection mj_objectWithKeyValues:dic];
            [self.ListArray addObject:modelmodel];
        }
        
        [self upDataCells];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)shareClick {
   [LCProgressHUD showMessage:@"分享尚未开通"];
}

#pragma mark - 设置第一组组头为头部 里头的按钮点击事件
-(void)clickButtonWithTag:(NSInteger)tag {
    self.collectionView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < tag; i++) {
       NSString *str = self.Mainmodel.TopicDetail.TopicLabelList[i];
        for(ModelTopicProductCollection *model in self.ListArray)  {
            if([model.Label isEqualToString:str]) {
                [array addObject:model];
            }
        }
    }
    NSLog(@"----数组里有---%ld",array.count);
    if(tag == 0) {
        [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
    }else {
        [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:tag+array.count inSection:1] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
    }
}


#pragma mark - collectionView 代理和数据源
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.cellsArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *array = self.cellsArray[section];
    return array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if([dic[kCell] isEqualToString:@"SpecialDetailsTopCell"]) {
        SpecialDetailsTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectiontopID forIndexPath:indexPath];
        cell.urlStr = self.Mainmodel.TopicDetail.Picture;
        return cell;
    }

    if([dic[kCell] isEqualToString:@"SpecialDetailsHeadCell"]) {
        SpecialDetailsHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:headerViewID forIndexPath:indexPath];
        cell.nameLabel.text = dic[kTitle];
        return cell;
    }
    if([dic[kCell] isEqualToString:@"SpecialDetailsCell"]) {
        SpecialDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
        cell.model = dic[kValue];
        return cell;
    }

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if([dic[kCell]isEqualToString:@"SpecialDetailsCell"]) {
        
        ModelTopicProductCollection *model = dic[kValue];
        ProductDetailsVC *VC = [[ProductDetailsVC alloc]init];
        VC.guid = model.Guid;
        [self.navigationController pushViewController:VC animated:YES];
    }
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section >0 ) {
        CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderID forIndexPath:indexPath];
        headerView.dataArray = self.Mainmodel.TopicDetail.TopicLabelList;
        headerView.ButtonDelegate = self;
        return headerView;
    }
    CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderID forIndexPath:indexPath];;
    return headerView;
}

// cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat flowLayoutW = (ScreenWidth-15)/2;
    CGFloat flowLayoutW2 = ScreenWidth-20;
    NSMutableArray *array = self.cellsArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if([dic[kCell]isEqualToString:@"SpecialDetailsTopCell"]) {
        return CGSizeMake(ScreenWidth, HEADERVIEWW);;
    }
    if([dic[kCell]isEqualToString:@"SpecialDetailsHeadCell"]) {
        return CGSizeMake(flowLayoutW2, 30);
    }
    if([dic[kCell]isEqualToString:@"SpecialDetailsCell"]) {
        return CGSizeMake(flowLayoutW, flowLayoutW+SizeScale(60));
    }
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return CGSizeMake(ScreenWidth, 0.01);
    }
    return CGSizeMake(ScreenWidth, 35);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    NSArray *indexArr = [_collectionView indexPathsForVisibleItems];
    
    NSIndexPath *index = nil;
    for (int i = 0; i < indexArr.count; i ++)
    {
        if (index == nil)
        {
            index = indexArr[i];
        }
        else
        {
            NSIndexPath *indexxx = indexArr[i];
            if (index.section > indexxx.section)
            {
                index = indexArr[i];
            }
            else if (index.row > indexxx.row)
            {
                index = indexArr[i];
            }
        }
    }
    
    if (index.section == 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AAA" object:@(0)];
        
        return;
    }
    
    NSMutableArray *array = [self.cellsArray lastObject];
    for (NSDictionary *dic in array)
    {
        int sec = [dic[@"kSection"] intValue];
        int row = [dic[@"kRow"] intValue];
        
        if (index.section == 1 && index.row == row)
        {
            NSLog(@"=====>%d",sec);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AAA" object:@(sec)];
        }
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

@end
