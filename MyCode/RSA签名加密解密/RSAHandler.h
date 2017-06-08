//
//  RSAHandler.h
//  MyCode
//
//  Created by 张振飞 on 2017/5/22.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    KeyTypePublic = 0,
    KeyTypePrivate
}KeyType;

@interface RSAHandler : NSObject

- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

//验证签名 Sha1 + RSA
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;
//验证签名 md5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;
//签名 Sha1 + RSA
- (NSString *)signString:(NSString *)string;
//签名 md5 + RSA
- (NSString *)signMD5String:(NSString *)string;

//公钥加密
- (NSString *) encryptWithPublicKey:(NSString*)content;
//私钥解密
- (NSString *) decryptWithPrivatecKey:(NSString*)content;
//公钥解密
- (NSString *) decryptWithPublicKey:(NSString *)content;
//私钥加密
- (NSString *) encryptWithPriviteKey:(NSString*)content;

//sha256签名
- (NSString *)sha256SignWith:(NSString *)input;
//sha256加密
- (NSString *)sha256EcryptWith:(NSString *)input Key:(NSString *)key;


@end
