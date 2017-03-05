//
//  NewViewController.m
//  日淘
//
//  Created by 唐硕 on 16/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "NewViewController.h"
#import "LQAppFrameTabBarController.h"

@interface NewViewController ()<UIScrollViewDelegate>
@property(nonatomic, weak) UIPageControl *pagecontrol;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     [self setupScrollView];
    //圆点
    [self setupPageControl];

}

-(void)setupScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    NSArray *imageArray = @[@"app启动页（4张图）",@"app启动页（4张图）2"];
    
    for(int i = 0; i < 2; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight);
        [scrollView addSubview:imageView];
        
        if(i == 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    scrollView.contentSize = CGSizeMake(ScreenWidth*imageArray.count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

//最后一个图片添加按钮
- (void)setupLastImageView:(UIImageView *)imageView {
    //可点击
    imageView.userInteractionEnabled = YES;
    
    UIButton *btn = [[UIButton alloc]init];
    //btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 5.0;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 1.0;
    [btn setTitle:@"立即体验" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:btn];
    
    btn.sd_layout
    .bottomSpaceToView(imageView,65)
    .centerXEqualToView(imageView)
    .widthIs(90).heightIs(50);
}

-(void)start {
    self.view.window.rootViewController = [LQAppFrameTabBarController sharedMainTabBar];
}

-(void)setupPageControl
{
    //创建page
    UIPageControl *pagecontrol = [[UIPageControl alloc]init];
    pagecontrol.numberOfPages = 2;
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height - 30;
    pagecontrol.center = CGPointMake(centerX, centerY);
    pagecontrol.bounds = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:pagecontrol];
    
    self.pagecontrol = pagecontrol;
    
    //设置圆点颜色
    pagecontrol.currentPageIndicatorTintColor = [UIColor orangeColor];
    pagecontrol.pageIndicatorTintColor = [UIColor whiteColor];
}

// 代理  滚动就调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //取出水平方向上滚动的距离
    CGFloat offX = scrollView.contentOffset.x;
    
    //求出页码
    double pageDouble = offX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pagecontrol.currentPage = pageInt;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
