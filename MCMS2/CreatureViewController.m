//
//  CreatureViewController.m
//  MCMS2
//
//  Created by S on 10/7/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabelButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabelButton.text = self.creatureSeg.name;
    //self.navigationItem.title = self.creatures.name;
    self.textField.hidden = YES;

}

- (IBAction)onEditButtonTapped:(id)sender
{
    if ([self.editButton.titleLabel.text  isEqual: @"Edit"])
    {
        self.editButton.titleLabel.text = @"Done";
        self.nameLabelButton.hidden = YES;
        self.textField.hidden = NO;
        self.textField.text = self.creatureSeg.name;
    }
}

#pragma mark - TextLabel Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    self.creatureSeg.name = self.textField.text;
    self.nameLabelButton.text = self.creatureSeg.name;
    self.editButton.titleLabel.text = @"Edit";
    self.nameLabelButton.hidden = NO;
    self.textField.hidden = YES;
    

    return YES;
}

@end
