//
//  TSExtensions.m
//  大苏精密
//
//  Created by 唐硕 on 16/7/29.
//  Copyright © 2016年 唐硕. All rights reserved.
//


#import "TSExtensions.h"

@implementation UIButton (Extension)

+(UIButton *)createButtonWithTitle:(NSString *)title backgroupColor:(UIColor *)color titleColor:(UIColor *)titleColor font:(CGFloat)font target:(id)targe action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = color;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font target:(id)targe action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    return button;

}


-(void)startWithTime:(NSInteger)timeLine title:(NSString *)title  {
    
    __block NSInteger timeout = timeLine; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.userInteractionEnabled = YES;
                [self setTitle:title forState:UIControlStateNormal];
            });
        }else{
            int seconds = timeout % 60;
            __block NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.userInteractionEnabled = NO;
                [self setTitle:[NSString stringWithFormat:@"%@s后重发",strTime] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);

    
    
}

@end

@implementation UILabel (Extension)

+(UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font  {
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

+(UILabel *)createLabelWithText:(NSString *)text font:(CGFloat)font {
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}


@end

@implementation  UIImageView (Extension)

+(UIImageView *)createImageViewWithImage:(NSString *)image {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:image];
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

@end


@implementation UITableView (Extension)

+(UITableView *)createTableViewWithFrame:(CGRect)rect style:(UITableViewStyle)Style delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSourse {
    
    UITableView *tableView= [[UITableView alloc]initWithFrame:rect style:Style];
    tableView.delegate=delegate;
    tableView.dataSource=dataSourse;
    return tableView;
}

@end


@implementation UITextField (Extension)

+(UITextField *)createTextFieldWithplaceholder:(NSString *)placeholder font:(CGFloat)font {
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.placeholder = placeholder;
    textfield.font = [UIFont systemFontOfSize:font];
    return textfield;
}

@end








