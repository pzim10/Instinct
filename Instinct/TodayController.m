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
    NSArray *tasks = [TaskController tasks];
    if (tasks.count == 0) {
        return tasks;
    }
    NSMutableArray *todaysTasks = [NSMutableArray new];
    
    int dayOfWeek = 5;
    NSString *today = [self getToday];
    
//  Turn today string into an array index
    if ([today isEqualToString:@"Sunday"]) {
        dayOfWeek= 0;
        for (Task *task in tasks) {
            if (task.sunday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Monday"]) {
        dayOfWeek= 1;
        for (Task *task in tasks) {
            if (task.monday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Tuesday"]) {
        dayOfWeek= 2;
        for (Task *task in tasks) {
            if (task.tuesday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Wednesday"]) {
        dayOfWeek= 3;
        for (Task *task in tasks) {
            if (task.wednesday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Thursday"]) {
        dayOfWeek= 4;
        for (Task *task in tasks) {
            if (task.thursday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Friday"]) {
        dayOfWeek= 5;
        for (Task *task in tasks) {
            if (task.friday == 0) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Saturday"]) {
        dayOfWeek= 6;
        for (Task *task in tasks) {
            if (task.saturday == 0) {
                [todaysTasks addObject:task];
            }
        }
    }
//  Search Object tasks for all tasks whose "Today" value is true
    if (todaysTasks == nil) {
        NSLog(@"todayTasks returned nil");
    }
    return todaysTasks;
}

// Create notes

@end
