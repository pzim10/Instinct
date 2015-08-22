//
//  ReminderController.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "ReminderController.h"
#import "Stack.h"

@implementation ReminderController

+(Reminder *)createReminderWithDay: (NSString *)theDay userInfo:(NSString *)userInfo fireTime:(NSDate *)fireTime andTask:(Task *)task{
    Reminder *reminder = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    reminder.theDay = theDay;
    reminder.userInfo = userInfo;
//    reminder.seconds = seconds;
    reminder.fireTime = fireTime;
    reminder.task = task;
    
    [self save];
    return reminder;
}

+ (NSArray *)reminders {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reminder"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

+(void)save {
    [self saveToPersistentStorage];
}

+ (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

+(void)removeReminderfromTask: (Reminder *)reminder task:(Task *)task{
    for (Reminder *reminder2 in task.reminders) {
        if (reminder == reminder2) {
            [self removeReminder:reminder];
            [self save];
            break;
        }
    }
}

+ (void)removeReminder:(Reminder *)reminder {
    [reminder.managedObjectContext deleteObject:reminder];
}

@end
