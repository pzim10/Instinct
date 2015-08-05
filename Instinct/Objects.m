//
//  Objects.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/2/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "Objects.h"
#import "Goals.h"
#import "Task.h"

@implementation Objects

+ (Objects *)sharedObject {
    static Objects *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [Objects new];
        sharedObject.goals = [NSMutableArray new];
        sharedObject.tasks = [NSMutableArray new];
        [sharedObject.goals addObject:[Goals sharedGoal]];
    });
    return sharedObject;
}

@end
