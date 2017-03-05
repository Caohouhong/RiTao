//
//  OrderDetailsXinXiCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "OrderDetailsXinXiCell.h"
#import "LogisticsDetailsVC.h"
#import "ModelCancleOrder.h"

@interface OrderDetailsXinXiCell ()

@property (nonatomic, weak) UILabel *zongjiapriceLabel;
@property (nonatomic, weak) UILabel *yunfeipriceLabel;
@property (nonatomic, weak) UILabel *youhuipriceLabel;
@property (nonatomic, weak) UILabel *fukuanpriceLabel;
@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;

@end

@implementation OrderDetailsXinXiCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"OrderDetailsXinXiCell";
    OrderDetailsXinXiCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[OrderDetailsXinXiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UILabel *zongjiaLabel = [[UILabel alloc]init];
    zongjiaLabel.text = @"商品总价";
    zongjiaLabel.font = TFont(12);
    zongjiaLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:zongjiaLabel];
    
    UILabel *yunfeiLabel = [[UILabel alloc]init];
    yunfeiLabel.text = @"运费";
    yunfeiLabel.font = TFont(12);
    yunfeiLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:yunfeiLabel];
    
    UILabel *youhuiLabel = [[UILabel alloc]init];
    youhuiLabel.text = @"优惠";
    youhuiLabel.font = TFont(12);
    youhuiLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:youhuiLabel];
    
    UILabel *fukuanLabel = [[UILabel alloc]init];
    fukuanLabel.text = @"实付款(在线支付)";
    fukuanLabel.font = TFont(12);
    fukuanLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:fukuanLabel];
    
    //qian
    UILabel *zongjiapriceLabel = [[UILabel alloc]init];
    zongjiapriceLabel.text = @"￥166.5";
    zongjiapriceLabel.font = TFont(12);
    zongjiapriceLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:zongjiapriceLabel];
    self.zongjiapriceLabel = zongjiapriceLabel;
    
    UILabel *yunfeipriceLabel = [[UILabel alloc]init];
    yunfeipriceLabel.text = @"+￥0";
    yunfeipriceLabel.font = TFont(12);
    yunfeipriceLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:yunfeipriceLabel];
    self.yunfeipriceLabel = yunfeipriceLabel;
    
    UILabel *youhuipriceLabel = [[UILabel alloc]init];
    youhuipriceLabel.text = @"-￥0";
    youhuipriceLabel.font = TFont(12);
    youhuipriceLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:youhuipriceLabel];
    self.youhuipriceLabel = youhuipriceLabel;
    
    UILabel *fukuanpriceLabel = [[UILabel alloc]init];
    fukuanpriceLabel.text = @"￥163.2";
    fukuanpriceLabel.font = TFont(12);
    fukuanpriceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:fukuanpriceLabel];
    self.fukuanpriceLabel = fukuanpriceLabel;

    //按钮
    UIButton *pingjiaBtn = [[UIButton alloc]init];
    pingjiaBtn.titleLabel.font = TFont(13);
    pingjiaBtn.layer.borderColor = [UIColor grayColor].CGColor;
    pingjiaBtn.layer.borderWidth = 1;
    [pingjiaBtn setTitle:@"收货评价" forState:UIControlStateNormal];
    [pingjiaBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    pingjiaBtn.hidden = YES;
    pingjiaBtn.tag = 11;
    [pingjiaBtn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:pingjiaBtn];
    self.btn1 = pingjiaBtn;
    
    UIButton *dingdanBtn = [[UIButton alloc]init];
    dingdanBtn.titleLabel.font = TFont(13);
    dingdanBtn.layer.borderColor = [UIColor grayColor].CGColor;
    dingdanBtn.layer.borderWidth = 1;
    [dingdanBtn setTitle:@"订单跟踪" forState:UIControlStateNormal];
    [dingdanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    dingdanBtn.hidden = YES;
    dingdanBtn.tag = 10;
    [dingdanBtn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:dingdanBtn];
    self.btn1 = dingdanBtn;
    
    
    zongjiaLabel.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,15)
    .widthIs(150).heightIs(15);
    
    yunfeiLabel.sd_layout
    .topSpaceToView(zongjiaLabel,5)
    .leftSpaceToView(self.contentView,15)
    .widthIs(150).heightIs(15);
    
    youhuiLabel.sd_layout
    .topSpaceToView(yunfeiLabel,5)
    .leftSpaceToView(self.contentView,15)
    .widthIs(150).heightIs(15);
    
    fukuanLabel.sd_layout
    .topSpaceToView(youhuiLabel,5)
    .leftSpaceToView(self.contentView,15)
    .widthIs(150).heightIs(15);
    
    zongjiapriceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(zongjiaLabel)
    .heightIs(15);
    [zongjiapriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    yunfeipriceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(yunfeiLabel)
    .heightIs(15);
    [yunfeipriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    youhuipriceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(youhuiLabel)
    .heightIs(15);
    [youhuipriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    fukuanpriceLabel.sd_layout
    .rightSpaceToView(self.contentView,10)
    .centerYEqualToView(fukuanLabel)
    .heightIs(15);
    [fukuanpriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    pingjiaBtn.sd_layout
    .topSpaceToView(fukuanpriceLabel,15)
    .rightSpaceToView(self.contentView,10)
    .widthIs(80).heightIs(25);
    pingjiaBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
    dingdanBtn.sd_layout
    .topSpaceToView(fukuanpriceLabel,15)
    .rightSpaceToView(pingjiaBtn,5)
    .widthIs(80).heightIs(25);
    dingdanBtn.sd_cornerRadiusFromHeightRatio = @(0.5);
    
}


- (void)setModel:(ModelWfxSaleOrderDetail *)model
{
    _model = model;
    
    self.zongjiapriceLabel.text = [NSString stringWithFormat:@"%@%@",model.TotalAmount.MoneySymbol,model.TotalAmount.Value];
    self.yunfeipriceLabel.text = [NSString stringWithFormat:@"+%@%@",model.Freight.MoneySymbol,model.Freight.Value];
    self.youhuipriceLabel.text = [NSString stringWithFormat:@"+%@%@",model.Coupon.MoneySymbol,model.Coupon.Value];
    self.fukuanpriceLabel.text = [NSString stringWithFormat:@"%@%@",model.OrderPaymentAmount.MoneySymbol,model.OrderPaymentAmount.Value];
    
    
    for(int i = 0; i < model.DisplayButtonForDetail.count; i++)
    {
        UIButton *btn = [self viewWithTag:10+i];
        btn.hidden = NO;
        [btn setTitle:model.DisplayButtonForDetail[i] forState:UIControlStateNormal];
    }
}

- (void)didClickBtn:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消订单"])
    {
        [self requestQuXiaoDingDan];
    }
    if ([btn.titleLabel.text isEqualToString:@"提醒发货"])
    {
        [self requestFaHuo];
    }
    if ([btn.titleLabel.text isEqualToString:@"订单跟踪"])
    {
        LogisticsDetailsVC *vc = [[LogisticsDetailsVC alloc] init];
        vc.SaleOrderGuid = self.model.SaleOrderGuid;
        [DCURLRouter pushViewController:vc animated:YES];
    }
    if ([btn.titleLabel.text isEqualToString:@"申请售后"])
    {
        [LCProgressHUD showSuccess:@"已申请售后"];
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
