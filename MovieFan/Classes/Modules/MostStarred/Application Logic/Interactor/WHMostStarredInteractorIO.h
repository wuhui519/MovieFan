//
//  WHMostStarredInteractorIO.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostRecentMovies.h"

@protocol WHMostStarredInteractorInput <NSObject>

- (void)findMostStarredItems;

@end


@protocol WHMostStarredInteractorOutput <NSObject>

- (void)foundMostStarredItems:(NSArray<WHMostRecentMovies *> *)mostStarredItems;

@end
