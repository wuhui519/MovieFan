//
//  WHMovieSubject.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMovieSubject.h"
#import <YYKit/NSObject+YYModel.h>

@implementation WHMovieSubject

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"casts" : [WHCelebrity class],
             @"directors" : [WHCelebrity class],
             };
}

@end
