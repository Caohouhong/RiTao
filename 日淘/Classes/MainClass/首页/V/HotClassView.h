//
//  HotClassView.h
//  日淘
//
//  Created by 唐硕 on 17/1/11.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHotCategoryCollection.h"

@protocol HotClassViewDelegate <NSObject>

- (void)clickProductButtonWithProductId:(NSString *)proId;

@end


@interface HotClassView : UIView

@property (nonatomic, weak) id<HotClassViewDelegate> delegate;

@property (nonatomic, strong) ModelHotCategoryCollection *model;

@end
