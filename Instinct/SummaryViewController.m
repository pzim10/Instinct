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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 50, 50)];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame: CGRectMake(20, 70, self.view.frame.size.width - 40, self.view.frame.size.height - 84) style:UITableViewStylePlain];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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
