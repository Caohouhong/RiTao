//
//  CollectionHeaderView.m
//  日淘
//
//  Created by 唐硕 on 16/12/15.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "CollectionHeaderView.h"
#import "SDCycleScrollView.h"


@interface CollectionHeaderView()<SDCycleScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@end
@implementation CollectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aaaaaa:) name:@"AAA" object:nil];
        [self initView];
    }
    return self;
}

-(void)initView {
}

-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    CGFloat titleLabelW = ScreenWidth/5;
    for(int i = 0; i< dataArray.count; i++) {
        UIButton *nameBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*titleLabelW, 10, titleLabelW, 20)];
        nameBtn.tag = 10+i;
        nameBtn.titleLabel.font = TFont(12.5);
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [nameBtn setTitle:dataArray[i] forState:UIControlStateNormal];
        [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nameBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [nameBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:nameBtn];
        
        if(i == 0) {
            nameBtn.selected = YES;
            self.nameBtn = nameBtn;
        }
    }
    
    scrollView.contentSize = CGSizeMake(titleLabelW * dataArray.count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    
}

- (void)aaaaaa:(NSNotification *)not
{
    int tag = [not.object intValue];
    
    self.nameBtn.selected = NO;
    UIButton *btn = [self.scrollView viewWithTag:tag+10];
    btn.selected = YES;
    self.nameBtn = btn;
    
}

-(void)clickBtn:(UIButton *)btn {
    
    self.nameBtn.selected = NO;
    btn.selected = YES;
    self.nameBtn = btn;
    
    if([self.ButtonDelegate respondsToSelector:@selector(clickButtonWithTag:)]) {
        [self.ButtonDelegate clickButtonWithTag:btn.tag -10];
    }
    
    
//    NSInteger section = btn.tag - 10;
//    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
}



@end
