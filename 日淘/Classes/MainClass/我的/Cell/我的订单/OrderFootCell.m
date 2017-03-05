//
//  OrderFootCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/19.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderFootCell.h"
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "ModelTotalAmount.h"
#import "LogisticsDetailsVC.h"
#import "OrderDetailsVC.h"
#import "ModelCancleOrder.h"
#import "PayOrderVC.h"


@interface OrderFootCell()
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIButton *btn3;
@end

@implementation OrderFootCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderFootCell";
    OrderFootCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderFootCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UILabel *nameLabel = [[UILabel alloc]init];
//    nameLabel.text = @"共2件  合计￥163.5";
    nameLabel.font = TFont(12);
    nameLabel.textColor = COLOR_Gray;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIButton *orderBtn = [[UIButton alloc]init];
    orderBtn.titleLabel.font = TFont(12);
    [orderBtn setTitle:@"订单跟踪" forState:UIControlStateNormal];
    [orderBtn setTitleColor:COLOR_Gray forState:UIControlStateNormal];
    orderBtn.layer.borderColor = COLOR_Gray.CGColor;
    orderBtn.hidden = YES;
    orderBtn.tag = 12;
    orderBtn.layer.borderWidth = 1;
    [orderBtn addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:orderBtn];
    self.btn1 = orderBtn;
    
    UIButton *shouBtn = [[UIButton alloc]init];
    shouBtn.titleLabel.font = TFont(12);
    shouBtn.hidden = YES;
    shouBtn.tag = 11;
    [shouBtn setTitle:@"收货评价" forState:UIControlStateNormal];
    [shouBtn setTitleColor:COLOR_Gray forState:UIControlStateNormal];
    shouBtn.layer.borderColor = COLOR_Gray.CGColor;
    shouBtn.layer.borderWidth = 1;
    [shouBtn addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:shouBtn];
    self.btn2 = shouBtn;
    
    UIButton *Btn3 = [[UIButton alloc]init];
    Btn3.titleLabel.font = TFont(12);
    Btn3.hidden = YES;
    Btn3.tag = 10;
    [Btn3 setTitle:@"收货评价" forState:UIControlStateNormal];
    [Btn3 setTitleColor:COLOR_Gray forState:UIControlStateNormal];
    Btn3.layer.borderColor = COLOR_Gray.CGColor;
    Btn3.layer.borderWidth = 1;
    [Btn3 addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:Btn3];
    self.btn3 = Btn3;

    
    nameLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .heightIs(15);
    [nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    Btn3.sd_layout
    .rightSpaceToView(self.contentView,10)
    .topSpaceToView(nameLabel,10)
    .widthIs(80).heightIs(25);
    Btn3.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    shouBtn.sd_layout
    .rightSpaceToView(Btn3,10)
    .topSpaceToView(nameLabel,10)
    .widthIs(80).heightIs(25);
    shouBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    orderBtn.sd_layout
    .rightSpaceToView(shouBtn,10)
    .topSpaceToView(nameLabel,10)
    .widthIs(80).heightIs(25);
    orderBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
}

-(void)setModel:(ModelWfxSaleOrderCollection *)model {
    _model = model;
    
    for(int i = 0; i < model.DisplayButtonForList.count; i++) {
        UIButton *btn = [self viewWithTag:10+i];
        btn.hidden = NO;
        [btn setTitle:model.DisplayButtonForList[i] forState:UIControlStateNormal];
    }
    
    NSString *priceStr = [NSString stringWithFormat:@"%@%@",model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
    NSDictionary *saleStyle = @{ @"sale" : COLOR_Black };
    self.nameLabel.attributedText = [[NSString stringWithFormat:@"共%@件  合计: <sale>%@</sale>",model.Quantity,priceStr] attributedStringWithStyleBook:saleStyle];
}

- (void)clickBtn1:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"查看订单"])
    {
        OrderDetailsVC *vc = [[OrderDetailsVC alloc] init];
        vc.SaleOrderGuid = self.model.SaleOrderGuid;
        [DCURLRouter pushViewController:vc animated:YES];
    }
    if ([btn.titleLabel.text isEqualToString:@"订单跟踪"])
    {
        LogisticsDetailsVC *vc = [[LogisticsDetailsVC alloc] init];
        vc.SaleOrderGuid = self.model.SaleOrderGuid;
        [DCURLRouter pushViewController:vc animated:YES];
    }

    //H 测试   立即支付 －－ 订单金额为空
    if ([btn.titleLabel.text isEqualToString:@"立即支付"])
    {
        ModelPayOrder *orderModel = [[ModelPayOrder alloc] init];
        orderModel.SaleOrderID = self.model.SaleOrderID;
        orderModel.TotalAmount.MoneySymbol = self.model.TotalAmount.MoneySymbol;
        orderModel.TotalAmount.Value = self.model.TotalAmount.Value;
        
        PayOrderVC *vc = [[PayOrderVC alloc] init];
        vc.model = orderModel;
        [DCURLRouter pushViewController:vc animated:YES];
    }
    
    //H 测试
    if ([btn.titleLabel.text isEqualToString:@"确认收货"])
    {
        //待收货的订单消失－到待评价里面－接口
    }
    
    //暂时取消提醒发货
//    if ([btn.titleLabel.text isEqualToString:@"提醒发货"])
//    {
//        [self requestFaHuo];
//    }
    if ([btn.titleLabel.text isEqualToString:@"取消订单"])
    {
        [self requestQuXiaoDingDan];
    }
}

- (void)requestFaHuo
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RemindSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.RemindSaleOrderAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.model.SaleOrderGuid forKey:@"SaleOrderID"];
    [params setValue:@"1" forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelCancleOrder *model = [ModelCancleOrder mj_objectWithKeyValues:responseObject];
        
        if (model.IsSuccessful)
        {
            [LCProgressHUD showSuccess:@"已提醒卖家发货"];
        }else{
            [LCProgressHUD showFailure:model.ResponseMessage];
        }
        
    } successBackfailError:^(id responseObject) {
        
        
    } failure:^(NSError *error) {
        
    }];

}

- (void)requestQuXiaoDingDan
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CancelSaleOrderResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.CancelSaleOrderAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.model.SaleOrderGuid forKey:@"SaleOrderID"];
    [params setValue:@"1" forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
    
        ModelCancleOrder *model = [ModelCancleOrder mj_objectWithKeyValues:responseObject];
        
        if (model.IsSuccessful)
        {
            [LCProgressHUD showSuccess:@"取消订单成功"];
            
            if (self.cancleOrderSuccessBlock) {
                self.cancleOrderSuccessBlock();
            }
        }else{
            [LCProgressHUD showFailure:model.ResponseMessage];
        }
        
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

@end
