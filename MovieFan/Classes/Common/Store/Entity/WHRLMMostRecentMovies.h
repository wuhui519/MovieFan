//
//  WHRLMMostRecentMovies.h
//  MovieFan
//
//  Created by Faye on 2017/4/27.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Realm/Realm.h>
#import "WHRLMMovieSubject.h"

RLM_ARRAY_TYPE(WHRLMMovieSubject)

@interface WHRLMMostRecentMovies : RLMObject

@property NSInteger start;
@property NSInteger count;
@property NSInteger total;              //总数
@property RLMArray<WHRLMMovieSubject *><WHRLMMovieSubject> *subjects;            //电影条目
@property NSString *title;              //标题

@end
