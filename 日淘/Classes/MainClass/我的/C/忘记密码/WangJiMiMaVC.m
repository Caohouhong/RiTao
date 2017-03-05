//
//  WangJiMiMaVC.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "WangJiMiMaVC.h"

@interface WangJiMiMaVC ()
@property (weak, nonatomic) IBOutlet UIView *TFBGV_1;
@property (weak, nonatomic) IBOutlet UIView *TFBGV_2;
@property (weak, nonatomic) IBOutlet UITextField *TF_1;
@property (weak, nonatomic) IBOutlet UITextField *TF_2;
@property (weak, nonatomic) IBOutlet UIButton *yanZhengBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation WangJiMiMaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"忘记密码?";
    
    self.TFBGV_1.backgroundColor = [UIColor clearColor];
    self.TFBGV_1.layer.cornerRadius = 5;
    self.TFBGV_1.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    self.TFBGV_1.layer.borderWidth = 0.1;
    self.TFBGV_2.backgroundColor = [UIColor clearColor];
    self.TFBGV_2.layer.cornerRadius = 5;
    self.TFBGV_2.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    self.TFBGV_2.layer.borderWidth = 0.1;
    self.nextBtn.layer.cornerRadius = 5;
}

- (IBAction)ClickCodeNum:(UIButton *)sender
{
    if(self.TF_1.text.length != 11) {
        [LCProgressHUD showFailure:@"请输入正确的手机号"];
        return;
    }
    
    [sender startWithTime:59 title:@"重新发送"];
    
}


@end
