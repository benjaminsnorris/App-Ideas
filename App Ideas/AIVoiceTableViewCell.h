//
//  AIVoiceTableViewCell.h
//  App Ideas
//
//  Created by Joshua Howland on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIVoiceTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *userNameField;

- (void)updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea;

@end
