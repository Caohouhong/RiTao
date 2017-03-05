//
//  ProductDetailImageCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailImageCell.h"
#import "SDCycleScrollView.h"
#import "ModelProductDetail.h"

@interface ProductDetailImageCell ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ProductDetailImageCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailImageCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"ProductDetailImageCell";
    ProductDetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    NSMutableArray *imageUrlArray = [NSMutableArray array];
    for (ModelSaleProductPictureCollection *model in self.dataArray)
    {
        [imageUrlArray addObject:IMAGEURLSTR(model.Picture)];
    }

    SDCycleScrollView *adv = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)  delegate:self placeholderImage:nil];
    adv.autoScroll = NO;
    adv.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    adv.imageURLStringsGroup = imageUrlArray;
    [self addSubview:adv];
}

@end
