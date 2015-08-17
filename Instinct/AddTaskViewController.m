//
//  TaskViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TaskController.h"
#import "GoalController.h"

@interface AddTaskViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDeadline;
@property (nonatomic,strong) NSString *goalName;
@property (nonatomic, strong) NSString *buttonName;
@property (nonatomic, strong) NSMutableArray *buttons;
// Default
@property (weak, nonatomic) IBOutlet UILabel *addOrEdit;

@property (weak, nonatomic) IBOutlet UISwitch *daily;
@property (weak, nonatomic) IBOutlet UISwitch *custom;
@property (weak, nonatomic) IBOutlet UISwitch *deadline;
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
    if (self.editTask.deadline) {
        self.deadline.on = YES;
        self.taskDeadline.hidden = NO;
        self.taskDeadline.date = self.editTask.deadline;
        self.taskDeadline.minimumDate = [NSDate date];
        
        self.textField.text = self.editTask.name;
        self.addOrEdit.text = @"(Tapping on a new goal will copy this task to the new goal)";
        self.deadline.on = YES;
        self.daily.on = NO;
        self.custom.on = NO;
        
    } else if (self.editTask) {
        self.buttonName = self.editTask.goal.name;
        self.textField.text = self.editTask.name;
        self.addOrEdit.text = @"(Tapping on a new goal will copy this task to the new goal)";
        
        if ([self.editTask.sunday isEqual: @1]) {
            self.Sunday.on = NO;
        } if ([self.editTask.monday isEqual: @1]) {
            self.Monday.on = NO;
        } if ([self.editTask.tuesday isEqual: @1]) {
            self.Tuesday.on = NO;
        } if ([self.editTask.wednesday isEqual: @1]) {
            self.Wednesday.on = NO;
        } if ([self.editTask.thursday isEqual: @1]) {
            self.Thursday.on = NO;
        } if ([self.editTask.friday isEqual: @1]) {
            self.Friday.on = NO;
        } if ([self.editTask.saturday isEqual:@1]) {
            self.Saturday.on = NO;
        }
        
        self.custom.on = YES;
        self.daily.on = NO;
        self.deadline.on = NO;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
}

-(void)viewWillAppear:(BOOL)animated{
    NSMutableArray *switches = [NSMutableArray arrayWithObjects:self.Sunday, self.Monday, self.Tuesday, self.Wednesday, self.Thursday, self.Friday, self.Saturday, nil];
    self.switches = switches;
    NSMutableArray *labels = [NSMutableArray arrayWithObjects:self.Su, self.M, self.Tu, self.W, self.Th, self.F, self.Sa, nil];
    self.buttons = [NSMutableArray new];
    self.labels = labels;
    
    if (self.editTask && self.editTask.deadline) {
        self.taskDeadline.hidden = NO;
    } else if (self.editTask) {
        for (UILabel *label in labels) {
            label.hidden = NO;
        }
        for (UISwitch *day in switches) {
            day.hidden = NO;
        }
    }
    
    // DatePicker
    self.taskDeadline.minimumDate = [NSDate date];
    
    // Goals
    
    int i = 0;
    CGFloat side = 0;
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 65, self.view.frame.size.width - 20, 120)];
    for (Goal *goal in [GoalController goals]) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20 + 180*i, 5, 125, 75)];
        [button setTitle:goal.name forState:UIControlStateNormal];
        button.titleLabel.numberOfLines = 0;
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        if ([self.editTask.goal.name isEqualToString: button.titleLabel.text]) {
            button.backgroundColor = [UIColor greenColor];
        } else {
            button.backgroundColor = [UIColor whiteColor];
        }
        [button addTarget:self action:@selector(goalTapped:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:button];
        [self.buttons addObject:button];
        i++;
        side = button.frame.origin.x + 175;
    }
    
    scroll.contentSize = CGSizeMake(side, 120);
    [self.view addSubview:scroll];
    
    
}

-(void)goalTapped : (UIButton *)button {
        for (UIButton *button2 in self.buttons) {
            if (button2.backgroundColor != [UIColor whiteColor]) {
                button2.backgroundColor = [UIColor whiteColor];
            }
        }
        button.backgroundColor = [UIColor greenColor];
        self.buttonName = button.titleLabel.text;
}

- (IBAction)saveTapped:(id)sender {
    // Check if a name exists, check if goal is highlighted
    
    if ([self.textField.text isEqualToString:@""] || self.textField.text == nil) {
        return;
    } else {
        BOOL good = FALSE;
        for (UIButton *button in self.buttons) {
            if (button.backgroundColor == [UIColor greenColor]) {
                good = TRUE;
            }
        }
        if (!good) {
            return;
        }
    }
    
//  Renaming Tasks, Change days to complete or assign a deadline
    
    if (self.editTask  && [self.buttonName isEqualToString:self.editTask.goal.name]) {
        Goal *goal = [GoalController goalWithName:self.editTask.goal.name];
        for (Task* task in goal.tasks) {
            if ([task.name isEqualToString:self.editTask.name]) {
                NSArray *days = [self daysArray];
                [TaskController changeDaysToCompleteForTask:task daysToComplete:days];
                if (!self.taskDeadline.hidden) {
                    task.deadline = self.taskDeadline.date;
                }
                
                [TaskController renameTask:task newName:self.textField.text];
                [TaskController save];
                [GoalController save];
                [self.navigationController popViewControllerAnimated:YES];
                return;
            }
        }
    }
    
//  Creating New Tasks
    
    NSArray *days = [self daysArray];
    [TaskController createTaskWtihNameAndDaysOrDeadline:self.textField.text arrayOfDays:days deadline:self.taskDeadline.date];
    
//  Assigning the goal
    
    int i =0;
    for (UIButton *button in self.buttons) {
        i++;
        if (button.backgroundColor == [UIColor greenColor]) {
            for (Task *task in [TaskController tasks]) {
                if ([task.name isEqualToString: self.textField.text] && !task.goal.name ){
                    [GoalController addTasktoGoal:task forGoal:[GoalController goalWithName:button.titleLabel.text]];
                    [self.navigationController popViewControllerAnimated:YES];
                    [GoalController save];
                    [TaskController save];
                    return;
                }
            }
        }
    }
}

-(NSArray *)daysArray {
    NSMutableArray *days = [NSMutableArray new];
    if (self.daily.on) {
        for (UISwitch *switches in self.switches) {
            switches.on = YES;
            [days addObject:@0];
        }
    } else if (self.deadline.on) {
        days = nil;
    } else if (self.custom.on) {
        for (UISwitch *switches in self.switches) {
            if (switches.on) {
                [days addObject:@0];
            } else if (!switches.on){
                [days addObject:@1];
            }
        }
    }
    return days;
}

- (IBAction)dailyChanged:(id)sender {
    if (self.daily.on) {
        self.taskDeadline.hidden = YES;
        self.deadline.on = NO;
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
- (IBAction)deadlineChanged:(id)sender {
    if (self.deadline.on) {
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
        self.taskDeadline.hidden = NO;
    }else{
        self.taskDeadline.hidden = YES;
    }
}
- (IBAction)customChanged:(id)sender {
    if (self.custom.on) {
        self.daily.on = NO;
        self.deadline.on = NO;
        self.taskDeadline.hidden = YES;
        
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
