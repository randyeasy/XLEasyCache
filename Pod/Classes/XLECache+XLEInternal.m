//
//  XLECache+XLEInternal.m
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache+XLEInternal.h"

NSString *const XLECache_Root_Dir_Name = @"com.easy.cache";
NSString *const XLECache_Forover_Dir_Name = @"com.easy.cache.forever";

@implementation XLECache (XLEInternal)
@dynamic tmCache;

+ (void)initialize{
    NSString *path = [self foreverRootDir];
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;
    [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:[self tempRootDir] withIntermediateDirectories:YES attributes:nil error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:[self cacheRootDir] withIntermediateDirectories:YES attributes:nil error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:[self libraryRootDir] withIntermediateDirectories:YES attributes:nil error:nil];
}

#pragma mark - internal

+ (NSString *)pathForLibrary {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
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

+ (NSString *)libraryRootDir
{
    NSString *docDir = [[self pathForLibrary] stringByAppendingPathComponent:XLECache_Root_Dir_Name];
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

+ (NSString *)foreverRootDir
{
    NSString *path = [[self pathForLibrary] stringByAppendingPathComponent:XLECache_Forover_Dir_Name];
    return path;
}

@end
