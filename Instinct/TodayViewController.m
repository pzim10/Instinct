//
//  TodayViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TodayViewController.h"
#import "TaskController.h"

@interface TodayViewController ()

@property (nonatomic, strong) UILabel *todayLabel;
@property (nonatomic, strong) UILabel *taskLabel;
@property (nonatomic, strong) UILabel *quoteLabel;
@property (nonatomic, strong) UIScrollView *labels;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 75, 64, 150, 50)];
    self.taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 75, 125, 150, 50)];
    self.labels = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 175, self.view.frame.size.width - 30, 300)];
    self.quoteLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 490, self.view.frame.size.width - 40,
                                                                    self.view.frame.size.height - 500)];
    
    // bottom is used to determine the scrollView contentSize
    CGFloat bottom = 0.0;
    for (int i = 0; i < [TodayController getTasksForToday].count; i++) {
        Task *labelTask = [TodayController getTasksForToday][i];
        if (!labelTask.complete) {
            UILabel *plan = [[UILabel alloc] initWithFrame:CGRectMake(15, 15*(i+1) + 50*i, self.labels.frame.size.width - 30, 50)];
            UISwitch *completionIndicator = [[UISwitch alloc] initWithFrame:CGRectMake(plan.frame.size.width - 55, 5, 0, 0)];
            
            completionIndicator.on = labelTask.complete;
            plan.text = labelTask.name;
            plan.textAlignment = NSTextAlignmentCenter;
            
            [completionIndicator addTarget:self action:@selector(taskCompleted:) forControlEvents:UIControlEventValueChanged];
            
            [plan addSubview:completionIndicator];
            [self.labels addSubview:plan];
            bottom = plan.frame.origin.y + 65;
        }
    }
    self.labels.contentSize = CGSizeMake(self.labels.frame.size.width, bottom);
    
    // Quote size and text
    self.quoteLabel.numberOfLines = 0;
    self.quoteLabel.text = @"I want to succeed.\nI can succeed.\nSo I will succeed!";
    self.quoteLabel.textAlignment = NSTextAlignmentCenter;
    
    //  today label
    self.todayLabel.textAlignment = NSTextAlignmentCenter;
    self.todayLabel.font = [UIFont systemFontOfSize:26];
    //  task Label
    self.taskLabel.text = @"Today's tasks";
    self.taskLabel.textAlignment = NSTextAlignmentCenter;
    //  Set Today to correct day of Week
    self.todayLabel.text = [TodayController getToday];
    
    [self.view addSubview:self.quoteLabel];
    [self.view addSubview:self.todayLabel];
    [self.view addSubview:self.taskLabel];
    [self.view addSubview:self.labels];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.quoteLabel.hidden = YES;
    self.todayLabel.hidden = YES;
    self.taskLabel.hidden = YES;
    self.labels.hidden = YES;
}

-(void)taskCompleted: (UILabel *)label {
    Task *task = [TaskController getTaskWithName:label.text];
    
    task.complete = @0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
