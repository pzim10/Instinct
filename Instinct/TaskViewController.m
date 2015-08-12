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
    return cell;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // remove object from task array;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        Task *task = [TaskController getTaskWithName:cell.textLabel.text];
        Goal *goal = [GoalController goalWithName:task.goalName];
        [GoalController removeTaskFromGoal:task fromGoal:goal];
        [self viewWillAppear:YES];

    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action2, NSIndexPath *indexPath) {
//         get correct object and update it
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        Task *task = [TaskController getTaskWithName:cell.textLabel.text];
        AddTaskViewController *edit = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddTaskViewController class])];
        edit.editTask = task;
        edit.editTask.goal = task.goal;
        edit.editTask.goalName = task.goal.name;
        edit.textField.text = task.name;
        edit.editTask.sunday = task.sunday;
        edit.editTask.monday = task.monday;
        edit.editTask.tuesday = task.tuesday;
        edit.editTask.wednesday = task.wednesday;
        edit.editTask.thursday = task.thursday;
        edit.editTask.friday = task.friday;
        edit.editTask.saturday = task.saturday;
        [self.navigationController pushViewController:edit animated:YES];
    }];
    return @[action, action2];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
