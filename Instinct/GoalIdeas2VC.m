//
//  GoalIdeas2VC.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/10/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalIdeas2VC.h"
#import "AddGoalViewController.h"

@implementation GoalIdeas2VC

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idea"];
    if (indexPath.row < [TableViewData myKeys:self.ideaIndex].count) {
        NSArray *cells = [TableViewData myKeys:self.ideaIndex];
        cell.textLabel.text = cells[indexPath.row];
    } else {
        cell.textLabel.text = @"Other";
    }
    [cell setAccessoryType: UITableViewCellAccessoryCheckmark];
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [TableViewData myKeys:self.ideaIndex].count + 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    AddGoalViewController *add = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddGoalViewController class])];
    
    NSArray* vcs = self.navigationController.viewControllers;
    add = [vcs objectAtIndex:([vcs count] - 1) - 2];
    add.name = cell.textLabel.text;
    add.nameField.text = cell.textLabel.text;
    
    add.taskName = @"Practice";
    
    add.navigationItem.title = @"Add Goal";
    [self.navigationController popToViewController:add animated:YES];
}

@end
