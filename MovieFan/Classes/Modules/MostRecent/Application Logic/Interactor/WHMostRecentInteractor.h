//
//  WHMostRecentInteractor.h
//  MovieFan
//
//  Created by Faye on 2017/4/25.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostRecentInteractorIO.h"

@class WHMostRecentDataManager;

@interface WHMostRecentInteractor : NSObject<WHMostRecentInteractorInput>

@property (nonatomic, weak) id<WHMostRecentInteractorOutput> output;

- (instancetype)initWithDataManager:(WHMostRecentDataManager *)dataManager;

@end
