//
//  TaoKeProductThreeCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/30.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "TaoKeProductThreeCell.h"
#import "TaokeView.h"

#import "MyUserVC.h"
#import "XiaoShouDingDanVC.h"

@implementation TaoKeProductThreeCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"TaoKeProductThreeCell";
    TaoKeProductThreeCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[TaoKeProductThreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UIView *lineViewo = [[UIView alloc]init];
    lineViewo.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineViewo];
    
    UIView *lineViewt = [[UIView alloc]init];
    lineViewt.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineViewt];
    
    lineViewo.sd_layout
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView, ScreenWidth/3)
    .widthIs(1);
    
    lineViewt.sd_layout
    .topSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .leftSpaceToView(lineViewo, ScreenWidth/3)
    .widthIs(1);
    
    NSArray *titleArray = @[@"二维码", @"我的客户", @"销售订单"];
    NSArray *subArray = @[@"推广二维码", @"", @"36个订单"];
    NSArray *imageArray = @[@"erweima", @"wodekehu", @"xiaoshoudingdan"];
    
    for (int i = 0; i < titleArray.count; i++) {
        CGRect frame = CGRectMake(i*ScreenWidth/3 , 0, ScreenWidth/3, 90);
        TaokeView *btnView = [[TaokeView alloc]initWithFrame:frame title:titleArray[i] imagestr:imageArray[i] subtitle:subArray[i]];
        btnView.tag = 100+i;
        [self.contentView addSubview:btnView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OneTapClick:)];
        [btnView addGestureRecognizer:tap];
    }

}


-(void)OneTapClick:(UITapGestureRecognizer *)tap {
    NSLog(@"%ld",tap.view.tag);
    if(tap.view.tag == 100) {
        
    }else if (tap.view.tag == 101) {
        MyUserVC *vc = [[MyUserVC alloc]init];
        [DCURLRouter pushViewController:vc animated:YES];
    }else {
        XiaoShouDingDanVC *vc = [[XiaoShouDingDanVC alloc]init];
        [DCURLRouter pushViewController:vc animated:YES];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
