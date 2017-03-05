//
//  ProductDetailHaveChooseCell.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

//  已选

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

typedef void(^DidChooseGuiGeBlock)(int index);

@interface ProductDetailHaveChooseCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) int chooseIndex;

@property (nonatomic, copy) DidChooseGuiGeBlock didChooseGuiGeBlock;

+ (ProductDetailHaveChooseCell *)cellWithTableView:(UITableView *)tableView;

@end
