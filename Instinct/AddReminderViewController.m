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
    self.daysLabel.text = self.theDay;
}
- (IBAction)daysSwitchChanged:(id)sender {
    if (self.daysSwitch.on) {
        self.daysLabel.text = self.theDay;
    }else {
        self.daysLabel.text = @"Task days";
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
