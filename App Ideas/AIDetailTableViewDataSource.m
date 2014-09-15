//
//  AIDetailTableViewDataSource.m
//  App Ideas
//
//  Created by Joshua Howland on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIDetailTableViewDataSource.h"
#import "AIVoiceTableViewCell.h"

static NSString * const VoiceCellKey = @"voiceCell";
static NSString * const titleKey = @"title";
static NSString * const userNameKey = @"userName";
static NSString * const scoreKey = @"score";

@interface AIDetailTableViewDataSource () <UITextFieldDelegate>

@property (nonatomic, strong) NSArray *userVoices;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation AIDetailTableViewDataSource

- (void)setIdea:(NSDictionary *)idea {
    _idea = idea;
    
    NSArray *voices = [[NSUserDefaults standardUserDefaults] objectForKey:idea[titleKey]];
    self.userVoices = voices;
}

- (void)setUserVoices:(NSArray *)userVoices {
    _userVoices = userVoices;
    
    [[NSUserDefaults standardUserDefaults] setObject:userVoices forKey:self.idea[titleKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[AIVoiceTableViewCell class] forCellReuseIdentifier:VoiceCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userVoices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIVoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VoiceCellKey];
    [cell updateWithVoice:self.userVoices[indexPath.row] idea:self.idea];
    cell.userNameField.delegate = self;
    return cell;
}

- (void)newVoice {
    // In order to save the cell if still editing we need to resign the responder and have the delegate methods called. So we reload the tableview before adding another idea
    [self.tableView reloadData];
    
    NSMutableArray *mutableVoices = [NSMutableArray arrayWithObject:@{userNameKey: @"", scoreKey: @(0)}];
    [mutableVoices addObjectsFromArray:self.userVoices];
    self.userVoices = [NSArray arrayWithArray:mutableVoices];

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSInteger index = textField.tag;
    
    NSMutableDictionary *voice = [[NSMutableDictionary alloc] initWithDictionary:self.userVoices[index]];
    [voice setObject:textField.text forKey:userNameKey];
    
    NSMutableArray *mutableVoices = [NSMutableArray arrayWithArray:self.userVoices];
    [mutableVoices replaceObjectAtIndex:index withObject:voice];
    
    self.userVoices = [NSArray arrayWithArray:mutableVoices];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
