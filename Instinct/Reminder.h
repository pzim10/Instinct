//
//  Reminder.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/20/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSNumber * dayIndex;
@property (nonatomic, retain) NSNumber * seconds;
@property (nonatomic, retain) NSString * theDay;
@property (nonatomic, retain) NSDate * fireTime;
@property (nonatomic, retain) NSString * userInfo;
@property (nonatomic, retain) Task *task;

@end
