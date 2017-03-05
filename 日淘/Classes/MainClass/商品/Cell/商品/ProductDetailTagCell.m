//
//  ProductDetailTagCell.m
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ProductDetailTagCell.h"
#import "ProductDetailTagView.h"
#import "ModelProductDetail.h"

@interface ProductDetailTagCell ()

@property (nonatomic, strong) NSMutableArray *dataArray;


@end


@implementation ProductDetailTagCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataArray:(NSMutableArray *)dataArray
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.dataArray = dataArray;
        [self drawView];
    }
    
    return self;
}

+ (ProductDetailTagCell *)cellWithTableView:(UITableView *)tableView dataArray:(NSMutableArray *)dataArray
{
    static NSString *idenifier = @"ProductDetailTagCell";
    ProductDetailTagCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ProductDetailTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier dataArray:dataArray];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:2];
    
    int i = 0;
    for (ModelSaleProductSpecialCollection *model in self.dataArray)
    {
        NSDictionary *dic = @{kImage:model.Picture,kTitle:model.Description};
        
        ProductDetailTagView *productDetailTagView = [[ProductDetailTagView alloc] init];
        productDetailTagView.dataDic = dic;
        [self.contentView addSubview:productDetailTagView];
        
        CGFloat itemW = (ScreenWidth - 30)/4;
        CGFloat itemH = productDetailTagViewItemH;
        int columnIndex = i % 4;
        long rowIndex = i / 4;
        
        productDetailTagView.frame = CGRectMake(15 + columnIndex * itemW, rowIndex * itemH, itemW, itemH);
        
        i ++;
    }
}

@end
