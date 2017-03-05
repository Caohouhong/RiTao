//
//  MianQuickEntryCell.m
//  日淘
//
//  Created by liqiang on 2016/12/1.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MianQuickEntryCell.h"
#import "ChildQuickEntryView.h"
#import "ModelTopicCollection.h"

@interface MianQuickEntryCell ()

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation MianQuickEntryCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;

        [self drawView];
    }
    
    return self;
}

+ (MianQuickEntryCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"MianQuickEntryCell";
    MianQuickEntryCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MianQuickEntryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    for (int i = 0; i < self.dataArray.count; i ++)
    {
        ModelTopicCollection *model = self.dataArray[i];
        
        ChildQuickEntryView *quickEntryView1 = [[ChildQuickEntryView alloc] init];
        quickEntryView1.model = model;
        [self.contentView addSubview:quickEntryView1];
        
        CGFloat itemW = ScreenWidth/4;
        CGFloat itemH = 100;
        int columnIndex = i % 4;
        long rowIndex = i / 4;
        
        quickEntryView1.frame = CGRectMake(columnIndex * itemW, rowIndex * itemH, itemW, itemH);
    }
}

@end
