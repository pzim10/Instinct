//
//  TodayViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TodayViewController.h"
#import "TaskController.h"

@interface TodayViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *todayLabel;
@property (weak, nonatomic) IBOutlet UITableView *taskTable;
@property (weak, nonatomic) IBOutlet UITextView *quoteLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Today";
}

-(void)viewWillAppear:(BOOL)animated{
    self.quoteLabel.text = @"I want to succeed.\nI can succeed.\nSo I will succeed!";
    self.quoteLabel.textAlignment = NSTextAlignmentCenter;
    self.todayLabel.text = [TodayController getToday];
    [self.taskTable reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
}

-(void)taskCompleted: (UILabel *)label {
    Task *task = [TaskController getTaskWithName:label.text];
    
    task.complete = @0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"task"];
    int i =0;
    for (Task *task in [TodayController getTasksForToday]) {
        if (i == indexPath.row) {
            cell.textLabel.text = task.name;
        }
        i++;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [TodayController getTasksForToday].count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
