//
//  AIIdeaDataSource.h
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIListTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) NSArray *ideas;

- (void)registerTableView:(UITableView *)tableView;
- (void)newIdea;

@end
