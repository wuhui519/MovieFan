//
//  WHMostRecentWireframe.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRootWireframe.h"

@class WHMostRecentPresenter;
@class WHMostRecentViewController;

@interface WHMostRecentWireframe : NSObject

//@property (nonatomic, strong) WHMovieDetailWireframe *detailWireframe;
@property (nonatomic, strong) WHMostRecentPresenter *recentPresenter;
@property (nonatomic, strong) WHRootWireframe *rootWireframe;

- (void)presentSelfInterfaceWithVC:(WHMostRecentViewController *)viewController;
- (void)presentDetailInterface;

@end
