//
//  TopCategoryCollectionModel.h
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BaseModel.h"

@interface TopCategoryCollectionModel : BaseModel

@property (nonatomic, strong) NSArray *TopCategoryCollection; //左侧
@property (nonatomic, strong) NSArray *CategoryCollection;  //右侧
@property (nonatomic, strong) NSArray *CommonUsageCategoryCollection; //第一个 上面
@property (nonatomic, strong) NSArray *HotUsageCategoryCollection; //第一个 下面

@property (nonatomic, copy) NSString *MainCategoryPicture; //头部图片

@end
