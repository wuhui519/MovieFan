//
//  WHMostStarredPresenter.h
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHMostStarredInteractorIO.h"
#import "WHMostStarredWireframe.h"
#import "WHMostStarredViewInterface.h"
#import "WHMostStarredModuleInterface.h"

@interface WHMostStarredPresenter : NSObject<WHMostStarredInteractorOutput, WHMostStarredModuleInterface>

@property (nonatomic, strong) id<WHMostStarredInteractorInput> starredInteractor;
@property (nonatomic, weak) WHMostStarredWireframe *starredWireframe;
@property (nonatomic, weak) UIViewController<WHMostStarredViewInterface> *userInterface;

@end
