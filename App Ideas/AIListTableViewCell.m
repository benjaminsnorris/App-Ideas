//
//  AIListTableViewCell.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListTableViewCell.h"

static NSString * const titleKey = @"title";

@interface AIListTableViewCell ()

@property (nonatomic, strong) IBOutlet UITextField *titleField;

@end

@implementation AIListTableViewCell

- (void)awakeFromNib {
    // This method gets called

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    return self;
}

- (void)updateWithIdea:(NSDictionary *)idea {
    self.titleField.text = idea[titleKey];
}

@end
