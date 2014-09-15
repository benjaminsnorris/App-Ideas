//
//  AIListTableViewCell.h
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIListTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) UITextField *titleField;

- (void)updateWithIdea:(NSString *)idea;

@end
