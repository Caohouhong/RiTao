//
//  FeedbackVC.m
//  日淘
//
//  Created by 唐硕 on 16/12/16.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "FeedbackVC.h"

@interface FeedbackVC ()
@property (nonatomic, weak) UITextField *textfield;
@property (nonatomic, weak) UITextView *textView;
@end

@implementation FeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"意见反馈";
    
    self.view.backgroundColor = COLOR_BackgroundColor;
    
    [self initNav];
    [self initView];
    
}


-(void)initNav {
   self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"发送" target:self action:@selector(sava)];
}


-(void)initView {
    
    UILabel *feedbackLabel = [UILabel createLabelWithText:@"反馈内容" font:12];
    
    UIButton *wenBtn = [UIButton createButtonWithTitle:@"常见问题 >" titleColor:COLOR_Gray font:12 target:self action:@selector(Commonproblems)];
    
    UITextView *textView = [[UITextView alloc]init];
    textView.textContainerInset = UIEdgeInsetsMake(5, 5, 0, 0);
    textView.placeholder = @"期待您对日淘商城客户端的任何意见或建议";
    textView.font = TFont(12);
    textView.backgroundColor = COLOR_White;
    self.textView = textView;
    
    UILabel *contactLabel = [UILabel createLabelWithText:@"联系方式" font:12];
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    textfield.leftViewMode = UITextFieldViewModeAlways;
    textfield.placeholder = @"请输入手机号或邮箱(选填)";
    textfield.backgroundColor = COLOR_White;
    textfield.font = TFont(12);
    self.textfield = textfield;
    
    [self.view sd_addSubviews:@[feedbackLabel, wenBtn, textView, textfield, contactLabel]];
    
    feedbackLabel.sd_layout
    .topSpaceToView(self.view,15)
    .leftSpaceToView(self.view,15)
    .widthIs(100).heightIs(15);
    
    wenBtn.sd_layout
    .centerYEqualToView(feedbackLabel)
    .rightSpaceToView(self.view,10)
    .widthIs(70).heightIs(15);
    
    textView.sd_layout
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .topSpaceToView(feedbackLabel,5)
    .heightIs(100);
    
    contactLabel.sd_layout
    .topSpaceToView(textView,10)
    .leftSpaceToView(self.view,15)
    .widthIs(100).heightIs(15);
    
    textfield.sd_layout
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .topSpaceToView(contactLabel,5)
    .heightIs(30);
}

-(void)sava {
    
    if(!self.textView.text.length) {
        [LCProgressHUD showFailure:@"请输入要反馈的内容或建议"];
        return;
    }
    
    if(!self.textfield.text.length) {
        [LCProgressHUD showFailure:@"请输入手机号"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Json.JsonResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddFeebackAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.textView.text forKey:@"Content"];
    [params setValue:self.textfield.text forKey:@"TelephoneOrEmail"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        [LCProgressHUD showSuccess:@"发送成功"];
    } successBackfailError:^(id responseObject) {

    } failure:^(NSError *error) {
        
    }];
    
}

-(void)Commonproblems {
    
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
