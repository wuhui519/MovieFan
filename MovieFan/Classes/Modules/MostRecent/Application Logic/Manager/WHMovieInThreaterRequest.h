//
//  WHMovieInThreaterRequest.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WHMostRecentMovies;

@interface WHMovieInThreaterRequest : NSObject

- (void)startRequest:(void (^)(WHMostRecentMovies *movies))completionBlock
                fail:(void (^)(NSString *message))failBlock;

@end
