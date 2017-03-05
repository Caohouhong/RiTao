//
//  AddReceiptAddressModel.h
//  日淘
//
//  Created by 唐硕 on 16/12/14.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ModelIDCardInfo;

@interface AddReceiptAddressModel : NSObject

@property (nonatomic, copy) NSString *MemberGuid;
@property (nonatomic, strong) NSString *MobilePhone;
@property (nonatomic, copy) NSString *Guid;  // 名称
@property (nonatomic, copy) NSString *Tag; //手机号码
@property (nonatomic, assign) BOOL IsDefault; //0为不默认 1为默认
@property (nonatomic, strong) ModelIDCardInfo *IDCardInfo;



//@property (nonatomic, assign) BOOL isSelect;

@end
