//
//  GoalController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stack.h"
#import "Goal.h"
#import "Task.h"

@interface GoalController : NSObject

@property (strong, nonatomic, readonly) NSArray *goals;

+(GoalController *)sharedGoal;

+(void)createGoalWithTitleNotesAndImage:(NSString *)name notes:(NSString *)notes imageNamed:(NSString *)imageName;
+ (NSArray *)goals;

+(Goal *)goalWithName: (NSString *)goalName;
+(NSString *)goalTitle: (Goal*) goal;

+(void)save;
+(void)addTasktoGoal:(Task *)task forGoal: (Goal *)goal;
+(void)removeTaskFromGoal:(Task *)task fromGoal: (Goal *)goal;

+(void)removeGoal:(Goal *)goal;

// Aux

+ (NSString *)pathToFile: (NSString *) goalPath;

@end
