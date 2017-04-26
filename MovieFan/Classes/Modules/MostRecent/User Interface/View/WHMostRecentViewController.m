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
#import <YYKit/YYCGUtilities.h>
#import <Masonry/Masonry.h>

@interface WHMostRecentViewController ()

@property (nonatomic, strong) NSArray<WHMostRecentMovies *> *data;
@property (nonatomic, strong) NSMutableDictionary *sectionHeaders;

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
    // iOS8之后，加上下面两句就可以动态调整cell高度，前提是必须使用AutoLayout布局
    self.tableView.estimatedRowHeight = 109;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.sectionHeaders = [NSMutableDictionary dictionary];
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
    
    self.data = @[data, data];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = nil;
    if (section < self.sectionHeaders.count) {
        header = [self.sectionHeaders objectForKey:@(section)];
    }
    if (!header) {
        header = [self sectionHeader];
        [self.sectionHeaders setObject:header forKey:@(section)];
        [self setSectionHeader:header withText:self.data[section].title];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

#pragma mark - section header

- (UIView *)sectionHeader {
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = kThemeColorKhaki;
    bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UILabel *label = [[UILabel alloc] init];
    label.textColor = kThemeColorBlue;
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(15);
        make.right.with.height.equalTo(bgView);
    }];
    UIView *btmLine = [[UIView alloc] init];
    btmLine.backgroundColor = kSeperatorColor;
    [bgView addSubview:btmLine];
    [btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.mas_bottom).offset(-0.5);
        make.left.width.equalTo(bgView);
        make.height.mas_equalTo(0.5);
    }];
    return bgView;
}

- (void)setSectionHeader:(UIView *)header withText:(NSString *)text {
    for (UIView *subview in header.subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            ((UILabel *)subview).text = text;
        }
    }
}

@end
