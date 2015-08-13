//
//  SummaryViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Summary";
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

// Public method called from DataViewController to fill the current page

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"summary"];
    
    cell.textLabel.text = [SummaryController getSummaryTitleforIndex:indexPath.row];
    switch (indexPath.row) {
        case 0:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getDaysCompleted]];
            break;
        case 1:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getDaysUntilCompleted]];
            break;
        case 2:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getCurrentConsecutiveDays]];
            break;
        case 3:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getMostConsecutiveDays]];
            break;
        case 4:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getConsecutiveTasks]];
            break;
        case 5:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getMostConsecutiveTasks]];
            break;
        case 6:
            cell.detailTextLabel.text = [NSString stringWithFormat: @"%d", [SummaryController getTotalTasks]];
            break;
        default:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [Summary sharedInstance].rank[0]];
            break;
    }
    // [0] Days toward goal, [1] till next rank, [2] current consecutive days, [3] most consecutive days, [4] consecutive tasks, [5] most consecutive tasks, [6] total tasks
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
