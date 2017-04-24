//
//  WHMostRecentInteractorIO.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WHMostRecentInteractorInput <NSObject>

- (void)findMostRecentItems;

@end


@protocol VTDListInteractorOutput <NSObject>

- (void)foundMostRecentItems:(NSArray *)mostRecentItems;

@end
