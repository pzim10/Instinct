//
//  Goals.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "Goals.h"

@implementation Goals

+ (Goals *)sharedGoal {
    static Goals *sharedGoal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGoal = [Goals new];
        sharedGoal.name = @"";
        sharedGoal.tasks = [NSArray new];
    });
    return sharedGoal;
}

@end
