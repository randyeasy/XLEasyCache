//
//  XLECache+XLEInternal.m
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache+XLEInternal.h"

NSString *const XLECache_Root_Dir_Name = @"XLECacheRoot";


@implementation XLECache (XLEInternal)
@dynamic tmCache;
#pragma mark - internal

+ (NSString *)pathForDocument {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return path;
}

+ (NSString *)pathForTemporary {
    NSString *path = NSTemporaryDirectory();
    return path;
}

+ (NSString *)pathForCaches {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    return path;
}

+ (NSString *)docRootDir
{
    NSString *docDir = [[self pathForDocument] stringByAppendingPathComponent:XLECache_Root_Dir_Name];
    return docDir;
}

+ (NSString *)tempRootDir
{
    return [[self pathForTemporary] stringByAppendingPathComponent:XLECache_Root_Dir_Name];
}

+ (NSString *)cacheRootDir
{
    return [[self pathForCaches] stringByAppendingPathComponent:XLECache_Root_Dir_Name];
}

@end
