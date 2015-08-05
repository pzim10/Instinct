//
//  SummaryController.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "SummaryController.h"

@implementation SummaryController

+(int)getDaysCounterforIndex :(NSInteger) dayIndex{
    return (int)[Summary sharedInstance].daysCounter[dayIndex];
}

+(NSArray *)getDaysArray{
    return [Summary sharedInstance].daysCounter;
}

+(NSString *)getSummaryTitleforIndex:(NSInteger)titleIndex{
    return [Summary sharedInstance].summaryTitle[titleIndex];
}

+(NSArray *)getSummaryTitlesArray{
    return [Summary sharedInstance].summaryTitle;
}



// create progress graph

// show last weeks results

@end
