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

- (WHRLMMostRecentMovies *)createRLMObject {
    WHRLMMostRecentMovies *movies = [[WHRLMMostRecentMovies alloc] init];
    movies.start = self.start;
    movies.count = self.count;
    movies.title = self.title;
    movies.total = self.total;
    [movies.subjects addObjects:self.subjects];
    return movies;
}

+ (instancetype)createdFromRLMObject:(WHRLMMostRecentMovies *)rlmObject {
    WHMostRecentMovies *movies = [[WHMostRecentMovies alloc] init];
    movies.start = rlmObject.start;
    movies.count = rlmObject.count;
    movies.title = rlmObject.title;
    movies.total = rlmObject.total;
    RLMArray *subjects = rlmObject.subjects;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:subjects.count];
    for (WHMovieSubject *subject in subjects) {
        [array addObject:subject];
    }
    return movies;
}

@end
