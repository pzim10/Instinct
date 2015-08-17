//
//  TaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskViewController.h"
#import "GoalController.h"
#import "AddTaskViewController.h"
#import "TaskReminderViewController.h"


@interface TaskViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Tasks";
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    Goal *goal = [GoalController goals][indexPath.section];
    int i =0;
    for (Task *task in goal.tasks) {
        if (i == indexPath.row) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@", task.name];
        }
        i++;
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // Confirm
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Deleting this task will change your goal progress." message:@"Continue?" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            // remove object from task array;
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            Goal *goal = [GoalController goals][indexPath.section];
            for (Task *task in goal.tasks) {
                if ([task.name isEqualToString:cell.textLabel.text]) {
                    [GoalController removeTaskFromGoal:task fromGoal:goal];
                    break;
                }
            }
            [self viewWillAppear:YES];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    return @[action];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TaskReminderViewController *edit = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    Goal *goal = [GoalController goals][indexPath.section];
    for (Task *task in goal.tasks) {
        if ([task.name isEqualToString:cell.textLabel.text]) {
            edit.task = task;
        }
    }
    edit.navigationItem.title = cell.textLabel.text;
}

-(void) animateTableCellForEditing: (UITableViewCell *) cell fromTableView:(UITableView *)tableView {

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{return YES;}

//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{return YES;}

//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    for (int i =0; i < [GoalController goals].count; i++) {
        if (i == section) {
            Goal *goal = [GoalController goals][i];
            return goal.name;
        }
    }
    return @"";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    for (int i =0; i < [GoalController goals].count; i++) {
        if (i == section) {
            Goal *goal = [GoalController goals][i];
            return goal.tasks.count;
        }
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [GoalController goals].count;
    // return number of goals
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
