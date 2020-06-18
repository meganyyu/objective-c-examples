//
//  Player.m
//  ObjectOrientedExample
//
//  Created by Megan Yu on 6/17/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "Player.h"

@implementation Player

// don't need to include init in the .h file because it's already defined in NSObject!
- (instancetype)init
{
    self = [self initWithInteger:5000];
    return self;
}

// you DO need to declare custom initializers in .h file
// the initializer that does all the work is referred to as the designated initializer
- (instancetype)initWithInteger:(int) initialScore
{
    // this might be where you OPEN a connection to a database
    
    self = [super init];
    if (self) {
        _score = initialScore; // score is synthesized with underscore
    }
    return self;
}

/* Most of the time, you won't need custom dealloc. Dealloc exists purely for cleanup of internal objects - not as needed now that we have ARC to help clean up. You are also no longer allowed to call it yourself - Obj-C runtime takes care of it for you. Only useful if your object is holding onto some kind of resource, i.e. file/database resource, and you need to close the connection in dealloc. */
- (void)dealloc
{
    // this might be where you CLOSE the connection to a database
    NSLog(@"The dealloc method is called automatically.");
    
    // prior to ARC, you would follow this with a call to [super dealloc];
    // not allowed anymore.
}

@end
