//
//  WHMostStarredWireframe.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRootWireframe.h"

@class WHMostStarredPresenter;
@class WHMostStarredViewController;

@interface WHMostStarredWireframe : NSObject

//@property (nonatomic, strong) WHMovieDetailWireframe *detailWireframe;
@property (nonatomic, strong) WHMostStarredPresenter *starredPresenter;
@property (nonatomic, strong) WHRootWireframe *rootWireframe;

- (void)presentSelfInterfaceWithVC:(WHMostStarredViewController *)viewController;
- (void)presentDetailInterface;

@end
