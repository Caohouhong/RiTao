//
//  ProductDetailNeedMoreCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailNeedMoreCell.h"
#import "ProductView.h"
#import "ModelProductDetail.h"

@interface ProductDetailNeedMoreCell ()<ProductViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ProductDetailNeedMoreCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailNeedMoreCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"ProductDetailNeedMoreCell";
    ProductDetailNeedMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailNeedMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = HEXCOLOR(0x666666);
    titleLabel.text = @"您也许还需要";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    
    
    titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .heightIs(18);
    
    CGFloat margin = 15;
    CGFloat itemW = (ScreenWidth - 60)/3;
    CGFloat itemH = ProductViewHeight;
    
    int i = 0;
    for (ModelSaleProductSimpleDetailCollectionForLinked *model in self.dataArray)
    {
        ProductView *productView = [[ProductView alloc] init];
        productView.tag = 100 + i;
        productView.delegate = self;
        productView.modelSaleProductSimpleDetailCollectionForLinked = model;
        [self.contentView addSubview:productView];
        
        long columnIndex = i % 3;
        long rowIndex = i / 3;
        
        productView.frame = CGRectMake(columnIndex * (itemW + margin) + margin, rowIndex * (itemH + margin) + 48, itemW, itemH);
        
        i ++;
    }
}

#pragma mark - ProductViewDelegate
- (void)clickProductButtonWithProductId:(NSString *)productId
{
    if (self.needMoreBlock){
        self.needMoreBlock(productId);
    }
}
@end
