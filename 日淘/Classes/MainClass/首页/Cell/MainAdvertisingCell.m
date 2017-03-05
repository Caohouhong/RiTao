//
//  MainAdvertisingCell.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainAdvertisingCell.h"
#import "SDCycleScrollView.h"
#import "ModelTopicCollection.h"

@interface MainAdvertisingCell ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation MainAdvertisingCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;
        
        [self drawView];
    }
    
    return self;
}

+ (MainAdvertisingCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"MainAdvertisingCell";
    MainAdvertisingCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MainAdvertisingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    NSMutableArray *imageUrlArray = [NSMutableArray array];
    
    for (ModelTopicCollection *model in self.dataArray)
    {
        [imageUrlArray addObject:IMAGEURLSTR(model.DisplayPicture)];
    }
    
    SDCycleScrollView *adv = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth *9/16)  delegate:self placeholderImage:nil];
    adv.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    adv.imageURLStringsGroup = imageUrlArray;
    [self addSubview:adv];
}

@end
