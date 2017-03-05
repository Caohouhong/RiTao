//
//  ProductView.h
//  日淘
//
//  Created by 李强 on 2016/12/12.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelProductDetail.h"

@protocol ProductViewDelegate <NSObject>

- (void)clickProductButtonWithProductId:(NSString *)guId;

@end

@interface ProductView : UIView

@property (nonatomic, strong) ModelBrandProduct *model;

@property (nonatomic, weak) id<ProductViewDelegate> delegate;
/**
 您也许还需要 的商品model
 */
@property (nonatomic, strong) ModelSaleProductSimpleDetailCollectionForLinked *modelSaleProductSimpleDetailCollectionForLinked;

@end
