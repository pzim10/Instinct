//
//  Task.h
//  
//
//  Created by Peter Zimmerman on 8/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Goal;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * complete;
@property (nonatomic, retain) NSNumber * completedYesterday;
@property (nonatomic, retain) NSNumber * consecutiveDaysCompleted;
@property (nonatomic, retain) NSNumber * daysCompleted;
@property (nonatomic, retain) NSNumber * daysUntilComplete;
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

@end
