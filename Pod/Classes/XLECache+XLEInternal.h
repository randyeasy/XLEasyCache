//
//  XLECache+XLEInternal.h
//  XLECacheTest
//
//  Created by Randy on 15/12/1.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache.h"
#import <TMCache/TMCache.h>
NS_ASSUME_NONNULL_BEGIN

@interface XLECache (XLEInternal)
@property (strong, nullable) TMCache *tmCache;

+ (NSString *)libraryRootDir;

+ (NSString *)tempRootDir;

+ (NSString *)cacheRootDir;

@end

NS_ASSUME_NONNULL_END
