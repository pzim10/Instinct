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
}

-(void)viewWillAppear:(BOOL)animated{
    
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
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [GoalController goals].count +1;
}

@end
