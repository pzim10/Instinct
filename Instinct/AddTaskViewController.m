//
//  TaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TaskController.h"
#import "Objects.h"
#import "GoalController.h"

@interface AddTaskViewController ()
@property (nonatomic,strong) NSString *goalName;
@property (nonatomic, strong) NSMutableArray *buttons;
// Default

@property (weak, nonatomic) IBOutlet UISwitch *daily;
@property (weak, nonatomic) IBOutlet UISwitch *weekdays;
@property (weak, nonatomic) IBOutlet UISwitch *custom;
// Custom Switches
@property (weak, nonatomic) IBOutlet UISwitch *Sunday;
@property (weak, nonatomic) IBOutlet UISwitch *Monday;
@property (weak, nonatomic) IBOutlet UISwitch *Tuesday;
@property (weak, nonatomic) IBOutlet UISwitch *Wednesday;
@property (weak, nonatomic) IBOutlet UISwitch *Thursday;
@property (weak, nonatomic) IBOutlet UISwitch *Friday;
@property (weak, nonatomic) IBOutlet UISwitch *Saturday;
// Custom Labels
@property (weak, nonatomic) IBOutlet UILabel *Su;
@property (weak, nonatomic) IBOutlet UILabel *M;
@property (weak, nonatomic) IBOutlet UILabel *Tu;
@property (weak, nonatomic) IBOutlet UILabel *W;
@property (weak, nonatomic) IBOutlet UILabel *Th;
@property (weak, nonatomic) IBOutlet UILabel *F;
@property (weak, nonatomic) IBOutlet UILabel *Sa;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    NSMutableArray *switches = [NSMutableArray arrayWithObjects:self.Sunday, self.Monday, self.Tuesday, self.Wednesday, self.Thursday, self.Friday, self.Saturday, nil];
    self.switches = switches;
    NSMutableArray *labels = [NSMutableArray arrayWithObjects:self.Su, self.M, self.Tu, self.W, self.Th, self.F, self.Sa, nil];
    self.buttons = [NSMutableArray new];
    self.labels = labels;
    int i = 0;
    CGFloat side = 0;
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 65, self.view.frame.size.width - 20, 120)];
    for (Goals *goal in [Objects sharedObject].goals) {
        if ([goal.name isEqualToString: @""]) {
        } else {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20 + 180*i, 5, 125, 110)];
        [button setTitle:goal.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(goalTapped:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:button];
        [self.buttons addObject:button];
        i++;
        side = button.frame.origin.x + 175;
        }
    }
    
    scroll.contentSize = CGSizeMake(side, 120);
    [self.view addSubview:scroll];
    
    
}

-(void)goalTapped : (UIButton *)button {
    if (button.backgroundColor == [UIColor greenColor]) {
        button.backgroundColor = [UIColor whiteColor];
    } else {
        for (UIButton *button2 in self.buttons) {
            if (button2.backgroundColor != [UIColor whiteColor]) {
                button2.backgroundColor = [UIColor whiteColor];
            }
        }
        button.backgroundColor = [UIColor greenColor];
    }
}

- (IBAction)saveTapped:(id)sender {
    if ([self.textField.text isEqualToString:@""] || self.textField.text == nil) {
        return;
    }
    for (Task *task in [Objects sharedObject].tasks) {
        if ([self.textField.text isEqualToString:task.name]) {
            return;
        }
    }
    NSMutableArray *days = [NSMutableArray new];
    if (self.daily.on) {
        for (UISwitch *switches in self.switches) {
                switches.on = YES;
                [days addObject:switches];
        }
    } else if (self.weekdays.on) {
        int i = 0;
        for (UISwitch *switches in self.switches) {
            if (i < 6 && i != 0) {
                switches.on = YES;
                [days addObject:switches];
            } else {
                switches.on = NO;
                [days addObject:switches];
            }i++;
        }
    } else if (self.custom.on) {
        for (UISwitch *switches in self.switches) {
            if (switches.on) {
                [days addObject:switches];
            } else if (!switches.on){
                [days addObject:switches];
            }
        }
    }
    [TaskController createTaskWtihNameAndDays:self.textField.text arrayOfDays:days];
    int i =0;
    if (self.buttons.count >0) {
        for (UIButton *button in self.buttons) {
            i++;
            if (button.backgroundColor == [UIColor greenColor]) {
                for (Task *task in [Objects sharedObject].tasks) {
                    if ([task.name isEqualToString: self.textField.text]){
                        [GoalController addTasktoGoal:task forGoal:[GoalController goalWithName:button.titleLabel.text]];
                        [self.navigationController popViewControllerAnimated:YES];
                        return;
                    }
                }
            } else if (i == self.buttons.count){
                for (Task *task in [Objects sharedObject].tasks) {
                    if ([task.name isEqualToString: self.textField.text]){
                        [GoalController addTasktoGoal:task forGoal:[GoalController goalWithName:@""]];
                        break;
                    }
                }
            }
        }
    } else {
        for (Task *task in [Objects sharedObject].tasks) {
            if ([task.name isEqualToString: self.textField.text]){
                [GoalController addTasktoGoal:task forGoal:[GoalController goalWithName:@""]];
            }
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dailyChanged:(id)sender {
    if (self.daily.on) {
        self.weekdays.on = NO;
        if (self.custom.on) {
            self.custom.on = NO;
            for (UISwitch *switches in self.switches) {
                switches.hidden = YES;
            }
            for (UILabel *labels in self.labels) {
                labels.hidden = YES;
            }
        }
    }
}
- (IBAction)weekdaysChanged:(id)sender {
    if (self.weekdays.on) {
        self.daily.on = NO;
        if (self.custom.on) {
            self.custom.on = NO;
            for (UISwitch *switches in self.switches) {
                switches.hidden = YES;
            }
            for (UILabel *labels in self.labels) {
                labels.hidden = YES;
            }
        }

    }
}
- (IBAction)customChanged:(id)sender {
    if (self.custom.on) {
        self.daily.on = NO;
        self.weekdays.on = NO;
        
        for (UISwitch *switches in self.switches) {
            switches.hidden = NO;
        }
        for (UILabel *labels in self.labels) {
            labels.hidden = NO;
        }
    } else {
        for (UISwitch *switches in self.switches) {
            switches.hidden = YES;
        }
        for (UILabel *labels in self.labels) {
            labels.hidden = YES;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
