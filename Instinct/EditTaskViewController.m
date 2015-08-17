//
//  EditTaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/17/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//         get correct object and update it
    AddTaskViewController *edit = segue.destinationViewController;
    edit.editTask = self.task;
    edit.editTask.goal = self.task.goal;
    edit.editTask.goalName = self.task.goal.name;
    edit.textField.text = self.task.name;
    edit.editTask.sunday = self.task.sunday;
    edit.editTask.monday = self.task.monday;
    edit.editTask.tuesday = self.task.tuesday;
    edit.editTask.wednesday = self.task.wednesday;
    edit.editTask.thursday = self.task.thursday;
    edit.editTask.friday = self.task.friday;
    edit.editTask.saturday = self.task.saturday;
}


@end
