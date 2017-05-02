//
//  WHMostRecentDataManager.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentDataManager.h"
#import "WHMovieInThreaterRequest.h"
#import "WHMovieComingSoonRequest.h"
#import <YYKit/NSObject+YYModel.h>
#import "WHRLMMostRecentMovies.h"
#import "WHMostRecentMovies.h"
#import "WHRealmDataStore.h"
#import <Realm/Realm.h>
#import "NSArray+HOM.h"
#import "RLMObject+Converter.h"

@interface WHMostRecentDataManager ()

@end

@implementation WHMostRecentDataManager

- (void)recentMoviesCompletionBlock:(void (^)(NSArray<WHMostRecentMovies *> *))completionBlock {
    // 先从数据库里读，成功后回调
    [self.dataStore queryWithEntity:[WHRLMMostRecentMovies class] predict:@"" completionBlock:^(RLMResults *results) {
        RLMResults<WHRLMMostRecentMovies *> *sortedResults = [results sortedResultsUsingKeyPath:@"type" ascending:YES];
        NSInteger count = results.count;
        NSMutableArray<WHMostRecentMovies *> *dbMovies = [NSMutableArray arrayWithCapacity:count];
        for (WHRLMMostRecentMovies *movies in sortedResults) {
            NSDictionary *dict = [movies convertToJSONDictionary];
            WHMostRecentMovies *movie = [WHMostRecentMovies modelWithJSON:dict];
            [dbMovies addObject:movie];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(dbMovies);
        });
    }];
    
    // 然后从网络读取最新，并更新数据库
    __block WHMostRecentMovies *inThreaterMovies = nil;
    __block WHMostRecentMovies *comingSoonMovies = nil;
    dispatch_group_t requestGroup = dispatch_group_create();
    dispatch_group_enter(requestGroup);
    WHMovieInThreaterRequest *movieInThreaterRequest = [[WHMovieInThreaterRequest alloc] init];
    [movieInThreaterRequest startRequest:^(WHMostRecentMovies *movies) {
        inThreaterMovies = movies;
        dispatch_group_leave(requestGroup);
    } fail:^(NSString *message) {
        dispatch_group_leave(requestGroup);
    }];
    dispatch_group_enter(requestGroup);
    WHMovieComingSoonRequest *movieComingSoonRequest = [[WHMovieComingSoonRequest alloc] init];
    [movieComingSoonRequest startRequest:^(WHMostRecentMovies *movies) {
        comingSoonMovies = movies;
        dispatch_group_leave(requestGroup);
    } fail:^(NSString *message) {
        dispatch_group_leave(requestGroup);
    }];
    dispatch_group_notify(requestGroup, dispatch_get_main_queue(), ^{
        NSMutableArray<WHMostRecentMovies *> *requestMovies = [NSMutableArray array];
        NSMutableArray<WHRLMMostRecentMovies *> *RLMMovies = [NSMutableArray array];
        if (inThreaterMovies) {
            inThreaterMovies.type = WHMostRecentMovies_InThreater;
            [requestMovies addObject:inThreaterMovies];
            WHRLMMostRecentMovies *RLMInThreaterMovies = [[WHRLMMostRecentMovies alloc] initWithValue:inThreaterMovies];
            [RLMMovies addObject:RLMInThreaterMovies];
        }
        if (comingSoonMovies) {
            comingSoonMovies.type = WHMostRecentMovies_ComingSoon;
            [requestMovies addObject:comingSoonMovies];
            WHRLMMostRecentMovies *RLMComingSoonMovies = [[WHRLMMostRecentMovies alloc] initWithValue:comingSoonMovies];
            [RLMMovies addObject:RLMComingSoonMovies];
        }
        // 保存数据库
        [self.dataStore addOrUpdateObjectsFromArray:RLMMovies];
        completionBlock(requestMovies);
    });
}

@end
