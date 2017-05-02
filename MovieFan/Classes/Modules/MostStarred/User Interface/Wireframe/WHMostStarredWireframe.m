//
//  WHMostStarredWireframe.m
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostStarredWireframe.h"
#import "WHMostStarredViewController.h"
#import "WHMostStarredPresenter.h"

@implementation WHMostStarredWireframe

- (void)presentSelfInterfaceWithVC:(WHMostStarredViewController *)viewController {
    viewController.eventHandler = self.starredPresenter;
    self.starredPresenter.userInterface = viewController;
}

- (void)presentDetailInterface {
    
}

@end
