//
//  TodayController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TodayController : NSObject

+(void)fetchQuote;
+(NSString *)getToday;
+(NSArray *)getTasksForToday;

@end
