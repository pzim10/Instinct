//
//  Summary.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Summary : NSObject

// graph for progress
+(Summary *)sharedInstance;
// [0] Days toward goal, [1] till next rank, [2] current consecutive days, [3] most consecutive days, [4] consecutive tasks, [5] most consecutive tasks, [6]total tasks
@property (nonatomic, strong) NSArray *summaryTitle;

@property (nonatomic, strong) NSArray *rank;
// [0] Day 1, [1] beginner, [2] average, [3] good, [4] gifted, [5] instinct
@end
