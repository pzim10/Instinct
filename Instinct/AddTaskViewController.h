//
//  TaskViewController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property(nonatomic, strong) NSArray *switches;
@property(nonatomic, strong) NSArray *labels;

@end
