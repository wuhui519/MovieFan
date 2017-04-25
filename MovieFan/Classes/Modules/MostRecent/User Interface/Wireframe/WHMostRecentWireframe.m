//
//  WHMostRecentWireframe.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentWireframe.h"
#import "WHMostRecentViewController.h"
#import "WHMostRecentPresenter.h"

@interface WHMostRecentWireframe ()

@end

@implementation WHMostRecentWireframe

- (void)presentSelfInterfaceWithVC:(WHMostRecentViewController *)viewController {
    viewController.eventHandler = self.recentPresenter;
    self.recentPresenter.userInterface = viewController;
}

- (void)presentDetailInterface {
    
}

@end
