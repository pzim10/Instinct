//
//  SummaryController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "SummaryController.h"

@implementation SummaryController

+(int)getDaysCompleted {
    // Update daily
/*
    I want this method to know on how many different days were at least one task for that day completed and return that number
 */
    int total = 0;
    for (Goal *goal in [GoalController goals]) {
        for (Task *task in goal.tasks) {
            if ([task.complete isEqual:@0]) {
                total += [task.daysCompleted intValue];
            }
        }
    }
    return total;
}

+(int)getDaysUntilCompleted {
    // Update daily
/*
    Should return the number of days till a goal has a rank advancement
*/
    int total = 0;
    for (Goal *goal in [GoalController goals]) {
        for (Task *task in goal.tasks) {
            if ([task.complete isEqual:@0]) {
                total += [task.daysUntilComplete intValue];
            }
        }
    }
    return total;
}

+(int)getCurrentConsecutiveDays{
    // Update daily
/*
    Should return the number of current consecutive days completed
*/
    int total = 0;
    for (Goal *goal in [GoalController goals]) {
        for (Task *task in goal.tasks) {
            if ([task.complete isEqual:@0]) {
                total += [task.consecutiveDaysCompleted intValue];
            }
        }
    }
    return total;
}

+(int)getMostConsecutiveDays{
    // Update when over written
/*
    Should return the number of most consecutive days completed
*/
    int total = 0;
    for (Goal *goal in [GoalController goals]) {
        for (Task *task in goal.tasks) {
            if ([task.complete isEqual:@0]) {
                total += [task.consecutiveDaysCompleted intValue];
            }
        }
    }
    if (total > 100) { // 100 should be the longest chain of consecutive days completed
//        100 = total;
        return 100;
    }
    return total;
}

+(int)getConsecutiveTasks{
    // Update continuosly
/*
     Should return the number of current consecutive tasks completed, a task is only incomplete at midnight if it hasn't been check off on the today view
*/
    int total = 0;
    for (Goal *goal in [GoalController goals]) {
        for (Task *task in goal.tasks) {
            if ([task.complete isEqual:@0]) {
                total += [task.daysCompleted intValue];
            }
        }
    }
    return 0;
}

+(int)getMostConsecutiveTasks{
    // Update when over written
/*
     Should return the number of most consecutive tasks completed, a task is only incomplete at midnight if it hasn't been check off on the today view
*/
    return 0;
}

+(int)getTotalTasks{
    // update continuosly
/*
     Should return the number of tasks completed, a task is only incomplete at midnight if it hasn't been check off on the today view
*/
    int total =0;
    for (Task *task in [TaskController tasks]) {
        total += [task.daysCompleted intValue];
    }
    return total;
}

+(NSString *)getSummaryTitleforIndex:(NSInteger)titleIndex{
    return [Summary sharedInstance].summaryTitle[titleIndex];
}

+(NSArray *)getSummaryTitlesArray{
    return [Summary sharedInstance].summaryTitle;
}



// create progress graph

// show last weeks results

@end
