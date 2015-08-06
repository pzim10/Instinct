//
//  GoalController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Objects.h"
#import "Goals.h"
#import "Task.h"

@interface GoalController : NSObject

@property (strong, nonatomic, readonly) NSArray *goals;

+(void)createGoal:(NSString *)name;
+(void)createGoalWithTitleAndImage:(NSString *)name imageNamed:(NSString *)imageName;

+(Goals *)goalWithName: (NSString *)goalName;
+(NSString *)goalTitle: (Goals*) goal;
+(NSArray *)goalTasks: (Goals*) goal;

+(void)save;
+(void)addTasktoGoal:(Task *)task forGoal: (Goals *)goal;
+(void)removeTaskFromGoal:(Task *)task fromGoal: (Goals *)goal;

+(void)removeGoal:(Goals *)goal;
//+(void)removeGoal: (Goals *)goal;

@end
