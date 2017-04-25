//
//  WHMovieSubject.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRanking.h"
#import "WHImages.h"
#import "WHCelebrity.h"

@interface WHMovieSubject : NSObject

@property (nonatomic, strong) NSString *id;                 //条目id
@property (nonatomic, strong) NSString *title;              //中文名
@property (nonatomic, strong) NSString *original_title;     //原名
@property (nonatomic, strong) NSString *alt;                //条目URL
@property (nonatomic, strong) WHImages *images;             //电影海报图，分别提供288px x 465px(大)，96px x 155px(中) 64px x 103px(小)尺寸
@property (nonatomic, strong) WHRanking *rating;            //评分
@property (nonatomic, strong) NSString *year;               //年代
@property (nonatomic, strong) NSString *subtype;            //条目分类, movie或者tv
@property (nonatomic, strong) NSArray<NSString *> *genres;              //影片类型，最多提供3个
@property (nonatomic, strong) NSArray<WHCelebrity *> *casts;               //主演，最多可获得4个，数据结构为影人的简化描述
@property (nonatomic, strong) NSArray<WHCelebrity *> *directors;           //导演，数据结构为影人的简化描述
@property (nonatomic, assign) NSInteger collect_count;      //看过人数

@end
