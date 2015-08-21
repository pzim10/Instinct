//
//  ReminderController.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reminder.h"
#import "TaskController.h"

@interface ReminderController : NSObject

@property (nonatomic, strong, readonly) NSArray *reminders;

+(Reminder *)createReminderWithDay: (NSString *)theDay userInfo:(NSString *)userInfo fireTime:(NSDate *)fireTime andTask:(Task *)task;

+(NSArray *)reminders;

+(void)save;

+(void)removeReminderfromTask: (Reminder *)reminder task:(Task *)task;
+(void)removeReminder:(Reminder *)reminder;

@end
