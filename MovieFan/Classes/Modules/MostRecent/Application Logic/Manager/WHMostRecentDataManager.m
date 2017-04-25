//
//  WHMostRecentDataManager.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentDataManager.h"
#import "WHMovieInThreaterRequest.h"

@interface WHMostRecentDataManager ()

@end

@implementation WHMostRecentDataManager

- (void)recentMoviesCompletionBlock:(void (^)(WHMostRecentMovies *))completionBlock {
    // 先从数据库里读，成功后回调
    // 然后从网络读取最新，并更新数据库
    WHMovieInThreaterRequest *movieInThreaterRequest = [[WHMovieInThreaterRequest alloc] init];
    [movieInThreaterRequest startRequest:^(WHMostRecentMovies *movies) {
        if (completionBlock) {
            completionBlock(movies);
        }
    } fail:^(NSString *message) {
    }];
}

@end
