//
//  AddGoalViewController.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/8/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalController.h"
#import "TaskController.h"

@interface AddGoalViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Task *task;
@property (nonatomic, strong) NSString *taskName;
@property (nonatomic, assign) BOOL firstGoal;

@property (strong, nonatomic) NSString *imageName;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextView *notesText;


@end
