//
//  WHRLMMovieSubject.h
//  MovieFan
//
//  Created by Faye on 2017/4/27.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Realm/Realm.h>

@interface WHRLMImages : RLMObject

@property NSString *large;
@property NSString *medium;
@property NSString *small;

@end

@interface WHRLMRanking : RLMObject

@property NSInteger min;    //最低评分
@property NSInteger max;    //最高评分
@property NSString *average;//评分
@property NSInteger stars;  //评星数
@property (readonly) RLMLinkingObjects *movie;

@end

@interface WHRLMCelebrity : RLMObject

@property NSString *id;         //影人条目id
@property NSString *name;       //中文名
@property NSString *alt;        //影人条目URL
@property WHRLMImages *avatars;    //影人头像，分别提供420px x 600px(大)，140px x 200px(中) 70px x 100px(小)尺寸

@end

RLM_ARRAY_TYPE(WHRLMCelebrity)

@interface WHRLMMovieSubject : RLMObject

@property NSString *id;                 //条目id
@property NSString *title;              //中文名
@property NSString *original_title;     //原名
@property NSString *alt;                //条目URL
@property WHRLMImages *images;             //电影海报图，分别提供288px x 465px(大)，96px x 155px(中) 64px x 103px(小)尺寸
@property WHRLMRanking *rating;            //评分
@property NSString *year;               //年代
@property NSString *subtype;            //条目分类, movie或者tv
@property NSString *genres;              //影片类型，最多提供3个
@property RLMArray<WHRLMCelebrity *><WHRLMCelebrity> *casts;               //主演，最多可获得4个，数据结构为影人的简化描述
@property RLMArray<WHRLMCelebrity *><WHRLMCelebrity> *directors;           //导演，数据结构为影人的简化描述
@property NSInteger collect_count;      //看过人数

@end
