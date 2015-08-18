//
//  AddReminderViewController.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskController.h"

@interface AddReminderViewController : UIViewController

@property (nonatomic, strong) Task *task;
@property (nonatomic, strong) NSString *theDay;

@end
