//
//  XLECache+XLEBaseType.m
//  BJEducation
//
//  Created by Randy on 15/11/30.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import "XLECache+XLEBaseType.h"

@implementation XLECache (XLEBaseType)

- (BOOL)isBaseType:(id)value
{
    if (value == nil) {
        return NO;
    }
    
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

- (int)intForKey:(NSString *)key defaultValue:(int)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value intValue];
    }
    return defaultValue;
}

- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value integerValue];
    }
    return defaultValue;
}

- (long)longForKey:(NSString *)key defaultValue:(long)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value longValue];
    }
    return defaultValue;
}

- (long long)longLongForKey:(NSString *)key defaultValue:(long long)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value longLongValue];
    }
    return defaultValue;
}

- (float)floatForKey:(NSString *)key defaultValue:(float)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value floatValue];
    }
    return defaultValue;
}

- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value doubleValue];
    }
    return defaultValue;
}

- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [value boolValue];
    }
    return defaultValue;
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
{
    id value = [self objectForKey:key];
    if ([self isBaseType:value]) {
        return [NSString stringWithFormat:@"%@",value];
    }
    return defaultValue;
}


#pragma mark - get value
- (int)intForKey:(NSString *)key;
{
    return [self intForKey:key defaultValue:0];
}

- (NSInteger)integerForKey:(NSString *)key;
{
    return [self integerForKey:key defaultValue:0];
}

- (long)longForKey:(NSString *)key;
{
    return [self longForKey:key defaultValue:0];
}

- (long long)longLongForKey:(NSString *)key;
{
    return [self longLongForKey:key defaultValue:0];
}

- (float)floatForKey:(NSString *)key;
{
    return [self floatForKey:key defaultValue:0];
}

- (double)doubleForKey:(NSString *)key;
{
    return [self doubleForKey:key defaultValue:0];
}

- (BOOL)boolForKey:(NSString *)key;
{
    return [self boolForKey:key defaultValue:0];
}

- (NSString *)stringForKey:(NSString *)key;
{
    return [self stringForKey:key defaultValue:0];
}

#pragma mark - set value
- (void)setIntValue:(int)value forKey:(NSString *)key;
{
    [self setObject:@(value) forKey:key];
}

- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key;
{
    [self setObject:@(value) forKey:key];
}

- (void)setLongValue:(long)value forKey:(NSString *)key;
{
    [self setObject:@(value) forKey:key];
}

- (void)setLonglongValue:(long long)value forKey:(NSString *)key;
{
  [self setObject:@(value) forKey:key];
}

- (void)setFloatValue:(float)value forKey:(NSString *)key;
{
   [self setObject:@(value) forKey:key];
}

- (void)setDoubleValue:(double)value forKey:(NSString *)key;
{
   [self setObject:@(value) forKey:key];
}

- (void)setBoolValue:(BOOL)value forKey:(NSString *)key;
{
   [self setObject:@(value) forKey:key];
}

- (void)setStringValue:(NSString *)value forKey:(NSString *)key;
{
   [self setObject:value forKey:key];
}


@end
