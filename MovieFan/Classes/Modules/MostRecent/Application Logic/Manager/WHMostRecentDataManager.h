//
//  WHMostRecentDataManager.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WHRealmDataStore;
@class WHMostRecentMovies;

@interface WHMostRecentDataManager : NSObject

@property (nonatomic, strong) WHRealmDataStore *dataStore;

- (void)recentMoviesCompletionBlock:(void (^)(WHMostRecentMovies *movies))completionBlock;

@end
