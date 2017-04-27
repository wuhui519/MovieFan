//
//  WHMostRecentMovies.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMovieSubject.h"

@class WHRLMMostRecentMovies;

@interface WHMostRecentMovies : NSObject

@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger total;              //总数
@property (nonatomic, strong) NSArray<WHMovieSubject *> *subjects;            //电影条目
@property (nonatomic, strong) NSString *title;              //标题

- (WHRLMMostRecentMovies *)createRLMObject;
+ (instancetype)createdFromRLMObject:(WHRLMMostRecentMovies *)rlmObject;

@end
