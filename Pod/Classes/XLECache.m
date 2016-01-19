//
//  XLECache.m
//  BJEducation
//
//  Created by Randy on 15/11/30.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache.h"
#import <TMCache/TMCache.h>
NSString *const XLECache_Shared_Name = @"XLECacheShared";

@interface XLECache ()
@property (strong) TMCache *tmCache;
@end

@implementation XLECache

- (instancetype)init
{
    NSLog(@"不能通过此初始化");
    return nil;
}

- (instancetype)initWithName:(nullable NSString *)name rootPath:(NSString *)rootPath
{
    if (rootPath.length<=0)
    {
        NSLog(@"XLECache错误 rootPath不能为空");
        return nil;
    }
    if (self = [super init]) {
        _name = name.length>0?name:XLECache_Shared_Name;
        _rootPath = rootPath;
        _tmCache = [[TMCache alloc] initWithName:self.name rootPath:rootPath];
    }
    return self;
}

- (id)objectForKey:(NSString *)key;
{
    return [self.tmCache objectForKey:key];
}

- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key;
{
    if (object) {
        [self.tmCache setObject:object forKey:key];
    }
    else
    {
        [self removeObjectForKey:key];
    }
}

- (void)removeObjectForKey:(NSString *)key;
{
    [self.tmCache removeObjectForKey:key];
}

- (void)removeAllObjects;
{
    [self.tmCache removeAllObjects];
}

@end
