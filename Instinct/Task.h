//
//  TaskList.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString *goalName;
@property (nonatomic, strong) NSString *name;
// Array of BOOLEANS for each day of the week
@property (nonatomic, strong) NSArray *daysToPerfomTask;

@property (nonatomic, assign) NSInteger daysUntilComplete;
@property (nonatomic, assign) NSInteger daysCompleted;
@property (nonatomic, assign) NSInteger consecutiveDaysCompleted;

@property (nonatomic, assign) BOOL complete;
@property (nonatomic, assign) BOOL completedYesterday;

@property (nonatomic, strong) NSTimer *timer;

@end
