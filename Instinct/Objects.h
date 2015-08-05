//
//  Objects.h
//  Instinct
//
//  Created by Peter Zimmerman on 8/2/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Objects : NSObject

+(Objects *)sharedObject;
@property (nonatomic, strong) NSMutableArray *goals;
@property (nonatomic, strong) NSMutableArray *tasks;

@end
