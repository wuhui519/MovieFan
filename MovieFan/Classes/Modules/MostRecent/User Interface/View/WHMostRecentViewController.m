//
//  WHMostRecentViewControllerTableViewController.m
//  MovieFan
//
//  Created by Faye on 2017/4/24.
//  Copyright © 2017年 CMCC. All rights reserved.
//

#import "WHMostRecentViewController.h"
#import "WHMostRecentMovies.h"
#import "WHMovieSubjectCell.h"

@interface WHMostRecentViewController ()

@property (nonatomic, strong) NSArray<WHMostRecentMovies *> *data;

@end

@implementation WHMostRecentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"院线";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.eventHandler updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view interface

- (void)showNoContentMessage {
//    self.view = self.noContentView;
}


- (void)showMostRecentDisplayData:(WHMostRecentMovies *)data
{
//    self.view = self.strongTableView;
    
    self.data = @[data];
    [self reloadEntries];
}


- (void)reloadEntries
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *subjects = self.data[section].subjects;
    return subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WHMovieSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WHMovieSubjectCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.movie = self.data[indexPath.section].subjects[indexPath.row];
    
    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end
