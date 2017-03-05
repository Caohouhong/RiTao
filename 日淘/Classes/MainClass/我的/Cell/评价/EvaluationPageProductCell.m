//
//  EvaluationPageProductCell.m
//  日淘
//
//  Created by 唐硕 on 16/12/23.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "EvaluationPageProductCell.h"
#import "ProductCommentImagesView.h"

@interface EvaluationPageProductCell()
@property (nonatomic, strong) ProductCommentImagesView *productCommentImagesView;
@property (nonatomic, strong) PortraitView *portraitView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@end

@implementation EvaluationPageProductCell

+(instancetype)cellWithTableview:(UITableView *)tableview {
    static NSString *idenifier = @"EvaluationPageProductCell";
    EvaluationPageProductCell *cell = [tableview dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil) {
        cell = [[EvaluationPageProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
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
    
    [self addUnderlineWithLeftMargin:15 rightMargin:15 lineHeight:1];
    
    PortraitView *portraitView = [[PortraitView alloc] init];
    [self.contentView addSubview:portraitView];
    self.portraitView = portraitView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = HEXCOLOR(0x333333);
    nameLabel.text = @"姓名姓名姓名姓名姓名";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.text = @"2016-10-22";
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = HEXCOLOR(0x333333);
    contentLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    self.productCommentImagesView = [[ProductCommentImagesView alloc] init];
    [self.contentView addSubview:self.productCommentImagesView];
    
    portraitView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .widthIs(25)
    .heightIs(25);
    
    nameLabel.sd_layout
    .leftSpaceToView(portraitView,10)
    .topEqualToView(portraitView)
    .rightSpaceToView(self.contentView,40)
    .heightIs(18);
    
    timeLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(nameLabel)
    .heightIs(15);
    [timeLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    contentLabel.sd_layout
    .leftEqualToView(nameLabel)
    .topSpaceToView(portraitView,10)
    .rightSpaceToView(self.contentView,36)
    .autoHeightRatio(0);
    
    self.productCommentImagesView.sd_layout
    .leftEqualToView(contentLabel);
    
    NSMutableArray *picArray = [NSMutableArray arrayWithObjects:@"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                                @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                                @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg", nil];
    self.productCommentImagesView.picPathStringsArray = picArray;
    
    self.productCommentImagesView.sd_layout
    .topSpaceToView(self.contentLabel, 10);

}

-(void)setModel:(BaseModel *)model {
    _model = model;
    
//    [self.portraitView.portraitImageView sd_setImageWithURL:IMAGE_URL(model.MemberAvatar) placeholderImage:[UIImage imageNamed:@"default"]];
//    self.nameLabel.text = model.MemberNickName;
//    self.contentLabel.text = model.Content;
    
    NSMutableArray *picArray = [NSMutableArray array];
    
//    for (NSString *str in model.PictureList)
//    {
//        [picArray addObject:IMAGEURLSTR(str)];
//    }
    
    self.productCommentImagesView.picPathStringsArray = picArray;
    
    CGFloat picContainerTopMargin = 0;
    if (picArray.count)
    {
        picContainerTopMargin = 10;
    }
    self.productCommentImagesView.sd_layout
    .topSpaceToView(self.contentLabel, picContainerTopMargin);
    
    [self setupAutoHeightWithBottomView:self.productCommentImagesView bottomMargin:15];
    
    
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
