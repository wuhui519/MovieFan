//
//  WHMostRecentViewInterface.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WHMostRecentViewInterface <NSObject>

- (void)showNoContentMessage;
//- (void)showUpcomingDisplayData:(VTDUpcomingDisplayData *)data;
- (void)reloadEntries;

@end
