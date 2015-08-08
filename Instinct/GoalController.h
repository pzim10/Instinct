//
//  GoalController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Objects.h"
#import "Stack.h"
#import "Goal.h"
#import "Task.h"

@interface GoalController : NSObject

@property (strong, nonatomic, readonly) NSArray *goals;

+(GoalController *)sharedGoal;

+(void)createGoal:(NSString *)name;
//+(void)createGoalWithTitleAndImage:(NSString *)name imageNamed:(NSString *)imageName;
+(void)defaultGoal;
+ (NSArray *)goals;

+(Goal *)goalWithName: (NSString *)goalName;
+(NSString *)goalTitle: (Goal*) goal;
+(NSArray *)goalTasks: (Goal*) goal;

+(void)save;
+(void)addTasktoGoal:(Task *)task forGoal: (Goal *)goal;
+(void)removeTaskFromGoal:(Task *)task fromGoal: (Goal *)goal;

+(void)removeGoal:(Goal *)goal;
//+(void)removeGoal: (Goals *)goal;

@end
