//
//  WebViewVC.m
//  日淘
//
//  Created by 李强 on 2017/1/16.
//  Copyright © 2017年 LiQiang. All rights reserved.
//

#import "WebViewVC.h"
#import "ModelURLLink.h"

@interface WebViewVC ()

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self requestData];
}

- (void)drawViewWithUrl:(NSURL *)url
{
    UIWebView *webView = [[UIWebView alloc] init];
    [self.view addSubview:webView];
    
    webView.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)requestData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.UrlLinkType forKey:@"UrlLinkType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetFixedUrlLinkResult" forKey:@"ResultType"];
    [params setValue:@"RiTaoErp.Business.Front.Actions.GetFixedUrlLinkAction" forKey:@"Action"];
    [params setValue:AppID forKey:@"AppID"];
    
    [[LQHTTPSessionManager sharedManager]LQPostParameters:params showTips:@"正在加载..." success:^(id responseObject) {
        
        ModelURLLink *model = [ModelURLLink mj_objectWithKeyValues:responseObject];
        
        [self drawViewWithUrl:[NSURL URLWithString:model.UrlLink]];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
