//
//  TSExtensions.h
//  大苏精密
//
//  Created by 唐硕 on 16/7/29.
//  Copyright © 2016年 唐硕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/**
 * 按钮  title-文字 color-背景颜色 titleColor-文字颜色 font-文字大小
 */
@interface UIButton (Extension)

+(UIButton *)createButtonWithTitle:(NSString *)title backgroupColor:(UIColor *)color titleColor:(UIColor *)titleColor font:(CGFloat)font target:(id)targe action:(SEL)action;

+(UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font target:(id)targe action:(SEL)action;


- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title;
@end

/**
 *标签  text-文字  textColor-文字颜色 font-文字大小
 */
@interface UILabel (Extension)

+(UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font;

+(UILabel *)createLabelWithText:(NSString *)text font:(CGFloat)font;

@end

/**
 *图片  image-图片 
 */
@interface UIImageView (Extension)

+(UIImageView *)createImageViewWithImage:(NSString *)image;

@end


@interface UITableView (Extension)

+(UITableView *)createTableViewWithFrame:(CGRect)rect style:(UITableViewStyle)Style delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSourse;

@end


@interface UITextField (Extension)

+(UITextField *)createTextFieldWithplaceholder:(NSString *)placeholder font:(CGFloat)font;

@end

