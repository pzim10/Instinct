//
//  AddGoalViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/8/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddGoalViewController.h"

@interface AddGoalViewController ()

@end

@implementation AddGoalViewController

- (IBAction)saveTapped:(id)sender {
    if ([self.nameField.text isEqualToString:@""]) {
        
        return;
    }
    Goal *check = [GoalController goalWithName:self.goal.name];
    if (check) {
        self.goal.name = self.name;
    } else {
        [GoalController createGoal:self.nameField.text];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.goal) {
        self.nameField.text = self.goal.name;
        self.name = self.goal.name;
    } else if (self.name) {
        self.nameField.text = self.name;
//        self.notesText.text = self.goal.notes;
    } else {
        self.name = @"";
        self.nameField.text = @"";
    }
}
- (IBAction)nameChanged:(id)sender {
    self.name = self.nameField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
