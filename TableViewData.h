//
//  TableViewData.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/10/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewData : NSObject

+(NSArray *)topicsTable;
+(NSArray *)specifics;

+(NSArray *)myKeys: (NSInteger)index;

@end
