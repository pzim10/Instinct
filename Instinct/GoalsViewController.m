//
//  GoalsViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalsViewController.h"
#import "GoalDetailViewController.h"
#import "AddGoalViewController.h"

@interface GoalsViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Goals";
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


-(void)viewWillDisappear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.row < [GoalController goals].count) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"goal"];
        Goal *goal = [GoalController goals][indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", goal.name];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"addGoal"];
        cell.textLabel.text = @"Add Goal";
    }
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [GoalController goals].count +1;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goalDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        GoalDetailViewController *detail = segue.destinationViewController;
        detail.goal = [GoalController goalWithName:cell.textLabel.text];
    }
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // remove object from task array;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        Goal *goal = [GoalController goalWithName:cell.textLabel.text];
        [GoalController removeGoal:goal];
        [self viewWillAppear:YES];
        
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

//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{return YES;}

//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
