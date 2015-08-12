//
//  TaskController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TaskController.h"
#import "GoalController.h"

@implementation TaskController

// Create new task
+ (TaskController *)sharedTask {
    static TaskController *sharedTask = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTask = [TaskController new];
    });
    return sharedTask;
}

+(void)createTaskWtihNameAndDays: (NSString *)name arrayOfDays:(NSArray *) days{
    Task *newTask = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    newTask.name = name;
    newTask.daysUntilComplete = @66;
    newTask.sunday = days[0];
    newTask.monday = days[1];
    newTask.tuesday = days[2];
    newTask.wednesday = days[3];
    newTask.thursday = days[4];
    newTask.friday = days[5];
    newTask.saturday = days[6];

    newTask.daysCompleted = @0;
    
    [self save];
}

+ (NSArray *)tasks {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Task"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

// Display tasks and Goals
+(Task *)getTaskWithName: (NSString *)name{
    for (Task *task in [self tasks]) {
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
    Goal *goal = taskName.goal;
    for (Task *task in goal.tasks) {
        if ([task.name isEqualToString:newName]) {
            return;
        }
    }
    taskName.name = newName;
    [self save];
}

+(void)changeDaysToCompleteForTask:(Task *)taskName daysToComplete:(NSArray *)days{
    taskName.sunday = days[0];
    taskName.monday = days[1];
    taskName.tuesday = days[2];
    taskName.wednesday = days[3];
    taskName.thursday = days[4];
    taskName.friday = days[5];
    taskName.saturday = days[6];
}

+(void)updateCompletionFromTodayForTask:(Task *)taskName{
//    taskName.daysUntilComplete--;
    if (taskName.daysUntilComplete == 0) {
        // Send out notification of success! perhaps even an awesome success view!
        NSLog(@"Success");
    }
}
+(void)updateDaysCompleted: (BOOL) complete forTask:(Task *)taskName{
//    taskName.daysCompleted++;
}
+(void)updateConsecutiveDaysCompletedForTask:(Task *)taskName{
    if (taskName.complete && taskName.completedYesterday) {
//        taskName.consecutiveDaysCompleted++;
    }
}

+ (void)removeTask:(Task *)task {
    [task.managedObjectContext deleteObject:task];
}

@end
