//
//  WHRLMMovieSubject.m
//  MovieFan
//
//  Created by Faye on 2017/4/27.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHRLMMovieSubject.h"

@implementation WHRLMImages

@end

@implementation WHRLMRanking

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"movie": [RLMPropertyDescriptor descriptorWithClass:WHRLMMovieSubject.class propertyName:@"rating"],
             };
}

@end

@implementation WHRLMCelebrity

@end

@implementation WHRLMMovieSubject

+ (NSString *)primaryKey {
    return @"id";
}

@end
