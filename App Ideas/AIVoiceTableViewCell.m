//
//  AIVoiceTableViewCell.m
//  App Ideas
//
//  Created by Joshua Howland on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIVoiceTableViewCell.h"

static CGFloat margin = 15;

static NSString * const userNameKey = @"userName";
static NSString * const titleKey = @"title";
static NSString * const scoreKey = @"score";

@interface AIVoiceTableViewCell ()

@property (nonatomic, strong) NSString *voiceDetailKey;
@property (nonatomic, strong) NSDictionary *voiceDetail;

@end

@implementation AIVoiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    if (self) {
        
    }
    return self;
}

- (void)updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea {
    self.userNameField.text = voice[userNameKey];
    
    self.voiceDetailKey = [NSString stringWithFormat:@"%@-%@", idea[titleKey], voice[userNameKey]];
    self.voiceDetail = [[NSUserDefaults standardUserDefaults] objectForKey:self.voiceDetailKey];

    [self updateScore:[self.voiceDetail[scoreKey] integerValue]];

}

- (IBAction)scoreButtonSelected:(id)sender {
    [self updateScore:[sender tag]];
    
    NSMutableDictionary *voiceDetail = [[NSMutableDictionary alloc] initWithDictionary:self.voiceDetail];
    [voiceDetail setObject:@([sender tag]) forKey:scoreKey];
    
    [[NSUserDefaults standardUserDefaults] setObject:voiceDetail forKey:self.voiceDetailKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)updateScore:(NSInteger)score {

    [self resetButtons];

    if (score == 1) {
        [self.wontUseButton setBackgroundColor:[UIColor redColor]];
        [self.wontUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 2) {
        [self.mightUseButton setBackgroundColor:[UIColor yellowColor]];
        [self.mightUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 3) {
        [self.wantsButton setBackgroundColor:[UIColor greenColor]];
        [self.wantsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
}

- (void)resetButtons {

    [self.wantsButton setBackgroundColor:[UIColor whiteColor]];
    [self.mightUseButton setBackgroundColor:[UIColor whiteColor]];
    [self.wontUseButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.wantsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.mightUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wontUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

}

@end
