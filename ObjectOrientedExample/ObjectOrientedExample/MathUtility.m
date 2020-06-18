//
//  MathUtility.m
//  ObjectOrientedExample
//
//  Created by Megan Yu on 6/17/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "MathUtility.h"

@implementation MathUtility

-(int)timesTen:(int)number {
    NSLog(@"You passed in the value: %i", number);
    return number * 10;
}

-(int)addNumber:(int)a toNumber:(int)b {
    return a + b;
}

@end
