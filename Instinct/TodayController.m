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
    
    NSString *today = [self getToday];
    
//  Turn today string into an array index
    if ([today isEqualToString:@"Sunday"]) {
        for (Task *task in tasks) {
            if ([task.sunday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Monday"]) {
        for (Task *task in tasks) {
            if ([task.monday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Tuesday"]) {
        for (Task *task in tasks) {
            if ([task.tuesday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Wednesday"]) {
        for (Task *task in tasks) {
            if ([task.wednesday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Thursday"]) {
        for (Task *task in tasks) {
            if ([task.thursday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Friday"]) {
        for (Task *task in tasks) {
            if ([task.friday isEqual: @0] && [task.complete isEqual:@1]) {
                [todaysTasks addObject:task];
            }
        }
    } else if ([today isEqualToString:@"Saturday"]) {
        for (Task *task in tasks) {
            if ([task.saturday  isEqual: @0] && [task.complete isEqual:@1]) {
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
