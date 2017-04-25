//
//  WHCelebrity.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHImages.h"

@interface WHCelebrity : NSObject

@property (nonatomic, strong) NSString *id;         //影人条目id
@property (nonatomic, strong) NSString *name;       //中文名
@property (nonatomic, strong) NSString *alt;        //影人条目URL
@property (nonatomic, strong) WHImages *avatars;    //影人头像，分别提供420px x 600px(大)，140px x 200px(中) 70px x 100px(小)尺寸

@end
