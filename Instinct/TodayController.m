//
//  TodayController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TodayController.h"
#import "GoalController.h"
#import "TaskController.h"

@implementation TodayController

+(void)fetchQuote{
    
}

+(NSString *)getToday{
    NSDateFormatter *today = [NSDateFormatter new];
    today.dateFormat = @"EEEE";
    return [today stringFromDate:[NSDate date]];
}

+(NSArray *)getTasksForToday{
    NSArray *tasks = [Objects sharedObject].tasks;
    if (tasks.count == 0) {
        return tasks;
    }
    NSMutableArray *todaysTasks = [NSMutableArray new];
    
    int dayOfWeek = 5;
    NSString *today = [self getToday];
    
//  Turn today string into an array index
    if ([today isEqualToString:@"Sunday"]) {
        dayOfWeek= 0;
    } else if ([today isEqualToString:@"Monday"]) {
        dayOfWeek= 1;
    } else if ([today isEqualToString:@"Tuesday"]) {
        dayOfWeek= 2;
    } else if ([today isEqualToString:@"Wednesday"]) {
        dayOfWeek= 3;
    } else if ([today isEqualToString:@"Thursday"]) {
        dayOfWeek= 4;
    } else if ([today isEqualToString:@"Friday"]) {
        dayOfWeek= 5;
    } else if ([today isEqualToString:@"Saturday"]) {
        dayOfWeek= 6;
    }
//  Search Object tasks for all tasks whose "Today" value is true
    for (Task *task in tasks) {
        UISwitch *switches = task.daysToPerfomTask[dayOfWeek];
        if (switches.on) {
            [todaysTasks addObject:task];
        }
    }
    if (todaysTasks == nil) {
        NSLog(@"todayTasks returned nil");
    }
    return todaysTasks;
}

// Create notes

@end
