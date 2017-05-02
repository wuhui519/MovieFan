//
//  WHAppDependencies.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHAppDependencies.h"
#import "WHRootWireframe.h"
#import "WHRealmDataStore.h"
#import "WHMostRecentWireframe.h"
#import "WHMostRecentPresenter.h"
#import "WHMostRecentInteractor.h"
#import "WHMostRecentDataManager.h"
#import "WHMostRecentViewController.h"
#import "WHMostStarredWireframe.h"
#import "WHMostStarredPresenter.h"
#import "WHMostStarredInteractor.h"
#import "WHMostStarredDataManager.h"
#import "WHMostStarredViewController.h"

@interface WHAppDependencies ()<UITabBarControllerDelegate>

@property (nonatomic, strong) WHMostRecentWireframe *recentWireframe;

@end

@implementation WHAppDependencies

- (void)addDependenciesInWindow:(UIWindow *)window {
    // Root Level Classes
    WHRootWireframe *rootWireframe = [[WHRootWireframe alloc] initWithWindow:window];
    WHRealmDataStore *dataStore = [[WHRealmDataStore alloc] init];
    
    // MostRecent Modules Classes
    WHMostRecentWireframe *recentWireframe = [[WHMostRecentWireframe alloc] init];
    WHMostRecentPresenter *recentPresenter = [[WHMostRecentPresenter alloc] init];
    WHMostRecentDataManager *recentDataManager = [[WHMostRecentDataManager alloc] init];
    WHMostRecentInteractor *recentInteractor = [[WHMostRecentInteractor alloc] initWithDataManager:recentDataManager];
    
    recentInteractor.output = recentPresenter;
    recentPresenter.recentInteractor = recentInteractor;
    recentPresenter.recentWireframe = recentWireframe;
//    recentWireframe.detailWireframe = detailWireframe;
    recentWireframe.recentPresenter = recentPresenter;
    recentWireframe.rootWireframe = rootWireframe;
    self.recentWireframe = recentWireframe;
    recentDataManager.dataStore = dataStore;
    
    
    // MostStarred Modules Classes
    WHMostStarredWireframe *starredWireframe = [[WHMostStarredWireframe alloc] init];
    WHMostStarredPresenter *starredPresenter = [[WHMostStarredPresenter alloc] init];
    WHMostStarredDataManager *starredDataManager = [[WHMostStarredDataManager alloc] init];
    WHMostStarredInteractor *starredInteractor = [[WHMostStarredInteractor alloc] initWithDataManager:recentDataManager];
    
    starredInteractor.output = starredPresenter;
    starredPresenter.starredInteractor = starredInteractor;
    starredPresenter.starredWireframe = starredWireframe;
    //    starredWireframe.detailWireframe = detailWireframe;
    starredWireframe.starredPresenter = starredPresenter;
    starredWireframe.rootWireframe = rootWireframe;
    starredDataManager.dataStore = dataStore;
    
    
    UITabBarController *tabBarController = (UITabBarController *)window.rootViewController;
    tabBarController.delegate = self;
    [self tabBarController:tabBarController didSelectViewController:tabBarController.viewControllers[0]];
}

#pragma mark - tabbar

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    UIViewController *rootVC = ((UINavigationController *)viewController).viewControllers[0];
    if ([rootVC isKindOfClass:[WHMostRecentViewController class]]) {
        [self.recentWireframe presentSelfInterfaceWithVC:(WHMostRecentViewController *)rootVC];
    }
}

@end
