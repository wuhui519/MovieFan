//
//  WHMostStarredViewController.m
//  MovieFan
//
//  Created by Faye on 2017/5/2.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostStarredViewController.h"

@interface WHMostStarredViewController ()

@end

@implementation WHMostStarredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view interface

- (void)showNoContentMessage {
}


- (void)showMostStarredDisplayData:(NSArray<WHMostRecentMovies *> *)data {
    
    [self reloadEntries];
}


- (void)reloadEntries {
//    [self.tableView reloadData];
}
@end
