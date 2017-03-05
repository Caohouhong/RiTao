//
//  YouHuiJuanModel.m
//  日淘
//
//  Created by 唐硕 on 17/1/10.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "YouHuiJuanModel.h"
#import "ModelMemberSaleCouponCollection.h"


@implementation YouHuiJuanModel


+(NSDictionary *)mj_objectClassInArray {
    return @{@"MemberSaleCouponCollection" : [ModelMemberSaleCouponCollection class]};
}

@end
