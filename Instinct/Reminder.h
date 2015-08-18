//
//  Reminders.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reminder : NSObject

@property (nonatomic, assign) BOOL dayOnly;
// if false then it is task days, else it is weekly for the specific day
@property (nonatomic, strong) NSString *theDay;
// Either Monday, Tue, etc iff dayOnly == TRUE; else nil;
@property (nonatomic, assign) int seconds;
// Time in seconds the alarm is set at

@end
