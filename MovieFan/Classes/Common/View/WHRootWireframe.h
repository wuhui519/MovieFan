//
//  WHRootWireframe.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHRootWireframe : NSObject

- (instancetype)initWithWindow:(UIWindow *)window;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
