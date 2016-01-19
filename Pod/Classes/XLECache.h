//
//  XLECache.h
//  BJEducation
//
//  Created by Randy on 15/11/30.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLECache : NSObject
@property (copy, readonly) NSString *name;
@property (copy, readonly) NSString *rootPath;

/**
 *  获取一个cache实体，
 *  同name和rootPath返回同一个
 *
 *  @param name     cache名称，比如Model数据类的cache类 为空为默认值
 *  @param rootPath 根目录 为空时，不会保存和获取数据
 *
 *  @return
 */
- (instancetype)initWithName:(nullable NSString *)name
                    rootPath:(NSString *)rootPath;

- (id)objectForKey:(NSString *)key;
/**
 *  根据key设置value
 *
 *  @param object 可为空
 *  @param key    不能为空
 */
- (void)setObject:(nullable id <NSCoding>)object forKey:(NSString *)key;
- (void)removeObjectForKey:(NSString *)key;

/**
 *  移除单个cache的数据
 */
- (void)removeAllObjects;

@end

NS_ASSUME_NONNULL_END
