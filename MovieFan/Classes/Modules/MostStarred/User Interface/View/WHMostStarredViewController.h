//
//  WHMostStarredViewController.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHMostStarredViewInterface.h"
#import "WHMostStarredModuleInterface.h"

@interface WHMostStarredViewController : UITableViewController<WHMostStarredViewInterface>

@property (nonatomic, strong) id<WHMostStarredModuleInterface> eventHandler;

@end
