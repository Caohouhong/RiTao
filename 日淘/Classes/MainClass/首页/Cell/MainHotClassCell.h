//
//  MainHotClassCell.h
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainHotClassCellBlock)(NSString *);

@interface MainHotClassCell : UITableViewCell

@property (nonatomic, copy) MainHotClassCellBlock hotClassCell;

+(instancetype)cellWithTableview:(UITableView *)tableview dataArray:(NSMutableArray *)dataArray;
@end
