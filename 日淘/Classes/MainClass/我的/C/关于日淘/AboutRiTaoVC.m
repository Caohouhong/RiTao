//
//  AboutRiTaoVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AboutRiTaoVC.h"
#import "AboutRiTaoCell.h"
#import "ModelAboutRiTaoPictureCollection.h"

@interface AboutRiTaoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) ModelAboutRiTaoPictureCollection *model;
@end

@implementation AboutRiTaoVC

-(NSMutableArray *)imageArray {
    if(_imageArray == nil) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于日淘";
    
    [self initView];
    [self initData];
}

-(void)initData {
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetAboutRiTaoPictureCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetAboutRiTaoPictureCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        self.model = [ModelAboutRiTaoPictureCollection mj_objectWithKeyValues:responseObject];
        [self.tableView reloadData];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
//    NSArray *array = @[@"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
//                            @"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg",
//                            @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
//                            @"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg",
//                            @"http://pic35.nipic.com/20131121/2531170_145358633000_2.jpg"];
//    self.imageArray = [NSMutableArray arrayWithArray:array];
    [self.tableView reloadData];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.AboutRiTaoPictureCollection.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AboutRiTaoCell *cell = [AboutRiTaoCell cellWithTableview:tableView];
    cell.str = self.model.AboutRiTaoPictureCollection[indexPath.section];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
