//
//  WHRootWireframe.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHRootWireframe.h"

@interface WHRootWireframe ()

@property (nonatomic, strong) UIWindow *window;

@end

@implementation WHRootWireframe

- (instancetype)initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UINavigationController *navigationController = [self currentnavigationController];
    [navigationController pushViewController:viewController animated:animated];
}

- (UINavigationController *)currentnavigationController
{
    UITabBarController *tabBarController = (UITabBarController *)[self.window rootViewController];
    UINavigationController *navigationController = (UINavigationController *)tabBarController.selectedViewController;
    return navigationController;
}

@end
