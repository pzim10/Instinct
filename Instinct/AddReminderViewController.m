//
//  AddReminderViewController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *daysSwitch;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *alarmTimer;
@property (weak, nonatomic) IBOutlet UIButton *vibrateButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;

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
    self.daysLabel.text = self.theDay;
}
- (IBAction)daysSwitchChanged:(id)sender {
    if (self.daysSwitch.on) {
        self.daysLabel.text = self.theDay;
    }else {
        self.daysLabel.text = @"Task days";
    }
}

- (IBAction)saveTapped:(id)sender {
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.repeatInterval = NSCalendarUnitWeekOfYear;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.alertBody = [NSString stringWithFormat: @"%@", self.task.name];
    if (self.daysSwitch.on) {
        if (localNotification) {
            localNotification.fireDate = self.alarmTimer.date;
            
            [UIApplication sharedApplication].applicationIconBadgeNumber = localNotification.applicationIconBadgeNumber +1;
            [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
        }
    } else {
        NSArray *taskDays = @[
                              self.task.sunday, self.task.monday, self.task.tuesday,
                              self.task.wednesday, self.task.thursday, self.task.friday, self.task.saturday,
                              ];
        int i =0;
        for (NSNumber *number in taskDays) {
            if (localNotification) {
                if ([number isEqual:@0]) {
//                    localNotification.fireDate = self.alarmTimer.date + i * NSCalendarUnitDay ;

            [UIApplication sharedApplication].applicationIconBadgeNumber = localNotification.applicationIconBadgeNumber +1;
                    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
                }
            }
            i++;
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
