//
//  GoalController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalController.h"
#import "TaskController.h"

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

+(void)createGoal:(NSString *)name{
    Goal *newGoal = [NSEntityDescription insertNewObjectForEntityForName:@"Goal" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    newGoal.name = name;
    
    [self save];
}

+ (NSArray *)goals {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Goal"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

+(void)createGoalWithTitleAndImage:(NSString *)name imageNamed:(NSString *)imageName{
    Goal *newGoal = [Goal new];
    newGoal.name = name;

//    newGoal.visualGoal = [UIImage imageNamed:imageName];
}

// Load the goals
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

@end
