//
//  PersonalXinXiVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PersonalXinXiVC.h"
#import "PersonalPhotoCell.h"
#import "PersonalXinXiCell.h"

#import "ModelMainSetting.h"
#import "ModelMember.h"
#import "SettingNameVC.h"
#import "RSKImageCropper.h"
#import "ModelShangChuan.h"
#import "ACMediaModel.h"

@interface PersonalXinXiVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,RSKImageCropViewControllerDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) ModelMember *meModel;
@property (nonatomic, strong) NSMutableArray *downloadableFileNameArray;
@end

@implementation PersonalXinXiVC

- (NSMutableArray *)downloadableFileNameArray
{
    if (!_downloadableFileNameArray)
    {
        _downloadableFileNameArray = [NSMutableArray array];
    }
    
    return _downloadableFileNameArray;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requstGetMemberInfoAction];

}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"个人信息";
    [self initView];
    
}

-(void)requstGetMemberInfoAction {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberInfoResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetMemberInfoAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelMainSetting *model = [ModelMainSetting mj_objectWithKeyValues:responseObject];
        self.meModel = model.Member;
        
        NSLog(@"===========>%@", IMAGE_URL(self.meModel.Photo));
        
        [self.tableView reloadData];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        PersonalPhotoCell *cell = [PersonalPhotoCell cellWithTableview:tableView];
        [cell.iconimageView sd_setImageWithURL:IMAGE_URL(self.meModel.Photo) placeholderImage:nil];
        return cell;
    }
    PersonalXinXiCell *cell = [PersonalXinXiCell cellWithTableview:tableView];
    cell.nameLabel.text = nameArray[indexPath.row];
    //cell.subLabel.text = subArray[indexPath.row];
    if(indexPath.row == 1) {
        cell.subLabel.text = TSTRING(self.meModel.NickName)?self.meModel.NickName:@"昵称待定";
    }
    if(indexPath.row == 2) {
        if([self.meModel.Gender isEqualToString:@"1"]) {
            cell.subLabel.text = @"男";
        }else if([self.meModel.Gender isEqualToString:@"2"]) {
            cell.subLabel.text = @"女";
        }else {
            cell.subLabel.text = @"保密";
        }
    }
//    if(indexPath.row == 3 ){
//        cell.subLabel.text = TSTRING(self.meModel.Telephone)?self.meModel.Telephone:@"未绑定";
//    }
    return cell;
    return [UITableViewCell new];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        [self selectPhotoimageView];
    }
    if(indexPath.row == 1) {
        SettingNameVC *vc = [[SettingNameVC alloc]init];
        vc.model = self.meModel;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(indexPath.row == 2) {
        [self changeIconImageView];
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 60;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}


- (void)changeIconImageView {
    __weak typeof(self) weakSelf = self;
    LCActionSheet *sheet = [[LCActionSheet alloc] initWithTitle:nil buttonTitles:@[@"男",@"女",@"保密"] redButtonIndex:-1 delegate:nil];
    sheet.didClickedButtonAtIndex = ^(NSInteger btnIndex,NSString *title){
        if (btnIndex == 0){
            [weakSelf requestUpdateMemberInfoAction:1];
        }else if (btnIndex == 1){
             [weakSelf requestUpdateMemberInfoAction:2];
        }else if (btnIndex == 2) {
             [weakSelf requestUpdateMemberInfoAction:3];
        }
    };
    [sheet show];
}


-(void)requestUpdateMemberInfoAction:(NSInteger )index {
    
    NSMutableArray *array = [NSMutableArray array];
    array = [[self.meModel.Photo componentsSeparatedByString:@"/"]copy]; //将字符串切换成数组
    NSString *photoStr = array.lastObject;
    
    NSLog(@"========> %@",photoStr);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UpdateMemberInfoResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UpdateMemberInfoAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@(index) forKey:@"Gender"];
    [params setValue:self.meModel.NickName forKey:@"Name"];
    [params setValue:photoStr forKey:@"Photo"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
    
        [self requstGetMemberInfoAction];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)selectPhotoimageView {
    __weak typeof(self) weakSelf = self;
    LCActionSheet *sheet = [[LCActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照",@"从相册中选取"] redButtonIndex:-1 delegate:nil];
    sheet.didClickedButtonAtIndex = ^(NSInteger btnIndex,NSString *title){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = weakSelf;
        
        if (btnIndex == 0)
        {
            //判断相机是否可用
            BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
            if (hasCamera)
            {
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.sourceType = sourceType;
                picker.allowsEditing = NO;
                [self presentViewController:picker animated:YES completion:nil];
            }
            else
            {
                [LCProgressHUD showFailure:@"相机不可用"];
            }
        }
        else if (btnIndex == 1)
        {
            // 从相册中选取
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.navigationBar.barTintColor = NAV_BAR_COLOR;
            picker.navigationBar.tintColor = [UIColor blackColor];
            picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
            [weakSelf presentViewController:picker animated:YES completion:nil];
        }
    };
    [sheet show];

}

#pragma mark -
#pragma mark ================= UIImagePickerControllerDelegate =================
/**
 *  从相册获取照片的回掉
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)aImage editingInfo:(NSDictionary *)editingInfo
{
    RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:aImage];
    imageCropVC.delegate = self;
    [picker presentViewController:imageCropVC animated:NO completion:nil];
}

#pragma mark -
#pragma mark ================= RSKImageCropViewControllerDelegate =================
- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageCropViewController:(RSKImageCropViewController *)controller
                   didCropImage:(UIImage *)croppedImage
                  usingCropRect:(CGRect)cropRect
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self uploadPortraitRequestWithPortrait:croppedImage];
}

-(void)uploadPortraitRequestWithPortrait:(UIImage *)image {
    
    NSData *data = UIImageJPEGRepresentation(image, 0.1);
    NSUInteger length1 = data.length;
    
    if (length1<2000){
        NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
        [self shangChuanImageWithContents:@[base64Encoded] index:0 fileName:@""];
    }else {
        NSUInteger aa = length1 % 2000;
        NSUInteger bb = length1/2000;
        
        NSMutableArray *dataArray = [NSMutableArray array];
        for (int i = 0; i < bb; i ++)
        {
            NSData *data1 = [data subdataWithRange:NSMakeRange(2000*i, 2000)];
            NSString *base64Encoded = [data1 base64EncodedStringWithOptions:0];
            [dataArray addObject:base64Encoded];
        }
        
        NSData *data1 = [data subdataWithRange:NSMakeRange(2000*bb, aa)];
        NSString *base64Encoded = [data1 base64EncodedStringWithOptions:0];

        [dataArray addObject:base64Encoded];
        
        [self shangChuanImageWithContents:dataArray index:0 fileName:@""];
    }
    
}

- (void)shangChuanImageWithContents:(NSArray *)contents index:(int)index fileName:(NSString *)fileName
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
            [self requestCompleteImageFileActionWithFileName:model.FileName imageName:@".png"];
        }
        else if (index == (contents.count - 1))
        {
            [self requestCompleteImageFileActionWithFileName:model.FileName imageName:@".png"];
        }
        else
        {
            int indexx =  index + 1;
            [self shangChuanImageWithContents:contents index:indexx fileName:model.FileName];
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
        
        [self requestxxxxxxxxxxxxxxxxx:model.DownloadableFileName];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)requestxxxxxxxxxxxxxxxxx:(NSString *)DownloadableFileName {
    NSInteger gender = [self.meModel.Gender integerValue];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UpdateMemberInfoResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.UpdateMemberInfoAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@(gender) forKey:@"Gender"];
    [params setValue:self.meModel.NickName forKey:@"Name"];
    [params setValue:DownloadableFileName forKey:@"Photo"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在上传..." success:^(id responseObject) {
        
        [self requstGetMemberInfoAction];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
