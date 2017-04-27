//
//  WHRealmDataStore.h
//  MovieFan
//
//  Realm initialization & GCD synchronization
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMResults;
@class RLMObject;

typedef void(^WHDataStoreFetchCompletionBlock)(RLMResults *results);

@interface WHRealmDataStore : NSObject

// write behavior
- (void)addOrUpdateObject:(RLMObject *)object;
- (void)addOrUpdateObjectsFromArray:(id)array;
- (void)deleteObject:(RLMObject *)object;
- (void)deleteObjects:(id)array;
- (void)deleteAllObjects;
// read behavior
- (void)queryWithEntity:(Class)aClass
                predict:(NSString *)predict
        completionBlock:(WHDataStoreFetchCompletionBlock)completionBlock;

@end
