//
//  AIDetailTableViewDataSource.h
//  App Ideas
//
//  Created by Joshua Howland on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIDetailTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *idea;

- (void)registerTableView:(UITableView *)tableView;
- (void)newVoice;

@end
