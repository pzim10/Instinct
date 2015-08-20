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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addReminder;
@property (strong, nonatomic) UIBarButtonItem *editTask;

@end

@implementation TaskReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.editTask = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editSegueProgrammatically)];
    self.navigationItem.rightBarButtonItems = @[self.addReminder, self.editTask];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"reminder"];
    cell.textLabel.text = [NSString stringWithFormat:@"Reminder %ld", indexPath.row];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddReminderViewController *reminder = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddReminderViewController class])];
    [self.navigationController pushViewController:reminder animated:YES];
    // Assign date and time to the notification setting and have the correct boxes checked.
}

#pragma mark - Navigation
-(void)editSegueProgrammatically {
    AddTaskViewController *edit = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddTaskViewController class])];
    edit.editTask = self.task;
    edit.textField.text = self.task.name;
    [self.navigationController pushViewController:edit animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//         get correct object and update it
    if ([segue.identifier isEqualToString:@"addReminder"]){
        AddReminderViewController *reminder = segue.destinationViewController;
        reminder.task = self.task;
    }
}


@end
