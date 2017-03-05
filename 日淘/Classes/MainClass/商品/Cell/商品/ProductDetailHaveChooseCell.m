//
//  ProductDetailHaveChooseCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailHaveChooseCell.h"
#import "EYTagView.h"

@interface ProductDetailHaveChooseCell ()<EYTagViewDelegate>

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (strong, nonatomic) EYTagView *tagView;

@end

@implementation ProductDetailHaveChooseCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailHaveChooseCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ProductDetailHaveChooseCell";
    ProductDetailHaveChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailHaveChooseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:0 rightMargin:0 lineHeight:3 backgroundColor:LQRGBColor(244, 244, 244, 1)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x999999);
    titleLabel.text = @"已选";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
//    UILabel *contentLabel = [[UILabel alloc] init];
//    contentLabel.font = [UIFont systemFontOfSize:12];
//    contentLabel.textColor = HEXCOLOR(0x333333);
//    contentLabel.text = @"牛栏5段";
//    [self.contentView addSubview:contentLabel];
//    self.contentLabel = contentLabel;
    
//    UIImageView *moreImageView = [[UIImageView alloc] init];
//    moreImageView.image = [UIImage imageNamed:@"productDetailMore"];
//    [self.contentView addSubview:moreImageView];
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(60);
    
//    moreImageView.sd_layout
//    .rightSpaceToView(self.contentView,15)
//    .centerYEqualToView(self.contentView)
//    .widthIs(20)
//    .heightIs(4);
//    
//    contentLabel.sd_layout
//    .leftSpaceToView(titleLabel,10)
//    .centerYEqualToView(titleLabel)
//    .heightRatioToView(titleLabel,1)
//    .rightSpaceToView(moreImageView,10);
    
    
    
    _tagView = [[EYTagView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-85, 0)];
    [self.contentView addSubview:_tagView];
    _tagView.translatesAutoresizingMaskIntoConstraints=YES;
    _tagView.delegate=self;
    
    _tagView.colorTag=COLORRGB(0xffffff);
    _tagView.colorTagBg=COLOR_Black;
    _tagView.selectBgColor = COLOR_Red2;
    _tagView.selectTextColor = HEXCOLOR(0xffffff);
    _tagView.viewMaxHeight=1000000;
    _tagView.type = EYTagView_Type_Single_Selected;
    _tagView.tagHeight = 26.0;
    _tagView.tagPaddingSize = CGSizeMake(10, 10);
    
    _tagView.sd_layout
    .leftSpaceToView(titleLabel,10)
    .centerYEqualToView(self.contentView);
    
    
}

- (void)setDataArray:(NSArray *)dataArray
{
    if (_dataArray.count)
    {
        if (self.chooseIndex > -1)
        {
            ModelSaleProductDetail *model = dataArray[self.chooseIndex];
            NSMutableArray *array = [NSMutableArray arrayWithArray:@[model.ShortDescription]];
            [_tagView setTagStringsSelected:array];
        }
        
        [self setupAutoHeightWithBottomViewsArray:@[self.titleLabel,self.tagView] bottomMargin:10];
        return;
    }
    else
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
            ModelSaleProductDetail *model = dataArray[self.chooseIndex];
            NSMutableArray *array = [NSMutableArray arrayWithArray:@[model.ShortDescription]];
            [_tagView setTagStringsSelected:array];
        }
        
        [self setupAutoHeightWithBottomViewsArray:@[self.titleLabel,self.tagView] bottomMargin:10];
    }
}

-(void)heightDidChangedTagView:(EYTagView *)tagView{
    NSLog(@"heightDidChangedTagView=====>%f",tagView.frame.size.height);
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
            
            return;
        }
        
        i ++;
    }
    
}

@end
