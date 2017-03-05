//
//  SpecialDetailsTableCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialDetailsTableCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end
