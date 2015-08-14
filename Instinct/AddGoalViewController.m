//
//  AddGoalViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/8/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddGoalViewController.h"

static NSString *const placeHolder= @"Add notes about this goal here";

@interface AddGoalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textCount;
@property (nonatomic, strong) NSString *maxLength;
@property (nonatomic, assign) BOOL firstTouch;

@end

@implementation AddGoalViewController

- (IBAction)saveTapped:(id)sender {
    if ([self.nameField.text isEqualToString:@""]) {
        return;
    } else if (self.taskName){
        Goal *check = [GoalController goalWithName:self.nameField.text];
        if (check) {
            self.goal.name = self.name;
        } else {
            [GoalController createGoal:self.nameField.text];
            NSArray *days = @[@0, @0, @0, @0, @0, @0,@0];
            self.taskName = [NSString stringWithFormat:@"%@ %@", self.taskName, self.nameField.text];
            [TaskController createTaskWtihNameAndDays:self.taskName arrayOfDays:days];
            
            for (Goal *goal in [GoalController goals]) {
                if ([goal.name isEqualToString:self.nameField.text]) {
                    for (Task *task in [TaskController tasks]) {
                        if ([task.name isEqualToString:self.taskName]) {
                            [GoalController addTasktoGoal:task forGoal:goal];
                            break;
                        }
                    }

                }
            }
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        Goal *check = [GoalController goalWithName:self.goal.name];
        if (check) {
            self.goal.name = self.name;
        } else {
            [GoalController createGoal:self.nameField.text];
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTouch = FALSE;
    self.maxLength = @"";
    self.notesText.textColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
    if (self.goal) {
        self.nameField.text = self.goal.name;
        self.name = self.goal.name;
    } else if (self.name || self.nameField) {
        self.nameField.text = self.name;
//        self.notesText.text = self.goal.notes;
    } else {
        self.name = @"";
        self.nameField.text = @"";
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    self.taskName = nil;
    self.goal = nil;
}

- (IBAction)nameChanged:(id)sender {
    self.name = self.nameField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textViewDidChangeSelection:(UITextView *)textView{
    if (!self.firstTouch) {
        self.notesText.text = @"";
        self.firstTouch = TRUE;
    } else if (self.notesText.text.length == 0) {
        self.notesText.text = placeHolder;
        self.notesText.textColor = [UIColor lightGrayColor];
        self.maxLength = @"";
        self.firstTouch = FALSE;
        self.textCount.text = @"0/180";
    } else if (self.maxLength.length <= 179) {
        // Update label within restraints
        self.notesText.textColor = [UIColor blackColor];
        self.textCount.text = [NSString stringWithFormat:@"%lu/180", (unsigned long)self.notesText.text.length];
        self.maxLength = self.notesText.text;
    }else if (self.maxLength.length == 180 && self.notesText.text.length < 180){
        // Allow deleting at text count limit
        self.maxLength = self.notesText.text;
        self.textCount.text = [NSString stringWithFormat:@"%lu/180", (unsigned long)self.notesText.text.length];// notesText is the textView
        self.textCount.textColor = [UIColor blackColor];
    }else {
        // Disallow adding at text count limit
        self.notesText.text = [self.notesText.text substringToIndex:180];
        self.maxLength = self.notesText.text;
        self.textCount.textColor = [UIColor redColor];
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
