//
//  AddGoalViewController.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/8/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoalController.h"

@interface AddGoalViewController : UIViewController

@property (nonatomic, strong) Goal *goal;
@property (nonatomic, strong) NSString *name;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextView *notesText;


@end
