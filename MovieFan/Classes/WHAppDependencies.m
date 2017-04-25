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
    
    // Add Module Classes
//    VTDAddWireframe *addWireframe = [[VTDAddWireframe alloc] init];
//    VTDAddInteractor *addInteractor = [[VTDAddInteractor alloc] init];
//    VTDAddPresenter *addPresenter = [[VTDAddPresenter alloc] init];
//    VTDAddDataManager *addDataManager = [[VTDAddDataManager alloc] init];
    
    // MostRecent Module Classes
    recentInteractor.output = recentPresenter;
    
    recentPresenter.recentInteractor = recentInteractor;
    recentPresenter.recentWireframe = recentWireframe;
    
//    recentWireframe.detailWireframe = detailWireframe;
    recentWireframe.recentPresenter = recentPresenter;
    recentWireframe.rootWireframe = rootWireframe;
    self.recentWireframe = recentWireframe;
    
    recentDataManager.dataStore = dataStore;
    
    // Add Module Classes
//    addInteractor.addDataManager = addDataManager;
//    
//    addPresenter.addInteractor = addInteractor;
//    
//    addWireframe.addPresenter = addPresenter;
//    
//    addPresenter.addWireframe = addWireframe;
//    addPresenter.addModuleDelegate = listPresenter;
//    
//    addDataManager.dataStore = dataStore;
    
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
