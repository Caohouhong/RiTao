//
//  ModelMainProductList.h
//  日淘
//
//  Created by 唐硕 on 17/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "BaseModel.h"

@interface ModelMainProductList : BaseModel


@property (nonatomic, strong) NSArray *MasterSaleProductCollection;  //数据
@property (nonatomic, strong) NSArray *CategoryCollection; //分类
@property (nonatomic, strong) NSArray *BrandCollection; //品牌


@end
