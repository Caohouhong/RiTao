//
//  CollectionHeaderView.h
//  日淘
//
//  Created by 唐硕 on 16/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectButtonTagDelegate <NSObject>
@optional
-(void)clickButtonWithTag:(NSInteger)tag;
@end

@interface CollectionHeaderView : UICollectionReusableView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, weak) UIButton *nameBtn;

@property (nonatomic, strong) id <SelectButtonTagDelegate>ButtonDelegate;

@end
