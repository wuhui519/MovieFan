//
//  WHAppDependencies.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHAppDependencies.h"
#import "WHRootWireframe.h"

@implementation WHAppDependencies

- (void)addDependenciesInWindow:(UIWindow *)window {
    // Root Level Classes
    WHRootWireframe *rootWireframe = [[WHRootWireframe alloc] initWithWindow:window];
    
//    VTDCoreDataStore *dataStore = [[VTDCoreDataStore alloc] init];
//    id<VTDClock> clock = [[VTDDeviceClock alloc] init];
//    VTDRootWireframe *rootWireframe = [[VTDRootWireframe alloc] init];
    
    // List Modules Classes
//    VTDListWireframe *listWireframe = [[VTDListWireframe alloc] init];
//    VTDListPresenter *listPresenter = [[VTDListPresenter alloc] init];
//    VTDListDataManager *listDataManager = [[VTDListDataManager alloc] init];
//    VTDListInteractor *listInteractor = [[VTDListInteractor alloc] initWithDataManager:listDataManager clock:clock];
    
    // Add Module Classes
//    VTDAddWireframe *addWireframe = [[VTDAddWireframe alloc] init];
//    VTDAddInteractor *addInteractor = [[VTDAddInteractor alloc] init];
//    VTDAddPresenter *addPresenter = [[VTDAddPresenter alloc] init];
//    VTDAddDataManager *addDataManager = [[VTDAddDataManager alloc] init];
    
    // List Module Classes
//    listInteractor.output = listPresenter;
//    
//    listPresenter.listInteractor = listInteractor;
//    listPresenter.listWireframe = listWireframe;
//    
//    listWireframe.addWireframe = addWireframe;
//    listWireframe.listPresenter = listPresenter;
//    listWireframe.rootWireframe = rootWireframe;
//    self.listWireframe = listWireframe;
    
//    listDataManager.dataStore = dataStore;
    
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
}

@end
