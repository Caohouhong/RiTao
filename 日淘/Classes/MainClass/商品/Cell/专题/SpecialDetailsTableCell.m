//
//  SpecialDetailsTableCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsTableCell.h"
#import "SpecialDetailsCell.h"
#import "CollectionHeaderView.h"
#import "CollectionViewFlowLayout.h"
#import "SpecialDetailsHeadCell.h"

@interface SpecialDetailsTableCell()
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation SpecialDetailsTableCell

static NSString *const collectionID = @"SpecialDetailsCell";
static NSString *const headerViewID = @"SpecialDetailsHeadCell";
static NSString *const collectionHeaderID = @"CollectionHeaderView";

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"SpecialDetailsTableCell";
    SpecialDetailsTableCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[SpecialDetailsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = HEXCOLOR(0xeeeeee);
    collectionView.scrollEnabled = NO;
    [self.contentView addSubview:collectionView];
    self.collectionView = collectionView;
    
    collectionView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .topSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0);
    
    [collectionView registerClass:[SpecialDetailsCell class] forCellWithReuseIdentifier:collectionID];
    [collectionView registerClass:[SpecialDetailsHeadCell class] forCellWithReuseIdentifier:headerViewID];
    [collectionView registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderID];
}

#pragma mark - collectionView 代理和数据源
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSDictionary *dic = self.cellsArray[indexPath.row];
    //
    //    if([dic[kCell]isEqualToString:@"SpecialDetailsHeadCell"]) {
    //        SpecialDetailsHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:headerViewID forIndexPath:indexPath];
    //        cell.backgroundColor = [UIColor orangeColor];
    //        cell.nameLabel.text = dic[kTitle];
    //        return cell;
    //    }
    //    if([dic[kCell]isEqualToString:@"SpecialDetailsCell"]) {
    SpecialDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    //        cell.model = dic[kValue];
    return cell;
    //    }
    
    return [UICollectionViewCell new];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderID forIndexPath:indexPath];
//    headerView.dataArray = self.Mainmodel.TopicDetail.TopicLabelList;
//    headerView.ButtonDelegate = self;
    return headerView;
}

// cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat flowLayoutW = (ScreenWidth-30)/2;
    //    CGFloat flowLayoutW2 = ScreenWidth-20;
    //    NSDictionary *dic = self.cellsArray[indexPath.row];
    //
    //    if([dic[kCell]isEqualToString:@"SpecialDetailsHeadCell"]) {
    //        return CGSizeMake(flowLayoutW2, 35);
    //    }
    //    if([dic[kCell]isEqualToString:@"SpecialDetailsCell"]) {
    return CGSizeMake(flowLayoutW, flowLayoutW+60);
    //    }
    //    return CGSizeMake(0, 0);
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



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
