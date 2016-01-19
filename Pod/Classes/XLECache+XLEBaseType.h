//
//  XLECache+XLEBaseType.h
//  BJEducation
//
//  Created by Randy on 15/11/30.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache.h"

@interface XLECache (XLEBaseType)

- (int)intForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (long)longForKey:(NSString *)key;
- (long long)longLongForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

- (int)intForKey:(NSString *)key defaultValue:(int)defaultValue;
- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;
- (long)longForKey:(NSString *)key defaultValue:(long)defaultValue;
- (long long)longLongForKey:(NSString *)key defaultValue:(long long)defaultValue;
- (float)floatForKey:(NSString *)key defaultValue:(float)defaultValue;
- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue;
- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

- (void)setIntValue:(int)value forKey:(NSString *)key;
- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key;
- (void)setLongValue:(long)value forKey:(NSString *)key;
- (void)setLonglongValue:(long long)value forKey:(NSString *)key;
- (void)setFloatValue:(float)value forKey:(NSString *)key;
- (void)setDoubleValue:(double)value forKey:(NSString *)key;
- (void)setBoolValue:(BOOL)value forKey:(NSString *)key;
- (void)setStringValue:(NSString *)value forKey:(NSString *)key;

@end
