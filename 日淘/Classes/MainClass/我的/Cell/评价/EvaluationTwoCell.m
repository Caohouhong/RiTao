//
//  EvaluationTwoCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/20.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationTwoCell.h"
#import "ACSelectMediaView.h"

@interface EvaluationTwoCell()<UITextViewDelegate>
@property (nonatomic, weak) UITextView *textView;
@end
@implementation EvaluationTwoCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"EvaluationTwoCell";
    EvaluationTwoCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[EvaluationTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    UITextView *textView = [[UITextView alloc] init];
    textView.placeholder = @"写下您对宝贝的评价吧。";
    textView.font = [UIFont systemFontOfSize:13];
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.layer.borderWidth = 0.5;
    textView.delegate = self;
    [self.contentView addSubview:textView];
    self.textView = textView;
    
    textView.sd_layout
    .topSpaceToView(self.contentView,5)
    .leftSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,10)
    .heightIs(100);
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"有图有真相，给小伙伴们晒一晒~";
    nameLabel.font = TFont(13);
    [self.contentView addSubview:nameLabel];
    
    nameLabel.sd_layout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(textView,10)
    .widthIs(ScreenWidth).heightIs(15);
    
    [self _setupViews];
    
}


- (void)_setupViews
{
    //1、得到默认布局高度（唯一获取高度方法）
    CGFloat height = [ACSelectMediaView defaultViewHeight];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, ScreenWidth, height)];
    //2、初始化
    ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
    //3、选择媒体类型：是否仅选择图片或者其他的等
    mediaView.type = ACMediaTypePhotoAndCamera;
    //4、随时获取新的布局高度
    [mediaView observeViewHeight:^(CGFloat value) {
        bgView.height = value;
    }];
    //5、随时获取已经选择的媒体文件
    
    __weak typeof(self) weakSelf =self;
    [mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
        
        
        if (weakSelf.haveChoosePhotoBlock) {
            weakSelf.haveChoosePhotoBlock(list);
        }
        
    }];
    
    [bgView addSubview:mediaView];
    [self.contentView addSubview:bgView];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    if (self.textViewShouldEndEditingBlock) {
        self.textViewShouldEndEditingBlock(textView.text);
    }
    
    return YES;
}

@end
