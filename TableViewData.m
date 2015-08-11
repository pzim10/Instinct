//
//  TableViewData.m
//  Instinct
//
//  Created by Peter Zimmerman on 8/10/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "TableViewData.h"

static NSString const *KeyAll = @"Key All";
static NSString const *KeyInstruments = @"Play an Instrument";
static NSString const *KeyDance = @"Dance";
static NSString const *KeySing = @"Sing";
static NSString const *KeyArt = @"Art";
static NSString const *KeyWriting = @"Writing";
static NSString const *KeyReading = @"Reading";
static NSString const *KeyExercise = @"Exercise";
static NSString const *KeySports = @"Sports";
static NSString const *KeyProgramming = @"Learning to Program";

@implementation TableViewData : NSObject

+(NSArray *)topicsTable{
    NSArray *topics = @[
                        @"Play an Instrument",
                        @"Dance",
                        @"Sing",
                        @"Art",
                        @"Writing",
                        @"Reading",
                        @"Excercise",
                        @"Sports",
                        @"Learning to Program"
                        ];
    return topics;
}

+(NSArray *)myKeys: (NSInteger)index {
    NSArray *keys = [self specifics][index][KeyAll];
    return keys;
}

+(NSArray *)specifics {
    NSArray *specifics = @[
                           @{
                               KeyAll: @[
                                       @"Guitar",
                                       @"Drums",
                                       @"Percussion",
                                       @"Piano",
                                       @"Saxaphone",
                                       @"Clarinet",
                                       @"Flute",
                                       @"Trumpet",
                                       @"Trumbone",
                                       @"Violin"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Ballroom",
                                       @"Tango",
                                       @"Salsa",
                                       @"Tap",
                                       @"Jazz",
                                       @"Swing",
                                       @"Country Swing",
                                       @"Breakdancing",
                                       @"Hip-hop",
                                       @"Waving"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Classic",
                                       @"Rock",
                                       @"Pop",
                                       @"Country",
                                       @"Opera",
                                       @"Disney",
                                       @"Rap"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Drawing",
                                       @"Painting",
                                       @"Pottery",
                                       @"Sculpting",
                                       @"Photography",
                                       @"Modern",
                                       @"Cubism",
                                       @"Realism",
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Novel",
                                       @"Short Story",
                                       @"Poem",
                                       @"Journal",
                                       @"Blog",
                                       @"Storyboard",
                                       @"Children's book",
                                       @"Speeches"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"History",
                                       @"Politics",
                                       @"Self improvement"
                                       @"Non Fiction",
                                       @"Fiction",
                                       @"Epic Fantasy",
                                       @"Science Fiction",
                                       @"Religious"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Cardio",
                                       @"Lose Weight",
                                       @"Build Muscle",
                                       @"Biking",
                                       @"Push ups",
                                       @"Pull ups",
                                       @"Sit ups",
                                       @"Distance Running"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"Soccer",
                                       @"Football",
                                       @"Basketball",
                                       @"Baseball",
                                       @"Track and Field",
                                       @"Swimming",
                                       @"Lacrosse",
                                       @"Rugby",
                                       @"Hockey",
                                       @"Ultimate Frisbee"
                                       ]
                               },
                           @{
                               KeyAll: @[
                                       @"C++",
                                       @"C#",
                                       @"Objective-C",
                                       @"Java",
                                       @"JavaScript",
                                       @"Ruby",
                                       @"Python",
                                       @"PHP",
                                       @"CSS",
                                       @"HTML"
                                       ]
                               }
                           ];
    return specifics;
}

@end

//                           @{
//                               KeyInstruments: @[
//                                       @"Guitar",
//                                       @"Drums",
//                                       @"Percussion",
//                                       @"Piano",
//                                       @"Saxaphone",
//                                       @"Clarinet",
//                                       @"Flute",
//                                       @"Trumpet",
//                                       @"Trumbone",
//                                       @"Violin"
//                                       ],
//                               KeyDance: @[
//                                       @"Ballroom",
//                                       @"Tango",
//                                       @"Salsa",
//                                       @"Tap",
//                                       @"Jazz",
//                                       @"Swing",
//                                       @"Country Swing",
//                                       @"Breakdancing",
//                                       @"Hip-hop",
//                                       @"Waving"
//                                       ],
//                               KeySing: @[
//                                       @"Classic",
//                                       @"Rock",
//                                       @"Pop",
//                                       @"Country",
//                                       @"Opera",
//                                       @"Disney",
//                                       @"Rap"
//                                       ],
//                               KeyArt: @[
//                                       @"Drawing",
//                                       @"Painting",
//                                       @"Pottery",
//                                       @"Sculpting",
//                                       @"Photography",
//                                       @"Modern",
//                                       @"Cubism",
//                                       @"Realism",
//                                       ],
//                               KeyWriting: @[
//                                       @"Novel",
//                                       @"Short Story",
//                                       @"Poem",
//                                       @"Journal",
//                                       @"Blog",
//                                       @"Storyboard",
//                                       @"Children's book",
//                                       @"Speeches"
//                                       ],
//                               KeyReading: @[
//                                       @"History",
//                                       @"Politics",
//                                       @"Self improvement"
//                                       @"Non Fiction",
//                                       @"Fiction",
//                                       @"Epic Fantasy",
//                                       @"Science Fiction",
//                                       @"Religious"
//                                       ],
//                               KeyExercise: @[
//                                       @"Cardio",
//                                       @"Lose Weight",
//                                       @"Build Muscle",
//                                       @"Biking",
//                                       @"Push ups",
//                                       @"Pull ups",
//                                       @"Sit ups",
//                                       @"Distance Running"
//                                       ],
//                               KeySports: @[
//                                       @"Soccer",
//                                       @"Football",
//                                       @"Basketball",
//                                       @"Baseball",
//                                       @"Track and Field",
//                                       @"Swimming",
//                                       @"Lacrosse",
//                                       @"Rugby",
//                                       @"Hockey",
//                                       @"Ultimate Frisbee"
//                                       ],
//                               KeyProgramming: @[
//                                       @"C++",
//                                       @"C#",
//                                       @"Objective-C",
//                                       @"Java",
//                                       @"JavaScript",
//                                       @"Ruby",
//                                       @"Python",
//                                       @"PHP",
//                                       @"CSS",
//                                       @"HTML"
//                                       ]
//                               }
