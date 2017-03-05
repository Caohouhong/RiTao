//
//  RegisteredVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "RegisteredVC.h"

@interface RegisteredVC ()
@property (nonatomic, weak) UITextField *phoneTextfield;
@property (nonatomic, weak) UITextField *passwordTextfield;
@property (nonatomic, weak) UITextField *codeTextfield;
@property (nonatomic, weak) UIButton *codeBtn;
@end

@implementation RegisteredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    
    [self initNav];
    [self initView];
    
}

-(void)initNav {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"登录" target:self action:@selector(denglu)];
}

-(void)initView {
    
    UIImageView *headImageView = [[UIImageView alloc]init];
    headImageView.backgroundColor = COLOR_Gray;
    [self.view addSubview:headImageView];

    
    UIView *phoneView = [self backView];
    [self.view addSubview:phoneView];

    UIButton *codeBtn = [[UIButton alloc]init];
    codeBtn.layer.cornerRadius = 3;
    codeBtn.layer.borderColor = COLOR_Red2.CGColor;
    codeBtn.layer.borderWidth = 0.5;
    codeBtn.titleLabel.font = TFont(12);
    [codeBtn setTitle:@"验证" forState:UIControlStateNormal];
    [codeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [codeBtn addTarget:self action:@selector(ClickCodeNum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
    self.codeBtn = codeBtn;
    
    UITextField *phoneTextfield = [[UITextField alloc]init];
    phoneTextfield.placeholder = @"手机号";
    phoneTextfield.font = TFont(13);
    [phoneView addSubview:phoneTextfield];
    self.phoneTextfield = phoneTextfield;
    
    UIView *codeView = [self backView];
    [self.view addSubview:codeView];
    
    UITextField *codeTextfield = [[UITextField alloc]init];
    codeTextfield.placeholder = @"验证码";
    codeTextfield.secureTextEntry = YES;
    codeTextfield.font = TFont(13);
    [codeView addSubview:codeTextfield];
    self.codeTextfield = codeTextfield;
    
    UIView *passwordView = [self backView];
    [self.view addSubview:passwordView];

    UITextField *passwordTextfield = [[UITextField alloc]init];
    passwordTextfield.placeholder = @"6-16位登录密码";
    passwordTextfield.secureTextEntry = YES;
    passwordTextfield.font = TFont(13);
    self.passwordTextfield = passwordTextfield;
    
    UIButton *seeBtn = [[UIButton alloc]init];
    [seeBtn setImage:GETIMAGE(@"xuanzhe") forState:UIControlStateNormal];
    [seeBtn addTarget:self action:@selector(ClickSee) forControlEvents:UIControlEventTouchUpInside];
    [passwordView sd_addSubviews:@[passwordTextfield,seeBtn]];
    

    UIButton *loginBtn = [UIButton
                          createButtonWithTitle:@"注册"
                          backgroupColor:COLOR_Red2
                          titleColor:COLOR_White
                          font:13 target:self action:@selector(ClikcLogin)];
    loginBtn.layer.cornerRadius = 3.0;
    
    UILabel *tongLabel = [UILabel
                          createLabelWithText:@"点击注册,表示同意《日淘商城用户协议》"
                          textColor:COLOR_Gray font:11];
    tongLabel.textAlignment = NSTextAlignmentCenter;
    [self.view sd_addSubviews:@[tongLabel, loginBtn]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tongLabel addGestureRecognizer:tap];
    
    headImageView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .heightIs(100);
    
    codeBtn.sd_layout
    .rightSpaceToView(self.view,25)
    .topSpaceToView(headImageView,20)
    .heightIs(34).widthIs(65);
    
    phoneView.sd_layout
    .leftSpaceToView(self.view,25)
    .rightSpaceToView(codeBtn,5)
    .topSpaceToView(headImageView,20)
    .heightIs(35);
    
    phoneTextfield.sd_layout
    .leftSpaceToView(phoneView,5)
    .centerYEqualToView(phoneView)
    .rightSpaceToView(phoneView,5)
    .heightIs(25);
    
    codeView.sd_layout
    .leftSpaceToView(self.view,25)
    .rightSpaceToView(self.view,25)
    .topSpaceToView(phoneView,10)
    .heightIs(35);
    
    codeTextfield.sd_layout
    .leftSpaceToView(codeView,5)
    .centerYEqualToView(codeView)
    .rightSpaceToView(codeView,5)
    .heightIs(25);
    
    passwordView.sd_layout
    .leftSpaceToView(self.view,25)
    .rightSpaceToView(self.view,25)
    .topSpaceToView(codeView,10)
    .heightIs(35);
    
    seeBtn.sd_layout
    .rightSpaceToView(passwordView,5)
    .centerYEqualToView(passwordView)
    .widthIs(15).heightIs(10);
    
    passwordTextfield.sd_layout
    .leftSpaceToView(passwordView,5)
    .centerYEqualToView(passwordView)
    .rightSpaceToView(seeBtn,10)
    .heightIs(25);
    
    
    loginBtn.sd_layout
    .rightEqualToView(passwordView)
    .leftEqualToView(passwordView)
    .topSpaceToView(passwordView,20)
    .heightIs(35);
    
    tongLabel.sd_layout
    .leftSpaceToView(self.view,5)
    .rightSpaceToView(self.view,5)
    .topSpaceToView(loginBtn,10)
    .heightIs(15);
    
}


-(void)ClickCodeNum {
    
    if(self.phoneTextfield.text.length != 11) {
        [LCProgressHUD showFailure:@"请输入正确的手机号"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RequestAuthorizationCodeResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RequestAuthorizationCodeAction" forKey:@"Action"];
    [params setValue:self.phoneTextfield.text forKey:@"Telephone"];
    [params setValue:AppID forKey:@"AppID"];
    
    [self.codeBtn startWithTime:59 title:@"重发"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
    
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)denglu {


    
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
    if(!self.codeTextfield.text.length) {
        [LCProgressHUD showFailure:@"请输入验证码"];
        return;
    }
    if(self.passwordTextfield.text.length < 5 || self.passwordTextfield.text.length > 15) {
        [LCProgressHUD showFailure:@"请输入6-16位密码"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MemberRegisterActionResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.MemberRegisterAction" forKey:@"Action"];
    [params setValue:self.phoneTextfield.text forKey:@"Telephone"];
    [params setValue:self.codeTextfield.text forKey:@"AuthorizationCode"];
    [params setValue:self.passwordTextfield.text forKey:@"Password"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)tap {
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
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
