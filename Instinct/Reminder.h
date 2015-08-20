//
//  Reminders.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/18/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reminder : NSObject

@property (nonatomic, assign) NSNumber *dayIndex;
// 0 == task days, 1-7 == Su,M,Tu,W,Th,F,Sa
@property (nonatomic, strong) NSString *theDay;
// Either Monday, Tue, etc.
@property (nonatomic, assign) int seconds;
// Time in seconds the alarm is set at

@end
