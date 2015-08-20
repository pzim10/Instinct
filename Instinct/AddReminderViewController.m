//
//  AddReminderViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddReminderViewController.h"
#import "TodayController.h"

static CGFloat oneDayInterval = 86400;
static CGFloat weekInterval = 604800;
static NSString const *notificationUserInfoKey = @"UserInfoKey";

@interface AddReminderViewController ()


@property (weak, nonatomic) IBOutlet UIDatePicker *alarmTimer;
@property (weak, nonatomic) IBOutlet UIButton *vibrateButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *daysControl;
@property (assign, nonatomic) NSInteger daySelected;

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIUserNotificationType types = UIUserNotificationTypeBadge |
    UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings =
    [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    self.daySelected = [self.daysControl selectedSegmentIndex];
    [self.daysControl setTitleTextAttributes:@{@"Font":[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    [self.daysControl setTitle:@"Su" forSegmentAtIndex:1];
    [self.daysControl setTitle:@"M" forSegmentAtIndex:2];
    [self.daysControl setTitle:@"Tu" forSegmentAtIndex:3];
    [self.daysControl setTitle:@"W" forSegmentAtIndex:4];
    [self.daysControl setTitle:@"Th" forSegmentAtIndex:5];
    [self.daysControl setTitle:@"F" forSegmentAtIndex:6];
    [self.daysControl setTitle:@"Sa" forSegmentAtIndex:7];
}


- (IBAction)saveTapped:(id)sender {
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.alertBody = [NSString stringWithFormat: @"%@", self.task.name];
    
    int count = (int)[UIApplication sharedApplication].scheduledLocalNotifications.count;
    localNotification.userInfo = @{notificationUserInfoKey : [NSString stringWithFormat:@"%d", count]};
    
    NSString *today = [TodayController getToday];
    int i = 0;
    if ([today isEqualToString:@"Sunday"]) {
        i = 0;
    } else if ([today isEqualToString:@"Monday"]) {
        i = 1;
    } else if ([today isEqualToString:@"Tuesday"]) {
        i = 2;
    } else if ([today isEqualToString:@"Wednesday"]) {
        i = 3;
    } else if ([today isEqualToString:@"Thursday"]) {
        i = 4;
    } else if ([today isEqualToString:@"Friday"]) {
        i = 5;
    } else if ([today isEqualToString:@"Saturday"]) {
        i = 6;
    }

    if (self.daysControl.selectedSegmentIndex == 0) {
        NSDate *begin = [self.alarmTimer.date dateByAddingTimeInterval: (-i *oneDayInterval)];
        
        NSArray *taskDays = @[
                              self.task.sunday, self.task.monday, self.task.tuesday,
                              self.task.wednesday, self.task.thursday, self.task.friday, self.task.saturday,
                              ];
        i = 0;
        for (NSNumber *number in taskDays) {
            if (localNotification) {
                if ([number isEqual:@0]) {
                    localNotification.fireDate = [begin dateByAddingTimeInterval:oneDayInterval *i];
                    localNotification.repeatInterval = weekInterval;
                    NSLog(@"%@", localNotification.fireDate);
            [UIApplication sharedApplication].applicationIconBadgeNumber += 1;
                    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
                }
            }
            i++;
        }
    } else {
        i = (int)self.daysControl.selectedSegmentIndex - (i + 1);
        NSDate *begin = [self.alarmTimer.date dateByAddingTimeInterval: (i *oneDayInterval)];
        
        localNotification.fireDate = begin;
        localNotification.repeatInterval = weekInterval;
        NSLog(@"%@", localNotification.fireDate);
        [UIApplication sharedApplication].applicationIconBadgeNumber += 1;
        [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
