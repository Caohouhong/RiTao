//
//  LQConfig.h
//  ZhouMo
//
//  Created by liqiang on 2016/11/3.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#ifndef LQConfig_h
#define LQConfig_h


#if 0 //测试服务器
#define IP                         @"http://testinterface.rt315.com/jsonrequest.aspx"
#define SERVER_URL                 @"http://testinterface.rt315.com/jsonrequest.aspx"
#else//证书服务器
#define IP                         @"http://testinterface.rt315.com/jsonrequest.aspx"
#define SERVER_URL                 @"http://testinterface.rt315.com/jsonrequest.aspx"
#endif

#define AppID                      @"2389517"



#define VIDEO_DOWNLOAD_URL(urlStr) [NSString stringWithFormat:@"%@%@",VIDEO_DOWNLOAD_BASEURL,urlStr]
#define IMAGEURLSTR(urlStr)        [[urlStr stringByReplacingOccurrencesOfString:@"\\" withString:@"/"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]
#define IMAGE_URL(urlStr)          [NSURL URLWithString:IMAGEURLSTR(urlStr)]
#define DELEGATE_URL               @"http://www.zhoumopark.com:8788/index.html"
#define Ticket_URL                 @"http://www.zhoumopark.com:8788/ticket.html"//优惠券说明
#define AboutUs_URL                @"http://www.zhoumopark.com:8789/zmbackprj/aboutUs.action"
#define AliPayCallBack             [NSString stringWithFormat:@"%@/zmprj/alipayMemberSuccess.action",IP]
#define WeiXinCallBack             [NSString stringWithFormat:@"%@/zmprj/wxpayMemberSuccess.action",IP]


#define VIDEO_DOWNLOAD_BASEURL     @"http://imgcdn.zhoumopark.com/zmaudio"
#define IMAGES_OSS_PIC             @"http://imgcdn.zhoumopark.com/zmpic"
#define IMAGES_ICON_BIG            @"http://imgcdn.zhoumopark.com/zmpic"
#define IMAGES_ICON_SAMLL          @"http://imgcdn.zhoumopark.com/zmpic"
#define LIVE_URL                   @"http://live.zhoumopark.com"//直播URL
#define LIVE_URL2                  @"http://imgcdn.zhoumopark.com/zmaudio"//往期直播URL

/**
 *  1表示fir 2表示appstore
 */
#define VersionInfoId 2

//QQ
#define APPKEY_QQ                  @"1105680264"
#define APPSECRET_QQ               @"p27QEt3ZZ33kpQo6"

//微博
#define APPKEY_WEIBO               @"3579242948"
#define APPSECRET_WEIBO            @"fc53bc735e7e25617c219236f8214278"

//微信
#define APPKEY_WECHAT              @"wxb42e236277b4f786"
#define APPSECRET_WECHAT           @"b79e7580d1ab3f2ac9c04eabab94f804"

//支付宝
#define alipat_appScheme           @"com.baichun.ritaoV2"


#endif /* LQConfig_h */
