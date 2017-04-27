//
//  WHRanking.m
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHRanking.h"

@implementation WHRanking

- (NSString *)average {
    float average = [_average floatValue];
    return [NSString stringWithFormat:@"%.1f", average];
}

@end
