//
//  TaskController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskController : NSObject

@property (strong, nonatomic, readonly) NSArray *tasks;

+(void)createTaskWtihNameAndDays: (NSString *)name arrayOfDays:(NSArray *) days;

+(Task *)getTaskWithName: (NSString *)name;

+(void)save;
+(void)renameTask:(Task *)taskName newName: (NSString *)newName;
+(void)changeDaysToCompleteForTask:(Task *)taskName daysToComplete:(NSArray *)days;
+(void)updateCompletionFromTodayForTask:(Task *)taskName;
+(void)updateDaysCompleted: (BOOL) complete forTask:(Task *)taskName;
+(void)updateConsecutiveDaysCompletedForTask:(Task *)taskName;

+(void)removeTask:(Task *)task;

@end
