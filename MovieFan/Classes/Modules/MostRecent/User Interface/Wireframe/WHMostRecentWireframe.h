//
//  WHMostRecentWireframe.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostRecentPresenter.h"
#import "WHRootWireframe.h"

@interface WHMostRecentWireframe : NSObject

//@property (nonatomic, strong) WHMovieDetailWireframe *detailWireframe;
@property (nonatomic, strong) WHMostRecentPresenter *mostRecentPresenter;
@property (nonatomic, strong) WHRootWireframe *rootWireframe;

- (void)presentDetailInterface;

@end
