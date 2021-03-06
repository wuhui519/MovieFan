//
//  WHMostRecentViewController.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHMostRecentViewInterface.h"
#import "WHMostRecentModuleInterface.h"

@interface WHMostRecentViewController : UITableViewController<WHMostRecentViewInterface>

@property (nonatomic, strong) id<WHMostRecentModuleInterface> eventHandler;

@end
