//
//  Goals.h
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Goals : NSObject

+(Goals *)sharedGoal;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray *tasks;
@property (nonatomic,strong) UIImage *visualGoal;

@end
