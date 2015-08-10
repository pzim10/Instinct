//
//  SummaryViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController () <UITableViewDataSource>

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
}

// Public method called from DataViewController to fill the current page

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"summary"];
    
    cell.textLabel.text = [SummaryController getSummaryTitleforIndex:indexPath.row];
    if (indexPath.row != 6) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [Summary sharedInstance].daysCounter[indexPath.row]];
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [Summary sharedInstance].rank[0]];
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [SummaryController getSummaryTitlesArray].count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
