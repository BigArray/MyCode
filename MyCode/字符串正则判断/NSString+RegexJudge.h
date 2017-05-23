//
//  NSString+RegexJudge.h
//  MyCode
//
//  Created by 中付支付 on 2017/5/23.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegexJudge)

/** 邮箱验证 */
- (BOOL)isValidEmail;

/** 手机号码验证 */
- (BOOL)isValidPhoneNum;

/** 车牌号验证 */
- (BOOL)isValidCarNo;

/** 网址验证 */
- (BOOL)isValidUrl;

/** 邮政编码 */
- (BOOL)isValidPostalcode;

/** 纯汉字 */
- (BOOL)isValidChinese;

/**
 @brief     是否符合IP格式，xxx.xxx.xxx.xxx
 */
- (BOOL)isValidIP;

/** 身份证验证 */
- (BOOL)isValidIdCardNum;

/** 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank;

/** 去掉html格式 */
- (NSString *)removeHtmlFormat;

/** 工商税号 */
- (BOOL)isValidTaxNo;

@end
