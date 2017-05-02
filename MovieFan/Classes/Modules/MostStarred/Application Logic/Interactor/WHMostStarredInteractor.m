//
//  WHMostStarredInteractor.m
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostStarredInteractor.h"
#import "WHMostStarredDataManager.h"

@interface WHMostStarredInteractor ()

@property (nonatomic, strong) WHMostStarredDataManager *dataManager;

@end

@implementation WHMostStarredInteractor

- (instancetype)initWithDataManager:(WHMostStarredDataManager *)dataManager {
    self = [super init];
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)findMostStarredItems {
    
}

@end
