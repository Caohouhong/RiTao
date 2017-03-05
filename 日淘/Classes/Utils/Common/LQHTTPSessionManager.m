//
//  LQHTTPSessionManager.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/27.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "LQHTTPSessionManager.h"

@implementation LQHTTPSessionManager

#pragma mark - Static Public
+ (instancetype)sharedManager
{
    LQHTTPSessionManager *sessionManager = [LQHTTPSessionManager manager];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    return sessionManager;
}

#pragma mark -
#pragma mark ================= Static Public =================
/**
 *  POST请求
 *
 *  @param parameters           请求参数
 *  @param showTips             请求等待提示
 *  @param success              成功
 *  @param successBackfailError 成功返回的错误信息
 *  @param failure              失败
 */
- (void)LQPostParameters:(id)parameters
     showTips:(NSString *)showTips
      success:(void (^)(id responseObject))success
successBackfailError:(void (^)(id responseObject))successBackfailError
      failure:(void (^)(NSError *error))failure
{
    if (showTips.length)
    {
        [LCProgressHUD showLoading:showTips];
    }
    
    NSString *jsonStr = [NSString dictionaryToJson:parameters];
    NSString *aesStr = [AESCrypt encrypt:jsonStr];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:aesStr forKey:@"data"];
    [params setValue:AppID forKey:@"AppID"];
    
    [self POST:SERVER_URL
    parameters:params
      progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
    
        NSString *responseObjectJson = [AESCrypt decrypt:result];
        DLog(@"\n===========jsonStr===========\n%@", parameters);
        DLog(@"\n===========success===========\n%@", responseObjectJson);
        
        [self parsingRequestBack:responseObjectJson sucess:success successBackfailError:successBackfailError];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n===========jsonStr===========\n%@", parameters);
        DLog(@"\n===========error===========\n%@", error);
        [LCProgressHUD showFailure:@"网络异常，请稍后再试"];
        failure(error);
    }];
}

/**
 *   上传文件请求
 *
 *  @param URLString               请求地址
 *  @param parameters              请求参数
 *  @param fileInfos               请求文件字典数组
 *  @param success                 请求成功
 *  @param successBackfailError    请求成功返回的错误信息
 *  @param failure                 请求失败
 */
- (void)LQPost:(NSString *)URLString
    parameters:(id)parameters
      fileInfo:(NSMutableArray *)fileInfos
      showTips:(NSString *)showTips
       success:(void (^)(id responseObject))success
successBackfailError:(void (^)(id responseObject))successBackfailError
       failure:(void (^)(NSError *error))failure
{
    if (showTips.length)
    {
        [LCProgressHUD showLoading:showTips];
    }
    
    DLog(@"\n===========POST===========\n%@:\n%@", URLString, parameters);
    
    [self POST:SERVER_URL
    parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        int m = 0;
        for (NSDictionary *fileInfo in fileInfos)
        {
            if (fileInfo) {
                [formData appendPartWithFileData:fileInfo[@"kFileData"]
                                            name:fileInfo[@"kName"]
                                        fileName:fileInfo[@"kFileName"]
                                        mimeType:fileInfo[@"kMimeType"]];
            }
            m ++;
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        DLog(@"\n===========success===========\n%@:\n%@", SERVER_URL, responseObject);
        [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n===========error===========\n%@:\n%@", URLString, error);
        [LCProgressHUD showFailure:@"网络异常，请稍后再试"];
        failure(error);
    }];
}

/**
 *  请求成功后的数据解析
 */
- (void)parsingRequestBack:(id)responseObject
                    sucess:(void (^)(id responseObject))success
      successBackfailError:(void (^)(id responseObject))successBackfailError
{
    
    BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
    
    if (baseModel.Result)
    {
        [LCProgressHUD hide];

        success(responseObject);
        
        return;
    }
    else
    {
        [LCProgressHUD showFailure:baseModel.ErrorMessage];
        
        //        successBackfailError(modelFieldError);
    }
}


@end
