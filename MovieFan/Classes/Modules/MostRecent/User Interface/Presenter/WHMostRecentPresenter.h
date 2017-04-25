//
//  WHMostRecentPresenter.h
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostRecentInteractorIO.h"
#import "WHMostRecentWireframe.h"
#import "WHMostRecentViewInterface.h"
#import "WHMostRecentModuleInterface.h"

@interface WHMostRecentPresenter : NSObject<WHMostRecentInteractorOutput, WHMostRecentModuleInterface>

@property (nonatomic, strong) id<WHMostRecentInteractorInput> recentInteractor;
@property (nonatomic, weak) WHMostRecentWireframe *recentWireframe;
@property (nonatomic, weak) UIViewController<WHMostRecentViewInterface> *userInterface;

@end
