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

+(void)createTaskWtihNameAndDays: (NSString *)name arrayOfDays:(NSArray *) days;

+(Task *)getTaskWithName: (NSString *)name;

+(void)renameTask:(Task *)taskName newName: (NSString *)newName;
+(void)changeDaysToCompleteForTask:(Task *)taskName daysToComplete:(NSArray *)days;
+(void)updateCompletionFromTodayForTask:(Task *)taskName;
+(void)updateDaysCompleted: (BOOL) complete forTask:(Task *)taskName;
+(void)updateConsecutiveDaysCompletedForTask:(Task *)taskName;

+(void)deleteTask:(Task *)task;

@end
