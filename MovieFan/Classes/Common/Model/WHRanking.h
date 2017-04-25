//
//  WHRanking.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHRanking : NSObject

@property (nonatomic, assign) NSInteger min;    //最低评分
@property (nonatomic, assign) NSInteger max;    //最高评分
@property (nonatomic, strong) NSString *average;//评分
@property (nonatomic, assign) NSInteger stars;  //评星数

@end
