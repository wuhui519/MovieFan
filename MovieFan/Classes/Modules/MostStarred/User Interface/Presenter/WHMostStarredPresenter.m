//
//  WHMostStarredPresenter.m
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostStarredPresenter.h"

@implementation WHMostStarredPresenter

- (void)updateView {
    [self.starredInteractor findMostStarredItems];
}

#pragma mark - List Interactor Output

- (void)foundMostStarredItems:(NSArray<WHMostRecentMovies *> *)mostStarredItems {
    if (mostStarredItems.count == 0) {
        [self.userInterface showNoContentMessage];
    }
    else {
        [self.userInterface showMostStarredDisplayData:mostStarredItems];
    }
}


@end
