//
//  XLEUserCache.h
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLEUserCache : XLECache
@property (copy, nullable, readonly) NSString *userName;

/**
 *  userName生成对应的目录，不互相干扰
 *
 *  @param userName 用户名，如果有角色区分，需要拼接角色id
 *  userName为空后不会保存和读取到数据
 */
+ (void)registerCacheWithUserName:(nullable NSString *)userName;

//长期保存、不备份 根据name生成目录
+ (XLEUserCache *)sharedCache;
//永久保存、itunes备份
+ (XLEUserCache *)sharedBackUpCache;
//临时保存，内存不够，或者重启应用可能被删除
+ (XLEUserCache *)sharedTempCache;
//生成一个当前的Cache对象
+ (XLEUserCache *)userCacheWithCacheName:(NSString *)cacheName rootPath:(NSString *)rootPath;

//移除当前用户的数据
+ (void)removeAllObjects;

@end

NS_ASSUME_NONNULL_END
