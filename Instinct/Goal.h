//
//  Goal.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/20/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface Goal : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * visualGoalPath;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)addTasksObject:(Task *)value;
- (void)removeTasksObject:(Task *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
