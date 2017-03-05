//
//  PopDetailsPageView.m
//  日淘
//
//  Created by 唐硕 on 16/12/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PopDetailsPageView.h"
#import "CountView.h"
#import "EYTagView.h"
#import "PurchaseCarAnimationTool.h"

#define BACKVIEW_W 250

@interface PopDetailsPageView()<EYTagViewDelegate>
@property (nonatomic, weak) UIView *backView;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIView *lineViewT;
@property (nonatomic, weak) UIButton *shuiLabel;
@property (nonatomic, weak) UITextField *numLabel;
@property (nonatomic, weak) UIButton *guigeBtn;
@property (strong, nonatomic) EYTagView *tagView;
@property (nonatomic, weak) UIImageView *iconimageView;
@property (nonatomic, weak) UILabel *kuLabel;
@property (nonatomic, weak) UILabel *priceLabel;
@property (nonatomic, strong) ModelSaleProductDetail *modelSaleProductDetail;

@end
@implementation PopDetailsPageView

+ (instancetype)shareInstance
{
//    static PopDetailsPageView *shareInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        shareInstance = [[PopDetailsPageView alloc] init];
//    });
    
    PopDetailsPageView *shareInstance = [[PopDetailsPageView alloc] init];
    [shareInstance showBottomView];
    return shareInstance;
}

-(instancetype)init {
    if(self  = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicktap)];
        [self addGestureRecognizer:tap];
        
        [self initView];
    }
    return self;
    
}


-(void)clicktap {
    
    [self removeView];
    
    if(self.removeBlock) {
        self.removeBlock();
    }
}

-(void)initView
{
    //背景view
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, BACKVIEW_W)];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    self.backView = backView;
    //最上面
    UIImageView *iconimageView = [[UIImageView alloc]init];
    //iconimageView.backgroundColor =[UIColor orangeColor];
    iconimageView.layer.cornerRadius = 5;
    iconimageView.layer.borderWidth = 0.5;
    iconimageView.layer.borderColor = COLOR_LineViewColor.CGColor;
    iconimageView.clipsToBounds = YES;
    [backView addSubview:iconimageView];
    self.iconimageView = iconimageView;
    
    UIButton *xBtn = [[UIButton alloc]init];
    //[xBtn setTitle:@"X" forState:UIControlStateNormal];
    [xBtn setImage:[UIImage imageNamed:@"ic_close_popup"] forState:UIControlStateNormal];
    [xBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UILabel *kuLabel = [[UILabel alloc]init];
    kuLabel.text = @"";
    kuLabel.font = TFont(12);
    [backView addSubview:kuLabel];
    self.kuLabel = kuLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.text = @"¥0.00";
    priceLabel.font = TFont(14);
    priceLabel.textColor = [UIColor redColor];
    [backView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UIView *lineO = [self lineView];
    [backView addSubview:lineO];
    
    iconimageView.sd_layout
    .leftSpaceToView(backView,15)
    .topSpaceToView(backView,-15)
    .widthIs(70).heightIs(70);
    
    xBtn.sd_layout
    .rightSpaceToView(backView,13)
    .topSpaceToView(backView,10)
    .widthIs(22).heightIs(22);
    
    lineO.sd_layout
    .topSpaceToView(iconimageView,15)
    .leftSpaceToView(backView,0)
    .rightSpaceToView(backView,0)
    .heightIs(0.5);
    
    kuLabel.sd_layout
    .leftSpaceToView(iconimageView,10)
    .bottomEqualToView(iconimageView)
    .widthIs(200).heightIs(15);
    
    priceLabel.sd_layout
    .leftSpaceToView(iconimageView,10)
    .bottomSpaceToView(kuLabel,0)
    .widthIs(200).heightIs(17);
    
    //最下面
    UIButton *queBtn = [[UIButton alloc]init];
    queBtn.backgroundColor = COLOR_Red2;
    queBtn.titleLabel.font = TFont(14);
    [queBtn setTitle:@"确定" forState:UIControlStateNormal];
    [queBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [queBtn addTarget:self action:@selector(ensure) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:queBtn];
    
    queBtn.sd_layout
    .leftSpaceToView(backView,0)
    .rightSpaceToView(backView,0)
    .bottomSpaceToView(backView,0)
    .heightIs(40);
    
    //中间规格 购买 税率的背景
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [backView addSubview:scrollView];
    self.scrollView = scrollView;
    
    scrollView.sd_layout
    .leftSpaceToView(backView,0)
    .rightSpaceToView(backView,0)
    .topSpaceToView(lineO,0)
    .bottomSpaceToView(queBtn,0);
    
    UILabel *guiLabel = [self createLabelWithTitle:@"规格:"];
    [scrollView addSubview:guiLabel];
    
    
    _tagView = [[EYTagView alloc] initWithFrame:CGRectMake(80, 7, ScreenWidth - 100, 0)];
    [scrollView addSubview:_tagView];
    _tagView.translatesAutoresizingMaskIntoConstraints=YES;
    _tagView.delegate=self;
    
    _tagView.colorTag=COLORRGB(0xffffff);
    _tagView.colorTagBg=COLOR_Black;
    _tagView.selectBgColor = COLOR_Red2;
    _tagView.selectTextColor = HEXCOLOR(0xffffff);
    _tagView.viewMaxHeight=1000000;
    _tagView.tagHeight = 23.0;
    _tagView.type = EYTagView_Type_Single_Selected;
    _tagView.tagPaddingSize = CGSizeMake(10, 10);
    
    UIView *lineT = [self lineView];
    [scrollView addSubview:lineT];
    self.lineViewT = lineT;
    
    UILabel *gouLabel = [self createLabelWithTitle:@"购买数量:"];
    [scrollView addSubview:gouLabel];
    
    UIView *numView = [[UIView alloc]init];
    numView.layer.borderColor = COLOR_LineViewColor.CGColor;
    numView.layer.borderWidth = 1.0;
    [scrollView addSubview:numView];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    addBtn.titleLabel.font = TFont(14);
    [addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(clickadd) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:addBtn];
    
    UIButton *minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    minusBtn.titleLabel.font = TFont(14);
    [minusBtn setTitle:@"-" forState:UIControlStateNormal];
    [minusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [minusBtn addTarget:self action:@selector(clickjian) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:minusBtn];
    
    UITextField *numLabel = [[UITextField alloc]init];
    numLabel.text = @"1";
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.font = TFont(14);
    [numView addSubview:numLabel];
    self.numLabel = numLabel;
    
    UIView *numlineView1 =[self lineView];
    [numView addSubview:numlineView1];
    
    UIView *numlineView2 =[self lineView];
    [numView addSubview:numlineView2];
    
    UIView *lineTh = [self lineView];
    [scrollView addSubview:lineTh];
    
    UILabel *benLabel = [self createLabelWithTitle:@"本商品税率: 11.9% "];
    [scrollView addSubview:benLabel];
    
    UIButton *shuiLabel = [[UIButton alloc]init];
    shuiLabel.titleLabel.font = TFont(13);
    shuiLabel.layer.borderColor = COLOR_Red2.CGColor;
    shuiLabel.layer.borderWidth = 1.0;
    [shuiLabel setTitle:@"本商城商品包税!" forState:UIControlStateNormal];
    [shuiLabel setTitleColor:COLOR_Red2 forState:UIControlStateNormal];
    shuiLabel.layer.cornerRadius = 5;
    //UILabel *shuiLabel = [[UILabel alloc]init];
//    shuiLabel.text = @"本商城商品包税!";
//    shuiLabel.font = TFont(14);
//    shuiLabel.textColor = COLOR_Red2;
//    shuiLabel.textAlignment = NSTextAlignmentCenter;
//    shuiLabel.layer.borderColor = COLOR_Red2.CGColor;
//    shuiLabel.layer.borderWidth = 1.0;
    [scrollView addSubview:shuiLabel];
    self.shuiLabel = shuiLabel;
    
    guiLabel.sd_layout
    .leftSpaceToView(scrollView,15)
    .topSpaceToView(scrollView,10)
    .widthIs(50).heightIs(18);
    
//    _tagView.sd_layout
//    .leftSpaceToView(guiLabel,10)
//    .rightSpaceToView(scrollView,10)
//    .topEqualToView(guiLabel);
    
    lineT.sd_layout
    .topSpaceToView(_tagView,10)
    .leftSpaceToView(scrollView,0)
    .rightSpaceToView(scrollView,0)
    .heightIs(0.5);
    
    gouLabel.sd_layout
    .leftSpaceToView(scrollView,15)
    .topSpaceToView(lineT,10)
    .widthIs(100).heightIs(18);
    
    numView.sd_layout
    .rightSpaceToView(scrollView,10)
    .centerYEqualToView(gouLabel)
    .widthIs(80).heightIs(25);
    
    numlineView1.sd_layout
    .leftSpaceToView(numView,25)
    .topSpaceToView(numView,0)
    .bottomSpaceToView(numView,0)
    .widthIs(0.5);
    
    numlineView2.sd_layout
    .rightSpaceToView(numView,25)
    .topSpaceToView(numView,0)
    .bottomSpaceToView(numView,0)
    .widthIs(0.5);
    
    addBtn.sd_layout
    .rightSpaceToView(numView,0)
    .topSpaceToView(numView,0)
    .bottomSpaceToView(numView,0)
    .widthIs(25);
    
    numLabel.sd_layout
    .rightSpaceToView(addBtn,0)
    .topSpaceToView(numView,0)
    .bottomSpaceToView(numView,0).widthIs(30);
    
    minusBtn.sd_layout
    .rightSpaceToView(numLabel,0)
    .topSpaceToView(numView,0)
    .bottomSpaceToView(numView,0).widthIs(25);

    lineTh.sd_layout
    .topSpaceToView(gouLabel,10)
    .leftSpaceToView(scrollView,0)
    .rightSpaceToView(scrollView,0)
    .heightIs(0.5);
    
    benLabel.sd_layout
    .leftSpaceToView(scrollView,15)
    .topSpaceToView(lineTh,10)
    .widthIs(150).heightIs(18);
    
    shuiLabel.sd_layout
    .rightSpaceToView(scrollView,10)
    .centerYEqualToView(benLabel)
    .heightIs(22).widthIs(120);
    //shuiLabel.sd_cornerRadiusFromHeightRatio = @(0.5);
    //[shuiLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    
}

-(void)clickadd {
    
    NSInteger count = [self.numLabel.text integerValue] + 1;
    self.numLabel.text = [NSString stringWithFormat:@"%zd", count];
}

-(void)clickjian {
    NSInteger count = [self.numLabel.text integerValue] - 1;
    if (count <= 0) {
        return;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%zd", count];
}


-(void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    
    NSMutableArray *array = [NSMutableArray array];
    for (ModelSaleProductDetail *model in dataArray)
    {
        [array addObject:model.ShortDescription];
    }
    
    [_tagView addTags:array];
    
    if (self.chooseIndex > -1)
    {
        self.modelSaleProductDetail = dataArray[self.chooseIndex];
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[self.modelSaleProductDetail.ShortDescription]];
        [_tagView setTagStringsSelected:array];
        [self requestDataWithId:self.modelSaleProductDetail.Guid];
    }
    
    [self.scrollView setupAutoContentSizeWithBottomView:self.shuiLabel bottomMargin:10];
    
}

-(void)touchbtn:(UIButton *)btn {

    
    self.guigeBtn.selected = NO;
    self.guigeBtn.layer.borderColor = self.guigeBtn.selected? [UIColor redColor].CGColor : [UIColor blackColor].CGColor;
    btn.selected  = YES;
    self.guigeBtn = btn;
    self.guigeBtn.layer.borderColor = self.guigeBtn.selected? [UIColor redColor].CGColor : [UIColor blackColor].CGColor;
    
}


-(void)removeView {
    [_tagView removeAllArrays];
    [self hiddenBottomView];
}

-(void)showBottomView {
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.top = ScreenHeight-BACKVIEW_W;
    } completion:^(BOOL finished) {
    }];
}

-(void)hiddenBottomView {
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.top = ScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(UIView *)lineView {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = COLOR_LineViewColor;
    return view;
}

-(UILabel *)createLabelWithTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc]init];
    label.font = TFont(14);
    label.text = title;
    return label;
}

- (void)tagViewDidClickWithTagStr:(NSString *)tagStr
{
    NSLog(@"=====>%@",tagStr);
    
    int i = 0;
    for (ModelSaleProductDetail *model in self.dataArray)
    {
        if ([model.ShortDescription isEqualToString:tagStr])
        {
            if (self.didChooseGuiGeBlock) {
                self.didChooseGuiGeBlock(i);
            }
            [self requestDataWithId:model.Guid];
            
            return;
        }
        i ++;
    }
}

-(void)heightDidChangedTagView:(EYTagView *)tagView{
    NSLog(@"heightDidChangedTagView=====>%f",tagView.frame.size.height);
}

#pragma mark -
#pragma mark ================= 网络 =================
/**
 获取商品详情
 */
- (void)requestDataWithId:(NSString *)guid
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetSaleProductDetailAction" forKey:@"Action"];
    [params setValue:guid forKey:@"SaleProductID"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberID"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        ModelProductDetail *model = [ModelProductDetail mj_objectWithKeyValues:responseObject];
        
        self.modelSaleProductDetail = model.SaleProductDetail;
        
        for (ModelSaleProductPictureCollection *modelmodel in self.modelSaleProductDetail.SaleProductPictureCollection)
        {
            if (modelmodel.MainPicture)
            {
                [self.iconimageView sd_setImageWithURL:IMAGE_URL(modelmodel.Picture) placeholderImage:[UIImage imageNamed:@"default"]];
                break;
            }
        }
        
        self.priceLabel.text = [NSString stringWithFormat:@"%@ %@",self.modelSaleProductDetail.Price.MoneySymbol,self.modelSaleProductDetail.Price.Value];
        self.kuLabel.text = self.modelSaleProductDetail.StockInfo;
    
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


/**
 加入购物车
 */
- (void)ensure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.AddToShopCartAction" forKey:@"Action"];
    [params setValue:@"cced1f94-426a-4ebc-b773-f306524f0d6a" forKey:@"MemberGuid"];
    [params setValue:self.modelSaleProductDetail.Guid forKey:@"SaleProductGuid"];
    [params setValue:self.numLabel.text forKey:@"Quantity"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager] LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        
        if (self.didAddShopCarSuccess) {
            self.didAddShopCarSuccess();
        }

        [self removeView];
        
        [[PurchaseCarAnimationTool shareTool]startAnimationandView:self.iconimageView andRect:self.iconimageView.frame andFinisnRect:CGPointMake(ScreenWidth/7*3, ScreenHeight-49) andFinishBlock:^(BOOL finisn){
//            UIView *tabbarBtn = self.tabBarController.tabBar.subviews[3];
//            [PurchaseCarAnimationTool shakeAnimation:tabbarBtn];
                [LCProgressHUD showSuccess:@"添加成功"];
        }];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
