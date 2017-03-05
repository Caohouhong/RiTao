//
//  EvaluationTwoCell.h
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HaveChoosePhotoBlock)(NSArray *array);
typedef void(^TextViewShouldEndEditingBlock)(NSString *text);

@interface EvaluationTwoCell : UITableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview;

@property (nonatomic, copy) HaveChoosePhotoBlock haveChoosePhotoBlock;
@property (nonatomic, copy) TextViewShouldEndEditingBlock textViewShouldEndEditingBlock;


@end
