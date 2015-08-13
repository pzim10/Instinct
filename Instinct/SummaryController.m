//
//  SummaryController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "SummaryController.h"
#import "TaskController.h"

@implementation SummaryController

+(int)getDaysCompleted {
    // Update daily
    return 0;
}

+(int)getDaysUntilCompleted {
    // Update daily
    return 0;
}

+(int)getCurrentConsecutiveDays{
    // Update daily
    return 0;
}

+(int)getMostConsecutiveDays{
    // Update when over written
    return 0;
}

+(int)getConsecutiveTasks{
    // Update continuosly
    return 0;
}

+(int)getMostConsecutiveTasks{
    // Update when over written
    return 0;
}

+(int)getTotalTasks{
    // update continuosly
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
