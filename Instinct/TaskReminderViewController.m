//
//  EditTaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/17/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskReminderViewController.h"
#import "AddReminderViewController.h"

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

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // Confirm deletion
//        [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
    }];
    return @[action];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] -1){return NO;};
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//         get correct object and update it
    if ([segue.identifier isEqualToString:@"edit"]) {
        AddTaskViewController *edit = segue.destinationViewController;
        edit.editTask = self.task;
        edit.textField.text = self.task.name;
    } else if ([segue.identifier isEqualToString:@"addReminder"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AddReminderViewController *reminder = segue.destinationViewController;
        reminder.task = self.task;
        if (indexPath.section == 0) {
            reminder.theDay = @"Sunday";
        } else if (indexPath.section == 1) {
            reminder.theDay = @"Monday";
        } else if (indexPath.section == 2) {
            reminder.theDay = @"Tuesday";
        } else if (indexPath.section == 3) {
            reminder.theDay = @"Wednesday";
        } else if (indexPath.section == 4) {
            reminder.theDay = @"Thursday";
        } else if (indexPath.section == 5) {
            reminder.theDay = @"Friday";
        } else if (indexPath.section == 6) {
            reminder.theDay = @"Saturday";
        }

        reminder.theDay = [NSString stringWithFormat:@"%@s only", reminder.theDay];
        
    }
}


@end
