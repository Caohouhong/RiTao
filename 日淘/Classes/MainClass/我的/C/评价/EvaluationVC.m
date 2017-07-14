//
//  EvaluationVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationVC.h"
#import "EvaluationOneCell.h"
#import "EvaluationTwoCell.h"
#import "ModelShangChuan.h"
#import "ACMediaModel.h"

@interface EvaluationVC ()<UITableViewDelegate, UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) PhotoType type;
@property (nonatomic, strong) UIImage *image1;
@property (nonatomic, strong) UIImage *image2;
@property (nonatomic, strong) UIImage *image3;
@property (nonatomic, strong) UIImage *image4;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic, strong) NSMutableArray *downloadableFileNameArray;
@property (nonatomic, copy) NSString *content;
@end

@implementation EvaluationVC

- (NSMutableArray *)downloadableFileNameArray
{
    if (!_downloadableFileNameArray)
    {
        _downloadableFileNameArray = [NSMutableArray array];
    }
    
    return _downloadableFileNameArray;
}

- (NSMutableArray *)photoArray
{
    if (!_photoArray)
    {
        _photoArray = [NSMutableArray array];
    }
    
    return _photoArray;
}

-(NSMutableArray *)dataArray {
    if(_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"评价";
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(clickTijiao)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor redColor]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:13],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [self initView];
}

-(void)initView {
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.backgroundColor = COLOR_BackgroundColor;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
    tableview.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

-(void)clickTijiao
{
    if (!self.content.length) {
        [LCProgressHUD showFailure:@"请填写评价"];
        return;
    }
    
    for (ACMediaModel *modelmodel in self.photoArray)
    {
        NSLog(@"===>%@",modelmodel.name);
        
        [self aaaaaaWithImage:modelmodel.image name:modelmodel.name];
    }
}

#pragma mark - tableView 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        EvaluationOneCell *cell = [EvaluationOneCell cellWithTableview:tableView];
        cell.model = self.model;
        return cell;
    }
    
    EvaluationTwoCell *cell = [EvaluationTwoCell cellWithTableview:tableView];
    
    __weak typeof(self) weakSelf = self;
    cell.haveChoosePhotoBlock = ^(NSArray *array){
    
        weakSelf.photoArray = [NSMutableArray arrayWithArray:array];
    };
    
    cell.textViewShouldEndEditingBlock = ^(NSString *str){
        weakSelf.content = str;
    };
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 90;
    }
    return 350;
}

#pragma mark -
#pragma mark ================= 网络 =================

- (NSString *)aaaaaaWithImage:(UIImage *)image name:(NSString *)name
{
    NSData *data = UIImageJPEGRepresentation(image, 0.1);
    NSUInteger length1 = data.length;
    
    //    NSLog(@"data====>%@",data);
    //    NSLog(@"length1====>%ld",length1);
    
    if (length1<2000)
    {
        NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
        [self shangChuanImageWithContents:@[base64Encoded] index:0 fileName:@"" imageName:name];
    }
    else
    {
        NSUInteger aa = length1 % 2000;
        NSUInteger bb = length1/2000;
        //        NSLog(@"bb====>%ld",bb);
        
        NSMutableArray *dataArray = [NSMutableArray array];
        for (int i = 0; i < bb; i ++)
        {
            NSData *data1 = [data subdataWithRange:NSMakeRange(2000*i, 2000)];
            NSString *base64Encoded = [data1 base64EncodedStringWithOptions:0];
            //            NSLog(@"base64Encoded====>%@",data1);
            //            NSLog(@"data1====>%ld",data1.length);
            [dataArray addObject:base64Encoded];
        }
        
        NSData *data1 = [data subdataWithRange:NSMakeRange(2000*bb, aa)];
        NSString *base64Encoded = [data1 base64EncodedStringWithOptions:0];
        //        NSLog(@"base64Encoded====>%@",data1);
        //        NSLog(@"data1====>%ld",data1.length);
        [dataArray addObject:base64Encoded];
        
        [self shangChuanImageWithContents:dataArray index:0 fileName:@"" imageName:name];
    }
    
    return nil;
}

- (void)shangChuanImageWithContents:(NSArray *)contents index:(int)index fileName:(NSString *)fileName imageName:(NSString *)imageName
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UploadFileResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UploadFileAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:contents[index] forKey:@"Content"];
    [params setValue:[NSString stringWithFormat:@"%d",index] forKey:@"Index"];
    
    if (fileName.length)
    {
        [params setValue:fileName forKey:@"FileName"];
    }
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在上传..." success:^(id responseObject) {
        
        ModelShangChuan *model = [ModelShangChuan mj_objectWithKeyValues:responseObject];
        
        if (contents.count == 1)
        {
            [self requestCompleteImageFileActionWithFileName:model.FileName imageName:imageName];
        }
        else if (index == (contents.count - 1))
        {
            [self requestCompleteImageFileActionWithFileName:model.FileName imageName:imageName];
        }
        else
        {
            int indexx =  index + 1;
            [self shangChuanImageWithContents:contents index:indexx fileName:model.FileName imageName:imageName];
        }
        
        
    } successBackfailError:^(id responseObject) {
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)requestCompleteImageFileActionWithFileName:(NSString *)FileName imageName:(NSString *)imageName
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CompleteImageFileResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CompleteImageFileAction" forKey:@"Action"];
    [params setValue:imageName forKey:@"FileNameFromClient"];
    [params setValue:FileName forKey:@"FileNameFromServer"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在上传..." success:^(id responseObject) {
        
        ModelShangChuan *model = [ModelShangChuan mj_objectWithKeyValues:responseObject];
        [self.downloadableFileNameArray addObject:model.DownloadableFileName];
        
        if (self.downloadableFileNameArray.count == self.photoArray.count)
        {
            [self requestFaBu];
        }
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)requestFaBu
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Json.JsonResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddSaleProductCommentAction" forKey:@"Action"];
    [params setValue:self.model.ProductGuid forKey:@"SaleProductGuid"];
    [params setValue:self.model.SaleOrderGuid forKey:@"SaleOrderGuid"];
    [params setValue:self.content forKey:@"Content"];
    [params setValue:self.downloadableFileNameArray forKey:@"CommentPictureList"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在提交..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"评价成功"];
        [DCURLRouter popViewControllerAnimated:YES];
        
        if (self.didPingJiaSuccessBlock) {
            self.didPingJiaSuccessBlock();
        }
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}




@end
