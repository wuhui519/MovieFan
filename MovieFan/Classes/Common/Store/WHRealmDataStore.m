//
//  WHRealmDataStore.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHRealmDataStore.h"
#import <Realm/Realm.h>

@interface WHRealmDataStore ()

@property (nonatomic, strong) dispatch_queue_t synchronizationQueue;

@end

@implementation WHRealmDataStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Realm Path = %@", [RLMRealmConfiguration defaultConfiguration].fileURL);
        
        // 同步队列，同步读，barrier异步写
        NSString *queueName = [NSString stringWithFormat:@"%@-%@", NSStringFromClass([self class]),
                               [[NSUUID UUID] UUIDString]];
        _synchronizationQueue = dispatch_queue_create([queueName cStringUsingEncoding:NSASCIIStringEncoding],
                                                      DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

// write behavior
- (void)addOrUpdateObject:(RLMObject *)object {
    dispatch_barrier_async(self.synchronizationQueue, ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObject:object];
        [realm commitWriteTransaction];
    });
}

- (void)addOrUpdateObjectsFromArray:(id)array {
    dispatch_barrier_async(self.synchronizationQueue, ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObjectsFromArray:array];
        [realm commitWriteTransaction];
    });
}

- (void)deleteObject:(RLMObject *)object {
    dispatch_barrier_async(self.synchronizationQueue, ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObject:object];
        [realm commitWriteTransaction];
    });
}

- (void)deleteObjects:(id)array {
    dispatch_barrier_async(self.synchronizationQueue, ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:array];
        [realm commitWriteTransaction];
    });
}

- (void)deleteAllObjects {
    dispatch_barrier_async(self.synchronizationQueue, ^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteAllObjects];
        [realm commitWriteTransaction];
    });
}

// read behavior
- (void)queryWithEntity:(Class)aClass
                predict:(NSString *)predict
        completionBlock:(WHDataStoreFetchCompletionBlock)completionBlock {
    dispatch_async(self.synchronizationQueue, ^{
        if ([aClass isSubclassOfClass:[RLMObject class]]) {
            RLMRealm *realm = [RLMRealm defaultRealm];
            RLMResults *result = nil;
            if (predict.length == 0) {
                result = [aClass allObjectsInRealm:realm];
            }
            else {
                result = [aClass objectsInRealm:realm where:predict];
            }
            completionBlock(result);
        }
    });
}

@end
