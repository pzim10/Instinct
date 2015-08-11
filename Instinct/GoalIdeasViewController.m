//
//  GoalIdeasViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/10/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalIdeasViewController.h"
#import "GoalIdeas2VC.h"

@implementation GoalIdeasViewController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topic"];
    
    NSArray *cells = [TableViewData topicsTable];
    
    cell.textLabel.text = cells[indexPath.row];
    
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [TableViewData topicsTable].count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    GoalIdeas2VC *detail = segue.destinationViewController;
    detail.ideaIndex = indexPath.row;    
}

@end
