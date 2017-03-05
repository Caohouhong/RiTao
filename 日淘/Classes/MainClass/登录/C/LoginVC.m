//
//  LoginVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LoginVC.h"
#import "RegisteredVC.h"

@interface LoginVC ()
@property (nonatomic, weak) UITextField *phoneTextfield;
@property (nonatomic, weak) UITextField *passwordTextfield;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"登录";

    [self initNav];
    [self initView];
    
}

-(void)initNav {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"注册" target:self action:@selector(zhuce)];
}

-(void)initView {
    
    UIImageView *headImageView = [[UIImageView alloc]init];
    headImageView.backgroundColor = COLOR_Gray;
    [self.view addSubview:headImageView];

    UIView *phoneView = [self backView];
    [self.view addSubview:phoneView];
    UIImageView *phoneImageView = [UIImageView createImageViewWithImage:@"shoujihao"];
    UITextField *phoneTextfield = [[UITextField alloc]init];
    phoneTextfield.placeholder = @"手机号";
    phoneTextfield.font = TFont(13);
    self.phoneTextfield = phoneTextfield;
    [phoneView sd_addSubviews:@[phoneImageView,phoneTextfield]];
    
    UIView *passwordView = [self backView];
    [self.view addSubview:passwordView];
    UIImageView *passwordImageView = [UIImageView createImageViewWithImage:@"mima"];
    UITextField *passwordTextfield = [[UITextField alloc]init];
    passwordTextfield.placeholder = @"您的登录密码";
    passwordTextfield.secureTextEntry = YES;
    passwordTextfield.font = TFont(13);
    self.passwordTextfield = passwordTextfield;
    UIButton *seeBtn = [[UIButton alloc]init];
    [seeBtn setImage:GETIMAGE(@"xuanzhe") forState:UIControlStateNormal];
    [seeBtn addTarget:self action:@selector(ClickSee) forControlEvents:UIControlEventTouchUpInside];
    [passwordView sd_addSubviews:@[passwordImageView,passwordTextfield,seeBtn]];
    
    UIButton *forgetBtn = [UIButton createButtonWithTitle:@"忘记密码?" titleColor:COLOR_Gray font:11 target:self action:@selector(ClickForGet)];
    forgetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    UIButton *loginBtn = [UIButton createButtonWithTitle:@"登录" backgroupColor:COLOR_Red2 titleColor:COLOR_White font:13 target:self action:@selector(ClikcLogin)];
    loginBtn.layer.cornerRadius = 3.0;
    [self.view sd_addSubviews:@[forgetBtn, loginBtn]];
    
    headImageView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(100);
    
    phoneView.sd_layout
    .leftSpaceToView(self.view,25)
    .rightSpaceToView(self.view,25)
    .topSpaceToView(headImageView,20)
    .heightIs(35);
    
    phoneImageView.sd_layout
    .leftSpaceToView(phoneView,10)
    .centerYEqualToView(phoneView)
    .widthIs(15).heightIs(15);
    
    phoneTextfield.sd_layout
    .leftSpaceToView(phoneImageView,10)
    .centerYEqualToView(phoneImageView)
    .rightSpaceToView(phoneView,10)
    .heightIs(25);
    
    passwordView.sd_layout
    .leftSpaceToView(self.view,25)
    .rightSpaceToView(self.view,25)
    .topSpaceToView(phoneView,10)
    .heightIs(35);
    
    passwordImageView.sd_layout
    .leftSpaceToView(passwordView,10)
    .centerYEqualToView(passwordView)
    .widthIs(15).heightIs(15);
    
    seeBtn.sd_layout
    .rightSpaceToView(passwordView,5)
    .centerYEqualToView(passwordView)
    .widthIs(15).heightIs(10);
    
    passwordTextfield.sd_layout
    .leftSpaceToView(passwordImageView,10)
    .centerYEqualToView(passwordImageView)
    .rightSpaceToView(seeBtn,10)
    .heightIs(25);

    forgetBtn.sd_layout
    .rightEqualToView(passwordView)
    .topSpaceToView(passwordView,5)
    .widthIs(70).heightIs(15);
    
    loginBtn.sd_layout
    .rightEqualToView(passwordView)
    .leftEqualToView(passwordView)
    .topSpaceToView(forgetBtn,15)
    .heightIs(35);
    
}

-(void)zhuce {
    RegisteredVC *regVC = [[RegisteredVC alloc]init];
    [self.navigationController pushViewController:regVC animated:YES];
}

-(void)ClickSee {
    self.passwordTextfield.secureTextEntry = NO;
}

-(void)ClickForGet {
    [self.view endEditing:YES];

}

-(void)ClikcLogin {
    [self.view endEditing:YES];
    
    
    if(self.phoneTextfield.text.length != 11) {
        [LCProgressHUD showFailure:@"请输入正确的手机号"];
        return;
    }
    if(self.passwordTextfield.text.length < 5 || self.passwordTextfield.text.length > 15) {
        [LCProgressHUD showFailure:@"请输入6-16位密码"];
        return;
    }

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MemberLoginResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MemberLoginAction" forKey:@"Action"];
    [params setValue:self.phoneTextfield.text forKey:@"Telephone"];
    [params setValue:self.passwordTextfield.text forKey:@"Password"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {

        [UserDefaults setValue:@"" forKey:@""];
        [UserDefaults synchronize];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(UIView *)backView {
    UIView *view = [[UIView alloc]init];
    view.layer.cornerRadius = 3.0;
    view.layer.borderColor = COLOR_BackgroundColor.CGColor;
    view.layer.borderWidth = 1;
    return view;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
