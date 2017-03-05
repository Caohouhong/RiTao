//
//  AddRealNameVC.m
//  日淘
//
//  Created by caohouhong on 17/3/3.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "AddRealNameVC.h"

@interface AddRealNameVC ()
{
    UITextField *nameTextField;
    UITextField *numTextField;
}
@end

@implementation AddRealNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加实名信息";
    self.view.backgroundColor = COLOR_BackgroundColor;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"完成" target:self action:@selector(finishAction)];
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)drawView{
    
    UIView *holdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 90)];
    holdView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:holdView];
    
    UIView *dividerLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, 45, ScreenWidth, 1)];
    dividerLine1.backgroundColor = COLOR_LineViewColor;
    [holdView addSubview:dividerLine1];
    
//    UIView *dividerLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, 89, ScreenWidth, 1)];
//    dividerLine1.backgroundColor = COLOR_LineViewColor;
//    [holdView addSubview:dividerLine2];
    
    UILabel *namelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 70, 45)];
    namelabel.text = @"真实姓名";
    namelabel.font = SYSTEM_FONT_(15);
    namelabel.textColor = COLOR_Black;
    [holdView addSubview:namelabel];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 45, 70, 45)];
    numberLabel.text = @"身份证号";
    numberLabel.font = SYSTEM_FONT_(15);
    numberLabel.textColor = COLOR_Black;
    [holdView addSubview:numberLabel];
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(namelabel.frame) + 10, 0, ScreenWidth - 100, 45)];
    nameTextField.placeholder = @"请输入姓名";
    nameTextField.textColor = COLOR_darkGray;
    nameTextField.font = SYSTEM_FONT_(15);
    [holdView addSubview:nameTextField];
    
    numTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(namelabel.frame) + 10, 45, ScreenWidth -100, 45)];
    numTextField.placeholder = @"请输入身份证号";
    numTextField.textColor = COLOR_darkGray;
    numTextField.font = SYSTEM_FONT_(15);
    [holdView addSubview:numTextField];
}

//完成
- (void)finishAction{
    
    if (nameTextField.text.length < 2){
        [LCProgressHUD showFailure:@"请输入姓名"];
        return;
    }
    if (numTextField.text.length != 18){
        [LCProgressHUD showFailure:@"请输入正确的身份证号"];
        return;
    }

    
    [self requestGetProvinceCollectionAction];
    
}

-(void)requestGetProvinceCollectionAction {
    
    [LCProgressHUD showLoading:@"正在添加..."];
    
    NSString *imgUrl = @"http://demoerp.rt315.com/RiTaoErpCentral/日淘ERP系统/Images/I_6a7af7e16b864441b334752e191da543日淘商城360.jpg";
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetProvinceCollectionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetProvinceCollectionAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:nameTextField.text forKey:@"Name"];
    [params setValue:numTextField.text forKey:@"IDCard"];
    
    [params setValue:imgUrl forKey:@"BackPhotoAddress"];
    [params setValue:imgUrl forKey:@"FrontPhotoAddress"];
    [params setValue:false forKey:@"IsDefault"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"" success:^(id responseObject) {
        
     [LCProgressHUD showSuccess:@"添加成功"];
     [self.navigationController popViewControllerAnimated:YES];
        
    } successBackfailError:^(id responseObject) {
        
        [LCProgressHUD showFailure:@"添加失败，请稍后再试"];
        
    } failure:^(NSError *error) {
        
    }];
}


@end
