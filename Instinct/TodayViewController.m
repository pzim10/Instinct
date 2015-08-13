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

@property (nonatomic, strong) NSMutableArray *switches;
@property (nonatomic, strong) UISwitch *taskCompletion;

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
    self.switches = [NSMutableArray new];
    [self.taskTable reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"task"];
    int i =0;
    for (Task *task in [TodayController getTasksForToday]) {
        if (i == indexPath.row) {
            cell.textLabel.text = task.name;
            UISwitch *complete = [[UISwitch alloc] initWithFrame:CGRectMake(tableView.frame.size.width - 60, 5, 0, 0)];
            complete.tag = indexPath.row;
            complete.hidden = YES;
            [self.switches addObject:complete];
            
            [complete addTarget:self action:@selector(taskCompleted:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:complete];
            return cell;
        }
        i++;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [TodayController getTasksForToday].count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.taskCompletion.hidden = YES;
    self.taskCompletion = self.switches[indexPath.row];
    self.taskCompletion.hidden = NO;
}

-(void)taskCompleted: (UISwitch *)sender{
    int i =0;
    for (Task *task in [TodayController getTasksForToday]) {
        if (i == sender.tag) {
            [TaskController updateDaysCompletedForTask:task];
        }
        i++;
    }
    [self.switches removeObject:sender];
    sender.on = NO;
    sender.hidden = YES;
    [self viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
