//
//  ModelTopicCollectionResult.h
//  日淘
//
//  Created by liqiang on 2016/12/2.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "BaseModel.h"

@interface ModelTopicCollectionResult : BaseModel

@property (nonatomic, strong) NSArray *TopicCollection;

@property (nonatomic, strong) NSArray *MasterSaleProductCollection; //大家都在买

@property (nonatomic, strong) NSArray *CategoryCollection; //热门分类

@end
