//
//  ViewController.m
//  MCMS2
//
//  Created by S on 10/7/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.enabled = NO;

    MagicalCreature *vampire = [[MagicalCreature alloc] init];
    vampire.name = @"Dr. Acula";
    vampire.detail = @"Eastern European";
    vampire.picture = [UIImage imageNamed:@"vampire"];
    vampire.attributes = [NSMutableArray arrayWithObjects:@"Fangs", @"Wings", @"Cape", @"Coffin", nil];
    MagicalCreature *werewolf = [[MagicalCreature alloc] init];
    werewolf.name = @"Marty";
    werewolf.detail = @"Hairy";
    werewolf.picture = [UIImage imageNamed:@"werewolf"];
    vampire.attributes = [NSMutableArray arrayWithObjects:@"Teeth", @"Claws", nil];
    MagicalCreature *witch = [[MagicalCreature alloc] init];
    witch.name = @"Marge";
    witch.detail = @"Old";
    werewolf.picture = [UIImage imageNamed:@"witch"];
    vampire.attributes = [NSMutableArray arrayWithObjects:@"Broom", @"Nose", nil];


    self.creatures = [NSMutableArray arrayWithObjects:vampire, werewolf, witch, nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    self.textField.enabled = YES;
}

#pragma mark - TextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    MagicalCreature *creature = [[MagicalCreature alloc] init]; 
    creature.name = textField.text;

    [self.creatures addObject:creature]; //had a major problem here - I need to initialize this creature, then assign the name to the creature, but we don't need to the assign the name of the creature into the array - i assigned name to be whatever was entered in text above and now we just need to assign that creature into the class - the cellForRowAtIndexPath is what takes the name and assigns it to a label
    [self.tableView reloadData];
    textField.text = @"";
    [textField resignFirstResponder];
    self.textField.enabled = NO;

    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {

    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    CreatureViewController *creatureViewController = [segue destinationViewController];

    creatureViewController.creatureSeg = creature;
}

#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    MagicalCreature *cellCreature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = cellCreature.name;
    cell.detailTextLabel.text = cellCreature.detail;

    return cell;
}

@end
