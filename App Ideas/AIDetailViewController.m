//
//  AIDetailViewController.m
//  App Ideas
//
//  Created by Joshua Howland on 5/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIDetailViewController.h"
#import "AIDetailTableViewDataSource.h"

static NSString * const titleKey = @"title";

@interface AIDetailViewController ()

@property (nonatomic, strong) NSDictionary *idea;
@property (nonatomic, strong) AIDetailTableViewDataSource *dataSource;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AIDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataSource = [AIDetailTableViewDataSource new];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self.dataSource;
    tableView.rowHeight = 120;
    self.tableView = tableView;
    [self.view addSubview:tableView];

    [self.dataSource registerTableView:tableView];
    
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newVoice)];
    self.navigationItem.rightBarButtonItem = plusButton;

}

- (void)newVoice {
    [self.dataSource newVoice];
    [self.tableView reloadData];
}

- (void)updateWithIdea:(NSDictionary *)idea {
    self.idea = idea;
    self.dataSource.idea = idea;

    self.title = idea[titleKey];
    
}


@end
