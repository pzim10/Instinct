//
//  Task.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/20/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Goal, Reminder;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * complete;
@property (nonatomic, retain) NSNumber * completedYesterday;
@property (nonatomic, retain) NSNumber * consecutiveDaysCompleted;
@property (nonatomic, retain) NSNumber * daysCompleted;
@property (nonatomic, retain) NSNumber * daysUntilComplete;
@property (nonatomic, retain) NSDate * deadline;
@property (nonatomic, retain) NSNumber * friday;
@property (nonatomic, retain) NSString * goalName;
@property (nonatomic, retain) NSNumber * monday;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * saturday;
@property (nonatomic, retain) NSNumber * sunday;
@property (nonatomic, retain) NSNumber * thursday;
@property (nonatomic, retain) NSNumber * tuesday;
@property (nonatomic, retain) NSNumber * wednesday;
@property (nonatomic, retain) Goal *goal;
@property (nonatomic, retain) NSSet *reminders;
@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addRemindersObject:(Reminder *)value;
- (void)removeRemindersObject:(Reminder *)value;
- (void)addReminders:(NSSet *)values;
- (void)removeReminders:(NSSet *)values;

@end
