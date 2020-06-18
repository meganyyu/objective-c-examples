//
//  main.m
//  CollectionsExample
//
//  Created by Megan Yu on 6/18/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /* WORKING WITH C-STYLE ARRAYS */
        
        // carves out 5 sets of 4 bytes (ints), each w an index
        int multipleValues[] = {10, 100, 1000, 10000, 100000};
        
        NSLog(@"The value of the 3rd element is %i", multipleValues[2]);
        
        // Alternatively:
        int multipleValues2[5];
        multipleValues2[0] = 50;
        multipleValues2[1] = 20;
        multipleValues2[2] = 10;
        multipleValues2[3] = 100;
        multipleValues2[4] = 399;
        
        NSString *myStringArray[5] = {@"first", @"second", @"third", @"fourth", @"fifth"};
        NSLog(@"The third string element is %@", myStringArray[2]);
        
        /* Important! For C-style arrays:
         * 1. There is no bounds checking - you can access memory beyond the indices the array controls,  but you'll get some weird number.
         * 2. They have a fixed size.
         * 3. You can't mix types.
         */
        
        
        /* USING OBJ-C ARRAY CLASSES */
        
        NSArray *myArray = [[NSArray alloc]initWithObjects:@"one", @"two", @"three", nil]; // end of array is marked by nil, rather than specifying size
        NSLog(@"The third object is %@", [myArray objectAtIndex:2]); // one way to access particular index
        NSLog(@"The second object is %@", myArray[1]); // newer way that Obj-C added
        
        // Bonus: you can add any kind of object to an NSArray
        
        NSDate *myDate = [[NSDate alloc]init];
        NSArray *myArray2 = [[NSArray alloc]initWithObjects:@"one", [NSNumber numberWithInt:42], myDate, nil]; // can't contain primitive types, need to wrap into object
        NSLog(@"The objects are: %@, %@, %@", myArray2[0], myArray2[1], myArray2[2]);
        
        // Big problem: an NSArray object is immutable
        // Solution: use NSMutableArray!
        
        NSMutableArray *myArray3 = [[NSMutableArray alloc]initWithObjects:@"one", @"two", @"three", myDate, nil];
        
        NSString *anotherString = @"Some more content";
        [myArray3 addObject:anotherString];
        [myArray3 removeObjectAtIndex:0];
        NSLog(@"The third object is %@", myArray3[2]);
        
        // shorthand NSArray format - doesn't work for mutable arrays though
        NSArray *newArray = @[@"apple", @"orange", @"pear", myDate]; //no nil at the end
        
        /* DICTIONARIES */
        NSDictionary *states = [[NSDictionary alloc]
                                initWithObjectsAndKeys: @"Arizona", @"AZ",
                                @"California", @"CA",
                                @"Colorado", @"CO",
                                @"Hawaii", @"HI",
                                @"New Mexico", @"NM",
                                nil];
        NSString *someState = @"AZ";
        NSLog(@"%@ is for %@", someState, [states objectForKey:someState]);
        // shorthand - like for an array:
        NSLog(@"%@ is for %@", someState, states[someState]);
        
        // NSDictionaries are immutable, but there is a mutable version!
        NSMutableDictionary *mutableStates = [[NSMutableDictionary alloc]
                                              initWithObjectsAndKeys:
                                              @"Arizona", @"AZ",
                                              @"California", @"CA",
                                              @"Colorado", @"CO",
                                              @"Hawaii", @"HI",
                                              @"New Mexico", @"NM",
                                              nil];
        
        // only with mutable dictionary:
        [mutableStates setObject:@"Florida" forKey:@"FL"];
        
        // shorthand for NSDictionary
        NSDictionary *quicker = @{
            @"AZ" : @"Arizona",
            @"CA" : @"California",
            @"FL" : @"Florida" };
        
        // can use any kind of object as keys/values
        
        // Fast enumeration (for-in loop)
        NSString *soundPath = @"/System/Library/Sounds";
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        
        NSArray *soundFiles = [fileManager subpathsAtPath:soundPath];
        
        for (NSString *file in soundFiles) {
            NSLog(@"The file name is %@", file);
        }
        // can also do on dictionaries (in which case you'll get the keys)
    }
    return 0;
}
