//
//  ChongZhiMiMaVC.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "ChongZhiMiMaVC.h"

@interface ChongZhiMiMaVC ()
@property (weak, nonatomic) IBOutlet UIView *TFBGV_1;
@property (weak, nonatomic) IBOutlet UIView *TFBGV_2;
@property (weak, nonatomic) IBOutlet UITextField *TF_1;
@property (weak, nonatomic) IBOutlet UITextField *TF_2;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation ChongZhiMiMaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"重置密码";
    
    self.TFBGV_1.backgroundColor = [UIColor clearColor];
    self.TFBGV_1.layer.cornerRadius = 5;
    self.TFBGV_1.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    self.TFBGV_1.layer.borderWidth = 0.1;
    self.TFBGV_2.backgroundColor = [UIColor clearColor];
    self.TFBGV_2.layer.cornerRadius = 5;
    self.TFBGV_2.layer.borderColor = HEXCOLOR(0x999999).CGColor;
    self.TFBGV_2.layer.borderWidth = 0.1;
    self.sureBtn.layer.cornerRadius = 5;
    
}

@end
