//
//  NSObject+Z_Model.h
//  MyCode
//
//  Created by 中付支付 on 2017/5/31.
//  Copyright © 2017年 zzf. All rights reserved.
//

#import <Foundation/Foundation.h>

///模型对象归档解归档实现
#define Z_CodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self z_Decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self z_Encode:encoder]; \
}\
- (id)copyWithZone:(NSZone *)zone { return [self z_Copy]; }

@protocol ModelKeyValueDelegate <NSObject>
@optional

/// 模型类可自定义属性名称<json key名, 替换实际属性名>
+ (NSDictionary <NSString *, NSString *> *)z_ModelReplacePropertyMapper;
/// 模型数组/字典元素对象可自定义类<替换实际属性名,实际类>
+ (NSDictionary <NSString *, Class> *)z_ModelReplaceContainerElementClassMapper;
/// 模型类可自定义属性类型<替换实际属性名,实际类>
+ (NSDictionary <NSString *, Class> *)z_ModelReplacePropertyClassMapper;

@end


@interface NSObject (Z_Model)<ModelKeyValueDelegate>

#pragma mark - json转模型对象 Api -

/** 说明:把json解析为模型对象
 *@param json :json数据对象
 *@return 模型对象
 */
+ (id)z_ModelWithJson:(id)json;

/** 说明:把json解析为模型对象
 *@param json :json数据对象
 *@param keyPath :json key的路径
 *@return 模型对象
 */

+ (id)z_ModelWithJson:(id)json keyPath:(NSString *)keyPath;


#pragma mark - 模型对象转json Api -

/** 说明:把模型对象转换为字典
 *@return 字典对象
 */

- (NSDictionary *)z_Dictionary;

/** 说明:把模型对象转换为json字符串
 *@return json字符串
 */

- (NSString *)z_Json;

#pragma mark - 模型对象序列化 Api -

/// 复制模型对象
- (id)z_Copy;

/// 序列化模型对象
- (void)z_Encode:(NSCoder *)aCoder;

/// 反序列化模型对象
- (void)z_Decode:(NSCoder *)aDecoder;

@end
