//
//  ProductFenLeiChooseVC.h
//  日淘
//
//  Created by 李强 on 2016/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"

typedef void(^FenLeiChooseBLock)(NSMutableArray *fenLeiArray);

@interface ProductFenLeiChooseVC : ChildBaseViewController

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, copy) FenLeiChooseBLock fenLeiChooseBLock;

@end
