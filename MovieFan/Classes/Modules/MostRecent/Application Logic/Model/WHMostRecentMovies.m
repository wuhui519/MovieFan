//
//  WHMostRecentMovies.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentMovies.h"
#import <YYKit/NSObject+YYModel.h>
#import "WHRLMMostRecentMovies.h"

@implementation WHMostRecentMovies

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"subjects" : [WHMovieSubject class]
             };
}

@end
