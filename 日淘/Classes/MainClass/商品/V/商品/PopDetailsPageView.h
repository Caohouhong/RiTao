//
//  PopDetailsPageView.h
//  日淘
//
//  Created by 唐硕 on 16/12/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

typedef void(^DidChooseGuiGeBlock)(int index);
typedef void(^clickremoveBtn)();
typedef void(^DidAddShopCarSuccess)();

@interface PopDetailsPageView : UIView

+ (instancetype)shareInstance;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) int chooseIndex;

@property (nonatomic, copy) DidChooseGuiGeBlock didChooseGuiGeBlock;
@property (nonatomic, copy) clickremoveBtn removeBlock;
@property (nonatomic, copy) DidAddShopCarSuccess didAddShopCarSuccess;


@end
