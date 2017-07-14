//
//  MainMyOrderVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainMyOrderVC.h"
#import "NinaPagerView.h"
#import "MyOrderVC.h"
#import "MyOrderEvaluateVC.h"
#import "PYSearch.h"
#import "SearchOrderVC.h"

@interface MainMyOrderVC ()<NinaPagerViewDelegate,PYSearchViewControllerDelegate,UISearchBarDelegate>
@property (nonatomic, strong) NinaPagerView * ninaPagerView;
@property (nonatomic, strong) NSMutableArray *VCArray;
@property (nonatomic, weak) UILabel *quanLabel;
@property (nonatomic, weak) UILabel *fuLabel;
@property (nonatomic, weak) UILabel *faLabel;
@property (nonatomic, weak) UILabel *shouLabel;
@property (nonatomic, weak) UILabel *pingLabel;
@property (nonatomic, weak) UIView *backView;
@property (nonatomic, weak) UISearchBar *searchBar;
@end

@implementation MainMyOrderVC

-(NSMutableArray *)VCArray {
    if(!_VCArray) {
        _VCArray = [[NSMutableArray alloc]init];
    }
    return _VCArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"SearchIcon" target:self action:@selector(sousuo)];
    
    [self initView];
    [self initLabel];
}

-(void)sousuo {
    
    AppDelegate *app = APPDELEGATE;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    view.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    [app.window addSubview:view];
    self.backView = view;
 
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    [view addSubview:backView];
    
    backView.sd_layout
    .leftSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .topSpaceToView(view,20).heightIs(44);
    
    UIButton *quxiaoBtn = [[UIButton alloc]init];
    quxiaoBtn.titleLabel.font = TFont(12);
    [quxiaoBtn setTitle:@"取消" forState:UIControlStateNormal];
    [quxiaoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quxiaoBtn addTarget:self action:@selector(clickquxiao) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:quxiaoBtn];
    
    quxiaoBtn.sd_layout
    .rightSpaceToView(backView,10)
    .centerYEqualToView(backView)
    .widthIs(30).heightIs(15);
    
    UIView *titleView = [[UIView alloc] init];
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    [searchBar becomeFirstResponder];
    searchBar.delegate = self;
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 4;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:1];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    searchBar.placeholder = @"搜索历史订单";
    [titleView addSubview:searchBar];
    self.searchBar = searchBar;
    
    [backView addSubview:titleView];
    
    UIView *searchTextField = nil;
    searchBar.barTintColor = [UIColor whiteColor];
    searchTextField = [[[searchBar.subviews firstObject] subviews] lastObject];
    searchTextField.backgroundColor = HEXCOLOR(0xeeeeee);
    
    titleView.sd_layout
    .leftSpaceToView(backView,10)
    .rightSpaceToView(quxiaoBtn,10)
    .centerYEqualToView(backView).heightIs(30);
    
    searchBar.sd_layout
    .leftSpaceToView(titleView,0)
    .rightSpaceToView(titleView,0)
    .topSpaceToView(titleView,0)
    .bottomSpaceToView(titleView,0);
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
     NSLog(@"%@", searchBar.text);

    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"sousuo111" object:searchBar.text];
    self.ninaPagerView.ninaDefaultPage = 0;
    [self.backView removeFromSuperview];
    [self initView];
}

-(void)clickquxiao {
    [self.backView removeFromSuperview];
}

-(void)initView {
    
    NSArray *titleArray = @[@"全部", @"待付款", @"待发货", @"待收货", @"待评价"];
    for (int i = 0; i < titleArray.count; i ++) {
        if(i < 4) {
            
            MyOrderVC *orderVC = [[MyOrderVC alloc]init];
            orderVC.guid = [NSString stringWithFormat:@"%d",i+1];
            [self.VCArray addObject:orderVC];
        }else {
            MyOrderEvaluateVC *orderVC = [[MyOrderEvaluateVC alloc]init];
            orderVC.guid = [NSString stringWithFormat:@"%d",i+1];
            [self.VCArray addObject:orderVC];
        }
    }
    
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight2) WithTitles:titleArray WithVCs:self.VCArray];
    ninaPagerView.delegate = self;
    ninaPagerView.titleFont = 12;
    
    ninaPagerView.ninaDefaultPage = self.type;
    
    ninaPagerView.selectTitleColor = [UIColor redColor];
    [self.view addSubview:ninaPagerView];
    self.ninaPagerView = ninaPagerView;
        
}

#pragma mark -
#pragma mark ================= NinaPagerViewDelegate =================
- (void)ninaCurrentPageIndex:(NSString *)currentPage
{
    NSLog(@"点了第%@个",currentPage);
//    if([currentPage isEqualToString:@"0"]) {
//        self.quanLabel.hidden = NO;
//        self.fuLabel.hidden = YES;
//        self.faLabel.hidden = YES;
//        self.shouLabel.hidden = YES;
//        self.pingLabel.hidden = YES;
//    }
//    if([currentPage isEqualToString:@"1"]) {
//        self.quanLabel.hidden = YES;
//        self.fuLabel.hidden = NO;
//        self.faLabel.hidden = YES;
//        self.shouLabel.hidden = YES;
//        self.pingLabel.hidden = YES;
//
//    }
//    if([currentPage isEqualToString:@"2"]) {
//        self.quanLabel.hidden = YES;
//        self.fuLabel.hidden = YES;
//        self.faLabel.hidden = NO;
//        self.shouLabel.hidden = YES;
//        self.pingLabel.hidden = YES;
//
//    }
//    if([currentPage isEqualToString:@"3"]) {
//        self.quanLabel.hidden = YES;
//        self.fuLabel.hidden = YES;
//        self.faLabel.hidden = YES;
//        self.shouLabel.hidden = NO;
//        self.pingLabel.hidden = YES;
//
//    }
//    if([currentPage isEqualToString:@"4"]) {
//        self.quanLabel.hidden = YES;
//        self.fuLabel.hidden = YES;
//        self.faLabel.hidden = YES;
//        self.shouLabel.hidden = YES;
//        self.pingLabel.hidden = NO;
//
//    }
}


/** 取消searchBar背景色 */
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
-(void)initLabel {
    
    CGFloat labelW = ScreenWidth/5;
    
    UILabel *quanLabel = [self createLabel];
    quanLabel.text = @"4";
    quanLabel.hidden = YES;
    [self.view addSubview:quanLabel];
    self.quanLabel = quanLabel;
    
    UILabel *fuLabel = [self createLabel];
    fuLabel.text = @"10";
    fuLabel.hidden = YES;
    [self.view addSubview:fuLabel];
    self.fuLabel = fuLabel;
    
    UILabel *faLabel = [self createLabel];
    faLabel.text = @"29";
    faLabel.hidden = YES;
    [self.view addSubview:faLabel];
    self.faLabel = faLabel;
    
    UILabel *shouLabel = [self createLabel];
    shouLabel.text = @"4";
    shouLabel.hidden = YES;
    [self.view addSubview:shouLabel];
    self.shouLabel = shouLabel;
    
    UILabel *pingLabel = [self createLabel];
    pingLabel.text = @"4";
    pingLabel.hidden = YES;
    [self.view addSubview:pingLabel];
    self.pingLabel = pingLabel;
    
    quanLabel.sd_layout
    .leftSpaceToView(self.view,labelW-15)
    .topSpaceToView(self.view,5)
    .widthIs(12).heightIs(12);
    quanLabel.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    fuLabel.sd_layout
    .leftSpaceToView(self.view,labelW*2-12)
    .topSpaceToView(self.view,5)
    .widthIs(12).heightIs(12);
    fuLabel.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    faLabel.sd_layout
    .leftSpaceToView(self.view,labelW*3-12)
    .topSpaceToView(self.view,5)
    .widthIs(12).heightIs(12);
    faLabel.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    shouLabel.sd_layout
    .leftSpaceToView(self.view,labelW*4-12)
    .topSpaceToView(self.view,5)
    .widthIs(12).heightIs(12);
    shouLabel.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    pingLabel.sd_layout
    .leftSpaceToView(self.view,labelW*5-12)
    .topSpaceToView(self.view,5)
    .widthIs(12).heightIs(12);
    pingLabel.sd_cornerRadiusFromWidthRatio = @(0.5);
    
}

-(UILabel *)createLabel {
    UILabel *label = [[UILabel alloc]init];
    label.font = TFont(9);
    label.textColor = [UIColor redColor];
    label.layer.borderWidth = 0.5;
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderColor = [UIColor redColor].CGColor;
    return label;
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
