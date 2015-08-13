//
//  SummaryController.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Summary.h"

@interface SummaryController : NSObject

+(int)getDaysCompleted;
+(int)getDaysUntilCompleted;
+(int)getCurrentConsecutiveDays;
+(int)getMostConsecutiveDays;
+(int)getConsecutiveTasks;
+(int)getMostConsecutiveTasks;
+(int)getTotalTasks;

+(NSString *)getSummaryTitleforIndex :(NSInteger) titleIndex;
+(NSArray *)getSummaryTitlesArray;



@end
