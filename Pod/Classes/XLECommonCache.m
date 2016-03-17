//
//  XLECommonCache.m
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECommonCache.h"
#import "XLECache+XLEInternal.h"

@interface XLECommonCache ()
@end

@implementation XLECommonCache

- (instancetype)initWithName:(NSString *)name rootPath:(NSString *)rootPath
{
    self = [super initWithName:name rootPath:rootPath];
    if (self) {
        [[XLECommonCache cacheList] addObject:self];
    }
    return self;
}

//长期保存、不备份 根据name生成目录
+ (XLECommonCache *)sharedCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithName:nil rootPath:[XLECache cacheRootDir]];
    });
    return sharedInstance;
}

//临时保存，内存不够，或者重启应用可能被删除
+ (XLECommonCache *)sharedTempCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithName:nil rootPath:[XLECache tempRootDir]];
    });
    return sharedInstance;
}

//长期保存、备份
+ (XLECommonCache *)sharedBackupCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithName:nil rootPath:[XLECache libraryRootDir]];
    });
    return sharedInstance;
}

//生成一个当前的Cache对象
+ (XLECommonCache *)cacheWithCacheName:(NSString *)cacheName rootPath:(NSString *)rootPath;
{
    if (cacheName.length<=0 || rootPath.length<=0) {
        return nil;
    }
    XLECommonCache *cache = [XLECommonCache findCacheWithName:cacheName rootPath:rootPath];
    if (cache) {
        return cache;
    }
    cache = [[XLECommonCache alloc] initWithName:cacheName rootPath:rootPath];
    return cache;
}

+ (void)removeAllObjects;
{
    [[XLECommonCache sharedCache] removeAllObjects];
    [[XLECommonCache sharedTempCache] removeAllObjects];
    for (XLECommonCache *oneCache in [XLECommonCache cacheList]) {
        [oneCache removeAllObjects];
    }
}

#pragma mark - internal
+ (XLECommonCache *)findCacheWithName:(nonnull NSString *)name rootPath:(nonnull NSString *)rootPath
{
    for (XLECommonCache *oneCache in [XLECommonCache cacheList]) {
        if ([oneCache isSameCacheWithName:name rootPath:rootPath]) {
            return oneCache;
        }
    }
    return nil;
}
- (BOOL)isSameCacheWithName:(NSString *)name rootPath:(NSString *)rootPath
{
    if ([self.name isEqualToString:name] && [self.rootPath isEqualToString:rootPath]) {
        return YES;
    }
    return NO;
}

+ (NSMutableArray *)cacheList
{
    static NSMutableArray *sharedCacheList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCacheList = [NSMutableArray new];
    });
    return sharedCacheList;
}

@end
