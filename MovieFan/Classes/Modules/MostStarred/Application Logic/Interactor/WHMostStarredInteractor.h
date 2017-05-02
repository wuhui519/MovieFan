//
//  WHMostStarredInteractor.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostStarredInteractorIO.h"

@class WHMostStarredDataManager;

@interface WHMostStarredInteractor : NSObject<WHMostStarredInteractorInput>

@property (nonatomic, weak) id<WHMostStarredInteractorOutput> output;

- (instancetype)initWithDataManager:(WHMostStarredDataManager *)dataManager;

@end
