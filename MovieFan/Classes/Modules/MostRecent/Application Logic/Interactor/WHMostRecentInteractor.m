//
//  WHMostRecentInteractor.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentInteractor.h"
#import "WHMostRecentDataManager.h"

@interface WHMostRecentInteractor ()

@property (nonatomic, strong) WHMostRecentDataManager *dataManager;

@end

@implementation WHMostRecentInteractor

- (instancetype)initWithDataManager:(WHMostRecentDataManager *)dataManager {
    self = [super init];
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)findMostRecentItems {
    WEAKSELF
    [self.dataManager recentMoviesCompletionBlock:^(NSArray<WHMostRecentMovies *> *movies) {
        STRONGSELF
        [strongSelf.output foundMostRecentItems:movies];
    }];
}

@end
