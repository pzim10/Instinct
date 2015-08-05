//
//  Summary.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "Summary.h"

@implementation Summary

+ (Summary *)sharedInstance {
    static Summary *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Summary new];
        sharedInstance.daysCounter = @[@30, @6, @8, @22, @74, @127];
        
        sharedInstance.summaryTitle = @[@"Days working toward your goal:", @"Days to rank advancement:", @"Consecutive 100\% days:", @"Most consecutive 100\% days:", @"Most consecutive tasks:", @"Total tasks completed:", @"Current Rank:"];
        sharedInstance.rank = @[@"You Can Do This!", @"First Steps", @"Hang Tough", @"Habit", @"Gifted", @"Instinct"];
    });
    return sharedInstance;
}


@end
