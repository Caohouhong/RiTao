//
//  MainHotClassCell.m
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "MainHotClassCell.h"
#import "HotClassView.h"
#import "ModelHotCategoryCollection.h"

@interface MainHotClassCell ()<HotClassViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MainHotClassCell

+(instancetype)cellWithTableview:(UITableView *)tableview dataArray:(NSMutableArray *)dataArray{
    static NSString *idenifier = @"MainHotClassCell";
    MainHotClassCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[MainHotClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:dataArray{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.dataArray = dataArray;
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:topView];
    
    
    for (int i = 0; i < self.dataArray.count; i ++)
    {
        ModelHotCategoryCollection *model = self.dataArray[i];
        
        HotClassView *hotView = [[HotClassView alloc] init];
        hotView.model = model;
        hotView.delegate = self;
        [self.contentView addSubview:hotView];
        
        CGFloat itemW = (ScreenWidth - 20)/5;
        CGFloat itemH = 85;
        int columnIndex = i % 5;
        long rowIndex = i / 5;
        
        hotView.frame = CGRectMake(10 + columnIndex * itemW, 5 + rowIndex * itemH, itemW, itemH);
    }

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - HotClassViewDelegate
- (void)clickProductButtonWithProductId:(NSString *)proId
{
    if(self.hotClassCell){
        self.hotClassCell(proId);
    }
}


@end
