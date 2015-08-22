//
//  AddReminderViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddReminderViewController.h"
#import "ReminderController.h"
#import "TodayController.h"

static CGFloat oneDayInterval = 86400;
static CGFloat weekInterval = 604800;


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
    
//    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:10];
//    UILocalNotification *localNotification = [UILocalNotification new];
//    localNotification.fireDate = alertTime;
//    localNotification.alertBody = @"Alert body";
//    localNotification.timeZone = [NSTimeZone defaultTimeZone];
//    localNotification.applicationIconBadgeNumber = 1;
//    localNotification.repeatInterval = 0;
//    NSLog(@"%@", localNotification.fireDate);
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    NSLog(@"%lu", (unsigned long)[[UIApplication sharedApplication] scheduledLocalNotifications].count);
    
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.alertBody = [NSString stringWithFormat: @"%@", self.task.name];
    
    int count = (int)[UIApplication sharedApplication].scheduledLocalNotifications.count;
    localNotification.userInfo = @{notificationUserInfoKey : [NSString stringWithFormat:@"%d", count]};
    
    NSMutableArray *taskDays = [NSMutableArray arrayWithObjects:self.task.sunday, self.task.monday, self.task.tuesday,
                                self.task.wednesday, self.task.thursday, self.task.friday, self.task.saturday, nil];
    
    NSString *today = [TodayController getToday];
    int i = 0;
    if ([today isEqualToString:@"Sunday"]) {
        i = 1;
    } else if ([today isEqualToString:@"Monday"]) {
        i = 2;
    } else if ([today isEqualToString:@"Tuesday"]) {
        i = 3;
    } else if ([today isEqualToString:@"Wednesday"]) {
        i = 4;
    } else if ([today isEqualToString:@"Thursday"]) {
        i = 5;
    } else if ([today isEqualToString:@"Friday"]) {
        i = 6;
    } else if ([today isEqualToString:@"Saturday"]) {
        i = 7;
    }
    for (int j = 1; j < i; j++) {
        NSNumber *number = taskDays[0];
        [taskDays removeObjectAtIndex:0];
        [taskDays addObject:number];
    }

    if (self.daysControl.selectedSegmentIndex == 0) {
        i = 0;
        for (NSNumber *number in taskDays) {
            if (localNotification) {
                if ([number isEqual:@0]) {
                    localNotification.fireDate = [self.alarmTimer.date dateByAddingTimeInterval:oneDayInterval *i];
                    localNotification.repeatInterval = 120;
                    NSLog(@"%@", localNotification.fireDate);
                    
                    count = (int)[UIApplication sharedApplication].scheduledLocalNotifications.count;
                    localNotification.userInfo = @{notificationUserInfoKey : [NSString stringWithFormat:@"%d", count]};
                    
                    NSLog(@"%@",localNotification.userInfo);
                    
//                    [UIApplication sharedApplication].applicationIconBadgeNumber += 1;
                    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
                    
                    NSDateFormatter *todayFormat = [NSDateFormatter new];
                    todayFormat.dateFormat = @"EEEE";
                    
                    [ReminderController createReminderWithDay:[todayFormat stringFromDate:localNotification.fireDate] userInfo:localNotification.userInfo[notificationUserInfoKey] fireTime:localNotification.fireDate andTask:self.task];
                }
            }
            i++;
        }
    } else {
        if (i < (int)self.daysControl.selectedSegmentIndex) {
            i = (int)self.daysControl.selectedSegmentIndex - i;
        } else if (i == (int)self.daysControl.selectedSegmentIndex){
            i = 0;
        }else {
            i = 2 + (int)self.daysControl.selectedSegmentIndex;
        }
        NSDate *begin = [self.alarmTimer.date dateByAddingTimeInterval: (i *oneDayInterval)];
        
        localNotification.fireDate = begin;
        localNotification.repeatInterval = weekInterval;
        NSLog(@"%@", localNotification.fireDate);
        [UIApplication sharedApplication].applicationIconBadgeNumber += 1;
        [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
        
        NSDateFormatter *todayFormat = [NSDateFormatter new];
        todayFormat.dateFormat = @"EEEE";
        
        [ReminderController createReminderWithDay:[todayFormat stringFromDate:begin] userInfo:localNotification.userInfo[notificationUserInfoKey] fireTime:localNotification.fireDate andTask:self.task];
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
