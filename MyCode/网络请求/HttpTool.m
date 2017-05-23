//
//  HttpTool.m
//  MyCode
//
//  Created by 张振飞 on 2017/5/22.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"


#define isbeforeIOS7 ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0?YES:NO)

@implementation HttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    //为url编码
    NSString *urlStr = [self urlCoding:url];
    // 2.发送请求
    [[self getHttpSessionManager] POST:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    //为url编码
    NSString *urlStr = [self urlCoding:url];
    // 2.发送请求
    
    [[self getHttpSessionManager] GET:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        if (failure) {
            NSLog(@"网络请求日志\n请求URL：%@ \n信息：%@",url,[error.userInfo objectForKey:@"NSLocalizedDescription"]);
            failure(error);
        }
        
    }];
}

+ (AFHTTPSessionManager *)getHttpSessionManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", @"application/html", nil];
    
    /**
     AFSecurityPolicy分三种验证模式：
     AFSSLPinningModeNone:只是验证证书是否在信任列表中
     AFSSLPinningModeCertificate：该模式会验证证书是否在信任列表中，然后再对比服务端证书和客户端证书是否一致
     AFSSLPinningModePublicKey：只验证服务端证书与客户端证书的公钥是否一致
     */
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [securityPolicy setValidatesDomainName:NO];//是否需要验证域名，默认YES
    [securityPolicy setAllowInvalidCertificates:YES];//是否允许使用自签名证书
    
    [manager setSecurityPolicy:securityPolicy];
    
    return manager;
}

#pragma mark url编码
+ (NSString *)urlCoding:(NSString *)url{
    NSString *encodePath ;
    if (isbeforeIOS7) {
        encodePath = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        encodePath = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    }
    return encodePath;
}



@end
