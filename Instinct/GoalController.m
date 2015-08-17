//
//  GoalController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalController.h"
#import "TaskController.h"

static NSString *imageKey = @"imageKey";

@interface GoalController ()

@property (strong, nonatomic) NSArray *goals;

@end

@implementation GoalController

+ (GoalController *)sharedGoal {
    static GoalController *sharedGoal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGoal = [GoalController new];
    });
    return sharedGoal;
}

// Create a new goal

+ (NSArray *)goals {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Goal"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

+(void)createGoalWithTitleNotesAndImage:(NSString *)name notes:(NSString *)notes imageNamed:(NSString *)imageName{
    Goal *newGoal = [NSEntityDescription insertNewObjectForEntityForName:@"Goal" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    newGoal.name = name;
    newGoal.notes = notes;
    newGoal.visualGoalPath = imageName;
    
    [self save];
}

- (Goal *)createGoalWithName:(NSString *)name {
    
    Goal *goal = [NSEntityDescription insertNewObjectForEntityForName:@"Goals" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    goal.name = name;
    
    return goal;
}

// Display the goal

+(Goal *)goalWithName:(NSString *)goalName{
    for (Goal *goal in [self goals]) {
        if ([goal.name isEqualToString:goalName]) {
            return goal;
        }
    }
    
    NSLog(@"goal did not return");
    return nil;
}

+(NSString *)goalTitle: (Goal*) goal{
    return goal.name;
}

// Edit the goal
+(void)save {
    [self saveToPersistentStorage];
}

+ (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

+(void)addTasktoGoal:(Task *)task forGoal: (Goal *)goal{
    task.goal = goal;
    [self save];
}
+(void)removeTaskFromGoal:(Task *)task fromGoal: (Goal *)goal{
    for (Task *task2 in goal.tasks) {
        if (task2 == task) {
            [TaskController removeTask:task];
        }
    }
    [self save];
}

+(void)removeGoal:(Goal *)goal {
    for (Task *task in goal.tasks) {
        [TaskController removeTask:task];
    }
    [goal.managedObjectContext deleteObject:goal];
    [self save];
}

#pragma mark Write to file Helper

+ (NSString *)pathToFile : (NSString *)goalPath {
    //Creating a file path:
    //1) Search for the app's documents directory (copy+paste from Documentation)
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //2) Create the full file path by appending the desired file name
    NSString *pathToFile = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat: @"%@.plist", goalPath]];
    
    return pathToFile;
}

@end
