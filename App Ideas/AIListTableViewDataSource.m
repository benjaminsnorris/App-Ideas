//
//  AIIdeaDataSource.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListTableViewDataSource.h"
#import "AIListTableViewCell.h"

static NSString * const ListCellKey = @"listCell";

@interface AIListTableViewDataSource () <UITextFieldDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *ideas;

@end

@implementation AIListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[AIListTableViewCell class] forCellReuseIdentifier:ListCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ideas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListCellKey];
    cell.titleField.tag = indexPath.row;
    cell.titleField.delegate = self;
    [cell updateWithIdea:self.ideas[indexPath.row]];
    return cell;
}

- (void)newIdea {
    
    // In order to save the cell if still editing we need to resign the responder and have the delegate methods called. So we reload the tableview before adding another idea
    [self.tableView reloadData];
    
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithObject:@""];
    [mutableIdeas addObjectsFromArray:self.ideas];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    NSInteger index = textField.tag;
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithArray:self.ideas];
    [mutableIdeas replaceObjectAtIndex:index withObject:textField.text];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
