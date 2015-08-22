//
//  AddReminderViewController.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskController.h"

static NSString const *notificationUserInfoKey = @"UserInfoKey";

@interface AddReminderViewController : UIViewController

@property (nonatomic, strong) Task *task;

@end
