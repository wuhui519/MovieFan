//
//  WHMostRecentPresenter.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentPresenter.h"

@implementation WHMostRecentPresenter

- (void)updateView {
    [self.recentInteractor findMostRecentItems];
}

#pragma mark - List Interactor Output

- (void)foundMostRecentItems:(WHMostRecentMovies *)mostRecentItems {
    if ([mostRecentItems.subjects count] == 0)
    {
        [self.userInterface showNoContentMessage];
    }
    else
    {
        [self.userInterface showMostRecentDisplayData:mostRecentItems];
    }
}

@end
