//
//  XLEUserCache.m
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLEUserCache.h"
#import "XLECache+XLEInternal.h"
#import "XLECache.h"

@interface XLEUserCache ()
@end

@implementation XLEUserCache

- (instancetype)initWithName:(NSString *)name rootPath:(NSString *)rootPath
{
    return [self initWithUserName:[XLEUserCache sharedCache].userName cacheName:name rootPath:rootPath];
}

- (instancetype)initWithUserName:(NSString *)userName
                       cacheName:(NSString *)cacheName
                        rootPath:(NSString *)rootPath
{
    if (self = [super initWithName:cacheName rootPath:rootPath]) {
        _userName = userName;
        if (self.userName.length>0) {
            self.tmCache = [[TMCache alloc] initWithName:self.name rootPath:[self finalRootPath]];
        }
        else
            self.tmCache = nil;
        [[XLEUserCache userCacheList] addObject:self];
    }
    return self;
}

- (void)updateWithUserName:(NSString *)username
{
    if (username == self.userName || [self.userName isEqualToString:username]) {
        return;
    }
    _userName = username;
    if (username.length>0) {
        self.tmCache = [[TMCache alloc] initWithName:self.name rootPath:[self finalRootPath]];
    }
    else
    {
        self.tmCache = nil;
    }
}

/**
 *  userName生成对应的目录，不互相干扰
 *
 *  @param userName 用户名，如果有角色区分，需要拼接角色id
 *  userName为空后不会保存和读取到数据
 */
+ (void)registerCacheWithUserName:(nullable NSString *)userName
{
    //初始化
    [XLEUserCache sharedCache];
    [XLEUserCache sharedTempCache];
    [XLEUserCache sharedBackUpCache];

    for (XLEUserCache *oneCache in [self userCacheList]) {
        [oneCache updateWithUserName:userName];
    }
}

//长期保存、不备份 根据name生成目录
+ (XLEUserCache *)sharedCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithUserName:nil cacheName:nil rootPath:[XLECache cacheRootDir]];
    });
    return sharedInstance;
}

//永久保存、itunes备份
+ (XLEUserCache *)sharedBackUpCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithUserName:nil cacheName:nil rootPath:[XLECache docRootDir]];
    });
    return sharedInstance;
}

//临时保存，内存不够，或者重启应用可能被删除
+ (XLEUserCache *)sharedTempCache;
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithUserName:nil cacheName:nil rootPath:[XLECache tempRootDir]];
    });
    return sharedInstance;
}

//生成一个当前的Cache对象
+ (XLEUserCache *)userCacheWithCacheName:(NSString *)cacheName rootPath:(NSString *)rootPath;
{
    if (cacheName.length<=0 || rootPath.length<=0) {
        return nil;
    }
    XLEUserCache *user = [XLEUserCache findUserCacheWithName:cacheName rootPath:rootPath];
    if (user) {
        return user;
    }
    user = [[XLEUserCache alloc] initWithUserName:[XLEUserCache sharedCache].userName cacheName:cacheName rootPath:rootPath];
    return user;
}

//移除当前用户的数据
+ (void)removeAllObjects;
{
    for (XLEUserCache *oneUser in [self userCacheList]) {
        [oneUser removeAllObjects];
    }
}

#pragma mark - internal
+ (NSMutableArray *)userCacheList
{
    static NSMutableArray *sharedCacheList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCacheList = [NSMutableArray new];
    });
    return sharedCacheList;
}

- (NSString *)finalRootPath
{
    if (self.userName.length>0) {
        return [self.rootPath stringByAppendingPathComponent:self.userName];
    }
    return self.rootPath;
}

+ (XLEUserCache *)findUserCacheWithName:(nonnull NSString *)name rootPath:(nonnull NSString *)rootPath
{
    for (XLEUserCache *oneUser in [self userCacheList]) {
        if ([name isEqualToString:oneUser.name] && [rootPath isEqualToString:oneUser.rootPath]) {
            return oneUser;
        }
    }
    return nil;
}

@end
