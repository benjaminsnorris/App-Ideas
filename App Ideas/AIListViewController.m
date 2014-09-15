//
//  AIListViewController.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListViewController.h"
#import "AIListTableViewDataSource.h"

@interface AIListViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AIListTableViewDataSource *dataSource;

@end

@implementation AIListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataSource = [AIListTableViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"App Ideas";

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Ideas"
                                   style: UIBarButtonItemStylePlain
                                   target: nil action: nil];

    [self.navigationItem setBackBarButtonItem: backButton];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.dataSource registerTableView:tableView];
    tableView.dataSource = self.dataSource;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;

    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newIdea)];
    self.navigationItem.rightBarButtonItem = plusButton;
    
    
}

- (void)newIdea {
    [self.dataSource newIdea];
    [self.tableView reloadData];
}

@end
