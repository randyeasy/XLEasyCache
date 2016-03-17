//
//  XLECommonCache.h
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLECommonCache : XLECache

//长期保存、不备份，磁盘空间不足时会被移除
+ (XLECommonCache *)sharedCache;
//永久保存、备份
+ (XLECommonCache *)sharedBackupCache;
//临时保存，内存不够，或者重启应用可能被删除
+ (XLECommonCache *)sharedTempCache;

//生成一个当前的Cache对象 同样的name和rootPath只会生成一个
+ (XLECommonCache *)cacheWithCacheName:(NSString *)cacheName rootPath:(NSString *)rootPath;

//移除XLECommonCache类保存的所有object
+ (void)removeAllObjects;

@end

NS_ASSUME_NONNULL_END
