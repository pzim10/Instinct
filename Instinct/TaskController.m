//
//  TaskController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskController.h"
#import "Objects.h"
#import "Stack.h"

@implementation TaskController

// Create new task

+(void)createTaskWtihNameAndDays: (NSString *)name arrayOfDays:(NSArray *) days{
    Task *newTask = [Task new];
    newTask.name = name;
    newTask.daysUntilComplete = 66;
    newTask.daysToPerfomTask = days;
    newTask.daysCompleted = 0;
    
    [self save];
    
    [[Objects sharedObject].tasks addObject:newTask];
}

- (Task *)createTaskWithName:(NSString *)name {
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    task.name = name;
    
    return task;
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
+(void)save {
    [self saveToPersistentStorage];
}

+(void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

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

+ (void)removeTask:(Task *)task {
//    [task.managedObjectContext deleteObject:task];
}

@end
