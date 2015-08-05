//
//  TaskController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskController.h"
#import "Objects.h"

@implementation TaskController

// Create new task

+(void)createTaskWtihNameAndDays: (NSString *)name arrayOfDays:(NSArray *) days{
    Task *newTask = [Task new];
    newTask.name = name;
    newTask.daysUntilComplete = 66;
    newTask.daysToPerfomTask = days;
    newTask.daysCompleted = 0;
    
    [[Objects sharedObject].tasks addObject:newTask];
}

// Display tasks and Goals
+(Task *)getTaskWithName: (NSString *)name{
    for (Task *task in [Objects sharedObject].tasks) {
        if ([task.name isEqualToString:name]) {
            return task;
        }
    }
    return nil;
}

// Edit tasks, re-arrange/ organize with new goals, update
+(void)renameTask:(Task *)taskName newName: (NSString *)newName{
    taskName.name = newName;
}
+(void)changeDaysToCompleteForTask:(Task *)taskName daysToComplete:(NSArray *)days{
    taskName.daysToPerfomTask = days;
}
+(void)updateCompletionFromTodayForTask:(Task *)taskName{
    taskName.daysUntilComplete--;
    if (taskName.daysUntilComplete == 0) {
        // Send out notification of success! perhaps even an awesome success view!
        NSLog(@"Success");
    }
}
+(void)updateDaysCompleted: (BOOL) complete forTask:(Task *)taskName{
    taskName.daysCompleted++;
}
+(void)updateConsecutiveDaysCompletedForTask:(Task *)taskName{
    if (taskName.complete && taskName.completedYesterday) {
        taskName.consecutiveDaysCompleted++;
    }
}

// Delete tasks
+(void)deleteTask:(Task *)task{
    task.name = nil;
    task.goalName = nil;
    task.daysCompleted = 0;
    task.daysToPerfomTask = nil;
    task.daysUntilComplete = 0;
    task.consecutiveDaysCompleted = 0;
    task.complete = nil;
    task.completedYesterday = nil;
    
    [[Objects sharedObject].tasks removeObject:task];
    
    [task delete:task];
}
@end
