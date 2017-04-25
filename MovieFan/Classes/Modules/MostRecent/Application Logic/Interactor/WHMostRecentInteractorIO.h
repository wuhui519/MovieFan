//
//  WHMostRecentInteractorIO.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostRecentMovies.h"

@protocol WHMostRecentInteractorInput <NSObject>

- (void)findMostRecentItems;

@end


@protocol WHMostRecentInteractorOutput <NSObject>

- (void)foundMostRecentItems:(WHMostRecentMovies *)mostRecentItems;

@end
