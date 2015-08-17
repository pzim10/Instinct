//
//  EditTaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/17/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskReminderViewController.h"

@interface TaskReminderViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TaskReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"addReminder"];
        cell.textLabel.text = @"Add Reminder";
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"reminder"];
        cell.textLabel.text = [NSString stringWithFormat:@"Reminder %ld", indexPath.row];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Sunday";
    } else if (section == 1) {
        return @"Monday";
    } else if (section == 2) {
        return @"Tuesday";
    } else if (section == 3) {
        return @"Wednesday";
    } else if (section == 4) {
        return @"Thursday";
    } else if (section == 5) {
        return @"Friday";
    } else if (section == 6) {
        return @"Saturday";
    }
    return nil;
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
