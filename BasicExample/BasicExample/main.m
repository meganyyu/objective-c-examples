//
//  main.m
//  FirstApp
//
//  Created by Megan Yu on 6/12/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

// scope: global
int someScore = 0;

// ENUMERATION - good for writing out choices!
// enums are stored internally as integers
// ex: defining the idea of enumerated seat preferences
enum seatPreference {
    window, // 0
    aisle = 99, // 99
    middle // 100
};

// functions
void myFunction(int x, int y) {
    NSLog(@"We're in the function");
    return;
}

// main
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* 3. BASIC SYNTAX */
        
        int minutes = 60;
        int hours = 24;
        int days = 365;
        
        int minutesInAYear =  minutes * hours * days;
        
        // logging messages
        NSLog(@"There are %i minutes in a year", minutesInAYear);
        
        
        int stormCategory = 4;
        
        // if statements
        if (stormCategory == 1) {
            NSLog(@"Storm's a-coming!");
        } else if (stormCategory == 4 || stormCategory == 5) {
            NSLog(@"Catastrophe!");
        }
        
        // switch statements
        switch (stormCategory) {
            case 1:
                NSLog(@"Time to get indoors.");
                break;
            case 2:
                NSLog(@"Extensive damage - run and hide!");
                break;
            case 3:
                NSLog(@"Devastating damage! Oh no!");
                break;
            case 4:
            case 5:
                NSLog(@"Catastrophic damage! Game over, man!");
                break;
                
            default:
                NSLog(@"Readings are off the scale. We haven't encountered this phenomenon before!");
                break;
        }
        
        // ternary operator - might not be as readable, avoid
        int p1Score = 2;
        int p2Score = 1;
        
        // condition ? true : false
        int highScore = (p1Score > p2Score) ? p1Score : p2Score ;
        
        // while loop
        int a = 1;
        while (a < 10) {
            NSLog(@"The value of a is %i", a);
            a++;
        }
        
        // do-while loop
        int i = 1;
        do {
            NSLog(@"The value of a is %i", a);
            i++;
        } while (a < 10);
        
        // for loop
        for (int i = 1; i < 10; i ++) {
            NSLog(@"The value of the index is %i", i);
        }
    
        // call a function
        myFunction(1, 2);
        
        
        /* 4. VARIABLES AND DATA TYPES */
        
        // primitive: int, float, double, char, BOOL
        // e.g. range for signed int: -2,147,483,648 to 2,147,483,647
        int someNumber = 100;
        // can also have unsigned types
        // range: 0 to 4,2904,967,295
        unsigned int unsignedInteger = 2;
        
        // or use other modifiers to get bigger/smaller values
        // e.g. long
        // generally not useful, because it only stores larger values on 64 bit systems, not 32 bit
        long int someLong = 100;
        // e.g. long long
        // use this instead bc it compiles the same way on both 32 and 64 bit systems
        long long int someLongLong = 145;
        // e.g. short
        short int someShort = 5;
        
        // alternatively only specify modifier, not int
        long long someLongLong2 = 231;
        unsigned unsignedInteger2 = 44;
        
        // floating-point numbers
        float myFloat = 5.4f; // 4 byte
        double myDouble = 11.2; // 8 byte, double precision
        
        // print values in NSLog
        NSLog(@"My long long integers are %lli and %lli", someLongLong, someLongLong2);
        NSLog(@"My unsigned integers are %u and %u", unsignedInteger, unsignedInteger2);
        
        NSLog(@"myFloat is: %f", myFloat); // may show inaccuracies
        NSLog(@"myFloat is: %e", myFloat); // shows in scientific notation, more accurate
        NSLog(@"myFloat is: %g", myFloat); // makes best guess
        
        NSLog(@"myDouble is: %f", myDouble); // may show inaccuracies
        NSLog(@"myDouble is: %e", myDouble); // shows in scientific notation, more accurate
        NSLog(@"myDouble is: %g", myDouble); // makes best guess
        
        // char type
        char firstLetter = 'h'; // use single quotes for chars
        char anotherLetter = '!';
        char someDigit = '6';
        NSLog(@"My chars are %c, %c and %c", firstLetter, anotherLetter, someDigit);
        
        // boolean type
        BOOL hasCompleted = YES;
        BOOL hasNotCompleted = NO;
        NSLog(@"My boolean value is %i", hasCompleted);
        
        // using enums
        enum seatPreference bobSeatPreference = window;
        if (bobSeatPreference == window) {
            NSLog(@"Bob prefers the %i seat.", bobSeatPreference);
        }
        
        // MORE COMPLEX DATA TYPES: NSStrings
        NSString *message = @"Hello"; // note: *, which can be placed anywhere between type and name, means pointer - doesn't hold value of string directly; holds a memory address
        // This is an object. In Obj-C all objects are pointer types.
    }
    return 0;
}
