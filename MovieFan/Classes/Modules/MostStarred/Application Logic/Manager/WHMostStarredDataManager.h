//
//  WHMostStarredDataManager.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WHRealmDataStore;
@class WHMostRecentMovies;

@interface WHMostStarredDataManager : NSObject

@property (nonatomic, strong) WHRealmDataStore *dataStore;

- (void)starredMoviesCompletionBlock:(void (^)(NSArray<WHMostRecentMovies *> *movies))completionBlock;

@end
