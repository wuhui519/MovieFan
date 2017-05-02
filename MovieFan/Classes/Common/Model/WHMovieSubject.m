//
//  WHMovieSubject.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMovieSubject.h"
#import <YYKit/NSObject+YYModel.h>

@interface WHMovieSubject ()<YYModel>

@end

@implementation WHMovieSubject

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"casts" : [WHCelebrity class],
             @"directors" : [WHCelebrity class],
             };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    id genres = dic[@"genres"];
    if ([genres isKindOfClass:[NSArray class]]) {
        self.genres = [genres componentsJoinedByString:@" "];
        return YES;
    }
    else if ([genres isKindOfClass:[NSString class]]) {
        self.genres = genres;
        return YES;
    }
    return NO;
}

@end
