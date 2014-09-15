//
//  AIListTableViewCell.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListTableViewCell.h"

static CGFloat margin = 15;

@interface AIListTableViewCell ()

@property (nonatomic, strong) UITextField *titleField;

@end

@implementation AIListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, self.contentView.bounds.size.width - (3 * margin), self.contentView.bounds.size.height)];
        textField.placeholder = @"Idea Name";
        self.titleField = textField;
        [self.contentView addSubview:textField];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return self;
}

- (void)updateWithIdea:(NSString *)idea {
    self.titleField.text = idea;
}

@end
