//
//  XLECacheTests.m
//  BJEducation
//
//  Created by Randy on 15/11/30.
//  Copyright © 2015年 com.bjhl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XLEasyCache/XLEasyCache.h>

@interface XLECacheTests : XCTestCase

@end

@implementation XLECacheTests
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [XLEUserCache removeAllObjects];
    [XLECommonCache removeAllObjects];
    [XLEUserCache registerCacheWithUserName:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *testValue = @"testValue";
    NSMutableString *mutTestValue = [testValue mutableCopy];
    [[XLECommonCache sharedCache] setObject:mutTestValue forKey:@"mutTestValue"];
    XCTAssert([[XLECommonCache sharedCache] objectForKey:@"mutTestValue"],@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedCache] stringForKey:@"mutTestValue"],@"实际结果和预期结果不符 %@:%@",[[XLECommonCache sharedCache] objectForKey:@"mutTestValue"],testValue);
    
    [[XLECommonCache sharedCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLECommonCache sharedCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedCache] stringForKey:@"testKey"],@"实际结果和预期结果不符 %@:%@",[[XLECommonCache sharedCache] objectForKey:@"testKey"],testValue);
    [[XLECommonCache sharedCache] removeObjectForKey:@"testKey"];
    XCTAssert([[XLECommonCache sharedCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    
    [[XLECommonCache sharedForeverCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLECommonCache sharedForeverCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedForeverCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [[XLECommonCache sharedBackupCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLECommonCache sharedBackupCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedBackupCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [[XLECommonCache sharedTempCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLECommonCache sharedTempCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedTempCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [XLEUserCache registerCacheWithUserName:@"www_122323_1"];
    XCTAssert([[XLEUserCache sharedCache].userName isEqualToString:@"www_122323_1"]);
    
    [[XLEUserCache sharedCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLEUserCache sharedCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [[XLEUserCache sharedForeverCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLEUserCache sharedForeverCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedForeverCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [[XLEUserCache sharedBackUpCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLEUserCache sharedBackUpCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedBackUpCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
    
    [[XLEUserCache sharedTempCache] setObject:testValue forKey:@"testKey"];
    XCTAssert([[XLEUserCache sharedTempCache] objectForKey:@"testKey"],@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedTempCache] stringForKey:@"testKey"],@"实际结果和预期结果不符");
}

- (void)testBaseType
{
    CGFloat floatValue = 1.02f;
    [[XLECommonCache sharedCache] setFloatValue:floatValue forKey:@"floatKey"];
    XCTAssert(floatValue == [[XLECommonCache sharedCache] floatForKey:@"floatKey"]);
    XCTAssert([[XLECommonCache sharedCache] floatForKey:@"floatDefaultKey" defaultValue:10.02f]==10.02f);
    
    CGFloat intValue = 100;
    [[XLECommonCache sharedCache] setIntValue:intValue forKey:@"intKey"];
    XCTAssert(intValue == [[XLECommonCache sharedCache] intForKey:@"intKey"]);
    XCTAssert([[XLECommonCache sharedCache] floatForKey:@"intDefaultKey" defaultValue:10]==10);
    
    CGFloat longValue = 100;
    [[XLECommonCache sharedCache] setLongValue:longValue forKey:@"longKey"];
    XCTAssert(longValue == [[XLECommonCache sharedCache] intForKey:@"longKey"]);
    XCTAssert([[XLECommonCache sharedCache] longForKey:@"longDefaultKey" defaultValue:10]==10);
    
    CGFloat longlongValue = 1000000;
    [[XLECommonCache sharedCache] setIntValue:longlongValue forKey:@"longlongKey"];
    XCTAssert(longlongValue == [[XLECommonCache sharedCache] longLongForKey:@"longlongKey"]);
    XCTAssert([[XLECommonCache sharedCache] longLongForKey:@"longlongDefaultKey" defaultValue:10]==10);
    
    CGFloat integerValue = 1000000;
    [[XLECommonCache sharedCache] setIntegerValue:integerValue forKey:@"integerForKey"];
    XCTAssert(integerValue == [[XLECommonCache sharedCache] integerForKey:@"integerForKey"]);
    XCTAssert([[XLECommonCache sharedCache] integerForKey:@"integerDefaultKey" defaultValue:10]==10);
    
    CGFloat doubleValue = 1000000.02f;
    [[XLECommonCache sharedCache] setDoubleValue:doubleValue forKey:@"setDoubleValue"];
    XCTAssert(doubleValue == [[XLECommonCache sharedCache] doubleForKey:@"setDoubleValue"]);
    XCTAssert([[XLECommonCache sharedCache] doubleForKey:@"setDoubleDefaultValue" defaultValue:10]==10);
    
    BOOL boolValue = YES;
    [[XLECommonCache sharedCache] setBoolValue:boolValue forKey:@"boolForKey"];
    XCTAssert(boolValue == [[XLECommonCache sharedCache] boolForKey:@"boolForKey"]);
    XCTAssert([[XLECommonCache sharedCache] boolForKey:@"boolForDefaultKey" defaultValue:YES]==YES);
}

- (void)testRegister
{
    //测试修改Name后，userCache跟着变化
    [XLEUserCache registerCacheWithUserName:@"register_name_01"];
    XCTAssert([[XLEUserCache sharedTempCache].userName isEqualToString:@"register_name_01"]);
    [[XLEUserCache sharedCache] setObject:@"register_01" forKey:@"register_01"];
    [XLEUserCache registerCacheWithUserName:@"register_name_02"];
    XCTAssert([[XLEUserCache sharedCache] objectForKey:@"register_01"]==nil);
    //测试修改name后，userCache能保存正常
    [[XLEUserCache sharedCache] setObject:@"register_02" forKey:@"register_02"];
    XCTAssert([[[XLEUserCache sharedCache] objectForKey:@"register_02"] isEqualToString:@"register_02"]);
    
    //测试切换回默认Name后，数据读取正常，不会读取到上次修改的数据
    [XLEUserCache registerCacheWithUserName:@"register_name_01"];
    XCTAssert([[XLEUserCache sharedCache] objectForKey:@"register_02"]==nil);
    XCTAssert([[[XLEUserCache sharedCache] objectForKey:@"register_01"] isEqualToString:@"register_01"]);
}

- (void)testCreateCommonCache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    XLECommonCache *commonCache = [XLECommonCache cacheWithCacheName:@"createCommonCache" rootPath:paths[0]];
    [commonCache setObject:@"createCommonCache" forKey:@"createCommonCache"];
    XCTAssert([commonCache.name isEqualToString:@"createCommonCache"]);
    XCTAssert([commonCache.rootPath isEqualToString:paths[0]]);
    
    XCTAssert([[commonCache objectForKey:@"createCommonCache"] isEqualToString:@"createCommonCache"]);
}
- (void)testCreateCache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    XLECache *cahce = [[XLECache alloc] initWithName:@"createName" rootPath:paths[0]];
    [cahce setObject:@"createCache" forKey:@"createCache"];
    XCTAssert([cahce.name isEqualToString:@"createName"]);
    XCTAssert([cahce.rootPath isEqualToString:paths[0]]);
    
    XCTAssert([[cahce objectForKey:@"createCache"] isEqualToString:@"createCache"]);
    [cahce removeAllObjects];
}

- (void)testCreateUserCache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    [XLEUserCache registerCacheWithUserName:@"createCacheUser1"];
    
    //测试userCache创建成功
    XLEUserCache *userCahce = [XLEUserCache userCacheWithCacheName:@"createName" rootPath:paths[0]];
    XCTAssert([userCahce.name isEqualToString:@"createName"]);
    XCTAssert([userCahce.rootPath isEqualToString:paths[0]]);
    XCTAssert([userCahce.userName isEqualToString:@"createCacheUser1"]);
    [userCahce setObject:@"createCache" forKey:@"createCache"];
    XCTAssert([[userCahce objectForKey:@"createCache"] isEqualToString:@"createCache"]);
    
    XLEUserCache *userInitCache = [[XLEUserCache alloc] initWithName:@"createInitName" rootPath:paths[0]];
    XCTAssert([userInitCache.name isEqualToString:@"createInitName"]);
    XCTAssert([userInitCache.rootPath isEqualToString:paths[0]]);
    XCTAssert([userInitCache.userName isEqualToString:@"createCacheUser1"]);
    [userInitCache setObject:@"createCache" forKey:@"createCache"];
    XCTAssert([[userInitCache objectForKey:@"createCache"] isEqualToString:@"createCache"]);
    
    //测试UserCache是否创建正确 读到上次的数据，说明错误
    [XLEUserCache registerCacheWithUserName:@"createCacheUser2"];
    XCTAssert([userCahce objectForKey:@"createCache"]==nil);
    XCTAssert([userInitCache objectForKey:@"createCache"]==nil);
    
    //测试同一的name和rootPath返回同一个cache
    XLEUserCache *userCahce2 = [XLEUserCache userCacheWithCacheName:@"createName" rootPath:paths[0]];
    XCTAssert(userCahce == userCahce2);
    
}

- (void)testRemoveCache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    //测试单个cache
    NSString *testValue = @"testValue";
    NSMutableString *mutTestValue = [testValue mutableCopy];
    [[XLECommonCache sharedCache] setObject:mutTestValue forKey:@"testKey"];
    [[XLECommonCache sharedCache] removeAllObjects];
    XCTAssert([[XLECommonCache sharedCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    
    //测试所有cache
    
    [XLEUserCache registerCacheWithUserName:@"www_122323_1"];
    
    [[XLECommonCache sharedCache] setObject:mutTestValue forKey:@"testKey"];
    [[XLECommonCache sharedTempCache] setObject:mutTestValue forKey:@"testKey"];
    
    XLECommonCache *cache = [XLECommonCache cacheWithCacheName:@"removeCacheCommon" rootPath:paths[0]];
    XLECommonCache *commonCache2 = [[XLECommonCache alloc] initWithName:@"removeCacheCommon2" rootPath:paths[0]];
    [cache setObject:testValue forKey:@"testKey"];
    [commonCache2 setObject:testValue forKey:@"testKey"];
    
    [[XLEUserCache sharedCache] setObject:testValue forKey:@"testKey"];
    [[XLEUserCache sharedBackUpCache] setObject:testValue forKey:@"testKey"];
    [[XLEUserCache sharedForeverCache] setObject:testValue forKey:@"testKey"];
    [[XLEUserCache sharedTempCache] setObject:testValue forKey:@"testKey"];
    XLEUserCache *userCache1 = [XLEUserCache userCacheWithCacheName:@"removeCache1" rootPath:paths[0]];
    XLEUserCache *userCache2 = [XLEUserCache userCacheWithCacheName:@"removeCache2" rootPath:paths[0]];
    XLEUserCache *userCache3 = [[XLEUserCache alloc] initWithName:@"removeCache3" rootPath:paths[0]];
    [userCache1 setObject:testValue forKey:@"testKey"];
    [userCache2 setObject:testValue forKey:@"testKey"];
    [userCache3 setObject:testValue forKey:@"testKey"];
    
    [XLEUserCache removeAllObjects];
    [XLECommonCache removeAllObjects];
    
    XCTAssert([[XLEUserCache sharedCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedBackUpCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedForeverCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([[XLEUserCache sharedTempCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([userCache1 objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([userCache2 objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([userCache3 objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedTempCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([[XLECommonCache sharedCache] objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
    XCTAssert([cache objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
        XCTAssert([commonCache2 objectForKey:@"testKey"]==nil,@"实际结果和预期结果不符");
}


@end
