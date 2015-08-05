//
//  GoalController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "GoalController.h"

@implementation GoalController

// Create a new goal

+(void)createGoal:(NSString *)name{
    Goals *newGoal = [Goals new];
    newGoal.name = name;
    newGoal.tasks = [NSArray new];
    
    [[Objects sharedObject].goals addObject:newGoal];
}
+(void)createGoalWithTitleAndImage:(NSString *)name imageNamed:(NSString *)imageName{
    Goals *newGoal = [Goals new];
    newGoal.name = name;
    newGoal.tasks = [NSArray new];
    newGoal.visualGoal = [UIImage imageNamed:imageName];
    
    [[Objects sharedObject].goals addObject:newGoal];
}

// Display the goal

+(Goals *)goalWithName:(NSString *)goalName{
    for (Goals *goal in [Objects sharedObject].goals) {
        if ([goal.name isEqualToString:goalName]) {
            return goal;
        }
    }
    
    NSLog(@"goal did not return");
    return nil;
}

+(NSString *)goalTitle: (Goals*) goal{
    return goal.name;
}
+(NSArray *)goalTasks: (Goals*) goal{
    return goal.tasks;
}

// Edit the goal

+(void)addTasktoGoal:(Task *)task forGoal: (Goals *)goal{
    NSMutableArray *newArray = [goal.tasks mutableCopy];
    task.goalName = goal.name;
    [newArray addObject:task];
    goal.tasks = newArray;
}
+(void)removeTaskFromGoal:(Task *)task fromGoal: (Goals *)goal{
    NSMutableArray *newArray = [goal.tasks mutableCopy];
    [newArray removeObject:task];
    goal.tasks = newArray;
}

// Delete the goal

+(void)removeGoal: (Goals *)goal{
    goal.name = nil;
    goal.tasks = nil;
    goal.visualGoal = nil;
    
    [[Objects sharedObject].goals removeObject:goal];
    
    [goal delete:goal];
}

@end
