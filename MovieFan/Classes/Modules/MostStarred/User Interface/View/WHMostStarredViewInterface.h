//
//  WHMostStarredViewInterface.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WHMostRecentMovies;

@protocol WHMostStarredViewInterface <NSObject>

- (void)showNoContentMessage;
- (void)showMostStarredDisplayData:(NSArray<WHMostRecentMovies *> *)data;
- (void)reloadEntries;

@end
