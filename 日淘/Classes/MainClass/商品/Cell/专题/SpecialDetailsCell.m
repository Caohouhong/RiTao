//
//  SpecialDetailsCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "SpecialDetailsCell.h"


@interface SpecialDetailsCell()
@property (nonatomic, weak) UIImageView *iconimageView;
@property (nonatomic, weak) UIImageView *shuiimageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, weak) UILabel *oldpriceLabel;
@property (nonatomic, weak) UILabel *baoYouLabel;
@property (nonatomic, weak) UILabel *manJianLabel;
@property (nonatomic, weak) UILabel *shopLabel;
@end
@implementation SpecialDetailsCell

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR_BackgroundColor;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIImageView *iconimageView = [[UIImageView alloc]init];
    iconimageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:iconimageView];
    self.iconimageView = iconimageView;
    
    UIImageView *shuiimageView = [[UIImageView alloc]init];
    //shuiimageView.image = [UIImage imageNamed:@"baoshuishangpin"];
    [iconimageView addSubview:shuiimageView];
    self.shuiimageView = shuiimageView;
    
    UILabel *shopLabel = [[UILabel alloc]init];
    shopLabel.font = TFont(12);
    shopLabel.textColor = [UIColor whiteColor];
    shopLabel.text = @"保税\n商品";
    shopLabel.textAlignment = NSTextAlignmentCenter;
    [shuiimageView addSubview:shopLabel];
    self.shopLabel = shopLabel;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    titleLabel.font = TFont(12);
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"￥999";
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = TFont(18);
    priceLabel.isAttributedContent = YES;
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *oldpriceLabel = [[UILabel alloc]init];
    //oldpriceLabel.text = @"￥999";
    oldpriceLabel.textColor = [UIColor grayColor];
    oldpriceLabel.font = TFont(11);
    oldpriceLabel.isAttributedContent = YES;
    [self addSubview:oldpriceLabel];
    self.oldpriceLabel = oldpriceLabel;
    
    NSString *str = @"￥999";
    //显示下划线
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    //下划线
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
    oldpriceLabel.attributedText = attribtStr;
    
    
    UILabel *baoYouLabel = [[UILabel alloc] init];
    baoYouLabel.font = [UIFont systemFontOfSize:8];
    baoYouLabel.textColor = COLOR_Red;
    baoYouLabel.text = @"包邮";
    baoYouLabel.textAlignment = NSTextAlignmentCenter;
    baoYouLabel.layer.cornerRadius = 3;
    baoYouLabel.layer.borderColor = COLOR_Red.CGColor;
    baoYouLabel.layer.borderWidth = 0.5;
    [self addSubview:baoYouLabel];
    self.baoYouLabel = baoYouLabel;
    
    UILabel *manJianLabel = [[UILabel alloc] init];
    manJianLabel.font = [UIFont systemFontOfSize:8];
    manJianLabel.textColor = COLOR_Red;
    manJianLabel.text = @"满减";
    manJianLabel.textAlignment = NSTextAlignmentCenter;
    manJianLabel.layer.cornerRadius = 3;
    manJianLabel.layer.borderColor = COLOR_Red.CGColor;
    manJianLabel.layer.borderWidth = 0.5;
    [self addSubview:manJianLabel];
    self.manJianLabel = manJianLabel;
    
//    UIImageView *carimageView = [[UIImageView alloc]init];
//    carimageView.contentMode = UIViewContentModeScaleAspectFit;
//    carimageView.image = [UIImage imageNamed:@"basket"];
//    [self addSubview:carimageView];
    
    UIButton *carBtn = [[UIButton alloc]init];
    [carBtn setImage:GETIMAGE(@"gouwuche1") forState:UIControlStateNormal];
    [carBtn addTarget:self action:@selector(addShopCar) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:carBtn];
    
    
    iconimageView.sd_layout
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .topSpaceToView(self,0)
    .heightIs(self.frame.size.width);
    
    shuiimageView.sd_layout
    .leftSpaceToView(iconimageView,0)
    .topSpaceToView(iconimageView,0)
    .widthRatioToView(iconimageView,0.2)
    .heightEqualToWidth();
    
    shopLabel.sd_layout
    .centerXEqualToView(shuiimageView)
    .centerYEqualToView(shuiimageView)
    .widthIs(30).heightIs(15).autoHeightRatio(0);
    
    titleLabel.sd_layout
    .leftSpaceToView(self,3)
    .rightSpaceToView(self,3)
    .topSpaceToView(iconimageView,3)
    .heightIs(15).autoHeightRatio(0);
    [titleLabel setMaxNumberOfLinesToShow:2];
    
    priceLabel.sd_layout
    .leftSpaceToView(self,3)
    .bottomSpaceToView(self,10)
    .heightIs(20);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    oldpriceLabel.sd_layout
    .leftSpaceToView(priceLabel,2)
    .bottomEqualToView(priceLabel)
    .heightIs(15);
    [oldpriceLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    baoYouLabel.sd_layout
    .leftSpaceToView(oldpriceLabel,2)
    .centerYEqualToView(priceLabel)
    .heightIs(12).widthIs(20);
    
    manJianLabel.sd_layout
    .leftSpaceToView(baoYouLabel,2)
    .centerYEqualToView(priceLabel)
    .heightIs(12).widthIs(20);
    
    carBtn.sd_layout
    .rightSpaceToView(self,8)
    .bottomSpaceToView(self,10)
    .heightIs(20).widthIs(20);
    
}

-(void)clickShopCarBtn {
    if(self.shopcarBlock) {
        self.shopcarBlock();
    }
}


-(void)setModel:(ModelTopicProductCollection *)model {
    _model = model;
    
    [self.iconimageView sd_setImageWithURL:IMAGE_URL(model.Picture) placeholderImage:nil];
    self.titleLabel.text = model.Name;
    
    NSMutableAttributedString *priceAtt = [[NSMutableAttributedString alloc] initWithString:model.Price];
    [priceAtt setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, 1)];
    self.priceLabel.attributedText = priceAtt;
    
    NSString *str = model.OrignalPrice;
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
    self.oldpriceLabel.attributedText = attribtStr;
    
    self.baoYouLabel.hidden = TSTRING(model.CouponTag)?NO:YES;
    self.baoYouLabel.text = model.CouponTag;
    
    self.manJianLabel.hidden = TSTRING(model.DeliveryTag)?NO:YES;
    self.manJianLabel.text = model.DeliveryTag;
    
    if([model.ProductType isEqualToString:@"1"]) {
        self.shopLabel.text = @"直邮\n商品";
        self.shuiimageView.backgroundColor = HEXCOLOR(0x2BA480);
    }
    if([model.ProductType isEqualToString:@"2"]) {
        self.shopLabel.text = @"保税\n商品";
        self.shuiimageView.backgroundColor = HEXCOLOR(0xFF406F);
    }
    if([model.ProductType isEqualToString:@"3"]) {
        //self.shopLabel.text = @"完税\n商品";
        self.shuiimageView.hidden = YES;
    }
  
}

-(void)setModel2:(ModelMasterSaleProductCollection *)model2 {
    _model2 = model2;
    
    [self.iconimageView sd_setImageWithURL:IMAGE_URL(model2.Picture) placeholderImage:nil];
    self.titleLabel.text = model2.Description;
    
    NSString *priceStr = [NSString strWhithFloat:[model2.Price.Value floatValue]];
    priceStr = [NSString stringWithFormat:@"%@%@",model2.Price.MoneySymbol,priceStr];
    NSMutableAttributedString *priceAtt = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [priceAtt setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} range:[priceStr rangeOfString:model2.Price.MoneySymbol]];
    self.priceLabel.attributedText = priceAtt;
    
    NSString *str = [NSString stringWithFormat:@"%@%@",model2.Price.MoneySymbol,[NSString strWhithFloat:[model2.Price.Value floatValue]]];
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
    self.oldpriceLabel.attributedText = attribtStr;

    self.baoYouLabel.hidden = TSTRING(model2.DeliveryTag)?NO:YES;
    self.baoYouLabel.text = model2.DeliveryTag;
    
    self.manJianLabel.hidden = TSTRING(model2.CouponTag)?NO:YES;
    self.manJianLabel.text = model2.CouponTag;
    
    if([model2.SaleOrderGoodsType isEqualToString:@"1"]) {
        self.shopLabel.text = @"直邮\n商品";
        self.shuiimageView.backgroundColor = HEXCOLOR(0x2BA480);
    }
    if([model2.SaleOrderGoodsType isEqualToString:@"2"]) {
        self.shopLabel.text = @"保税\n商品";
        self.shuiimageView.backgroundColor = HEXCOLOR(0xFF406F);
    }
    if([model2.SaleOrderGoodsType isEqualToString:@"3"]) {
        //self.shopLabel.text = @"完税\n商品";
        self.shuiimageView.hidden = YES;
    }
    
}



-(UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc]init];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 0.5;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = TFont(8);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    return button;
    
}


/**
 加入购物车
 */
- (void)addShopCar
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:@"1" forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    if (self.model) {
        [params setValue:self.model.SaleProductGuid forKey:@"SaleProductGuid"];
    }else{
        [params setValue:self.model2.Guid forKey:@"SaleProductGuid"];
    }
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"添加成功"];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
@end
