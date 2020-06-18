//
//  main.m
//  ObjectOrientedExample
//
//  Each class defines 2 things:
//  1. Attributes - name, height, weight, age
//  2. Behavior - walk, run, jump, speak, sleep
//  Objects are then created from classes. One class, multiple objects.
//
//  A method is a function that belongs to a class.
//
//  Created by Megan Yu on 6/16/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "MathUtility.h"
#import "Player.h"
// use <> for external frameworks like on line 16
// use "" for internal header files

void myFunction (NSString *x) {
    NSLog(@"The string you passed in was %@", x);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /* USING POINTERS */
        int highScore = 100; // For primitive values, a small, specific area of memory is carved out to hold this value directly
        NSString *message = @"Hello"; // But variables just hold a pointer to the area of memory where the object is actually stored
        // WHY? The space primitive types require is exact, but the space objects require will change throughout our program. More flexible.
        // Simply storing a 4 byte address of the object also makes it easier to pass object around without copying it.
        
        // Doesn't matter where the * goes, only need it for declaration, not for using or initializing it
        NSString *firstWord = @"one";
        NSString * secondWord = @"large";
        NSString* thirdWord = @"pomegranate";
        
        // passing pointers into functions
        myFunction(firstWord);
        myFunction(secondWord);
        myFunction(thirdWord);
        
        /* CALLING METHODS */
        // Syntax for calling methods in Obj-C is very different from syntax for calling functions.
        
        // To call someMethod of myObject and store return value (aka, "send the message" someMethod to myObject):
        // result = [myObject someMethod];
        
        // To pass one argument into method (in other langs --> myObject.someMethod(arg);):
        // [myObject someMethod:arg];
        
        // To pass multiple arguments into method (in other langs --> myObject.insert("Hello", 11);):
        // [myObject insertString: @"Hello" atIndex: 11];
        
        // Above, we have object name, 1st part of method name, :, space, 1st arg, 2nd part of method name, etc.
        // Officially, full method name has two pieces to it. Method name would be insertSTring: atIndex:
        // Means some methods have very long names, but it makes it clear what each parameter is expected to represent
        
        // To make nested method calls (in other langs --> myObject.someMethod(getValue());):
        // [myObject someMethod:[anotherObject anotherMethod]];
        // the inner method call is evaluated first
        
        
        /* USING CLASSES IN FOUNDATION FRAMEWORK */
        NSString *shoutyMessage = [message uppercaseString]; // instance method - notice we call it on an actual NSString
        NSLog(@"The NSString objects are %@ and %@", message, shoutyMessage);
        
        NSDate *today = [NSDate date]; // class method - notice we call it on the NSDate class
        NSLog(@"The new NSDate object is: %@", today);
        
        
        /* MEMORY MANAGEMENT IN OBJ-C */
        // Reference counting: when an object is created in an area of memory, it's given a retain count/reference count - what variables are actually pointing to me right now?
        // Thinking about scope - when we reach the end of a function and local objects are no longer reachable by any part of the program, the pointer is removed, the retain count goes down
        // When the retain count goes to 0, the Obj-C runtime engine releases that area of memory and make it available for another object to use
        
        // Automatic Reference Counting (ARC)
        // pre-ARC, manual reference counting code:
        /* MyClass *foo = [[MyClass alloc]init];
         * [foo someMethod]; // call methods of object
         * // at some point...
         * [foo release]; // no longer needed (or allowed)
         */
        
        // Problems with manual ref counting:
        // 1. Dangling pointer: you might release memory too soon
        // 2. Memory leak: claiming more & more memory bc never release objects even as pointers drop out of scope
        
        // ARC is now done by compiler
        // Very different from garbage collection! Languages that use garbage collection are non-deterministic - you can't tell exactly when objects are being reclaimed bc it's managed by the runtime by an external process. ARC allows Obj-C to be completely deterministic - compiler code controls when objects are released
        // ARC disallows memory management code
        
        /* OBJECT CREATION */
        // method 1: use new keyword
        // 3 stages: allocation, initialization, return address in memory of object
        NSDate *myDate;
        myDate = [NSDate new];
        
        // but not that common to use new keyword - usually you'll see the stages written out explicitly. This is because there may be multiple init methods for a class.
        NSDate *myDate2;
        myDate2 = [NSDate alloc]; // alloc carves out memory and returns address of that memory
        myDate2 = [myDate2 init]; // call initialization on the instance
        // combined: Class *myObj = [[Class alloc] init];
        
        /* AUTORELEASED OBJECTS */
        // NSDate using "regular" alloc/init
        NSDate *todayDate = [[NSDate alloc] init];
        
        // NSDate using alloc with specialized init
        NSDate *nextDate = [[NSDate alloc] initWithTimeIntervalSince1970:23234544];
        
        //NSDate using convenience class method
        NSDate *anotherDate = [NSDate date];
        
        // using specialized convenience method
        NSDate *yetAnotherDate = [NSDate dateWithTimeIntervalSince1970:23234544];
        
        // write them out:
        NSLog(@"The dates are: \n %@ \n %@ \n %@ \n %@ \n", todayDate, nextDate, anotherDate, yetAnotherDate);
        
        // NSString using shorthand literal syntax
        NSString *aMessage = @"Hello";
        
        // using alloc/init
        NSString *nextMesage = [[NSString alloc] initWithFormat:@"The word is: %@", message];
        
        // using convenience class method
        NSString *anotherMessage = [NSString stringWithFormat:@"The word is: %@", message];
        // By creating an object with a convenience method and not using alloc in it, you're actually creating an auto-released object (this is a more important distinction pre-ARC)
            // These objects are allocated and initialized inside the helper methods, and before they were returned to us, they were added to an autorelease pool
        // Autorelease pools keep track of objects we can't release immediately but want to make sure are released at some point in future
        
        
        /* CREATING CUSTOM CLASSES */
        // Classes are written in 2 distinct sections: the interface & implementation
        // @interface (.h file): external face of class - presents what class does; its methods, properties
        // @implementation (.m file): main implementation
        
        Employee *fred = [[Employee alloc] init];
        [fred someMethod]; // call a method
        [fred setName:@"Fred Smith"]; // change a property
        // methods for setting properties are automatically generated
        
        MathUtility *util = [[MathUtility alloc] init];
        
        int result = [util timesTen:55];
        NSLog(@"The result of timesTen: - %i", result);
        
        result = [util addNumber:99 toNumber:42];
        NSLog(@"The result of addNumber:toNumber: - %i", result);
        
        Player *playerObject = [[Player alloc] init];
        NSLog(@"The score is %i", [playerObject score]);
        
        Player *secondPlayer = [[Player alloc] initWithInteger:9999];
        NSLog(@"The score is %i", [secondPlayer score]);
        
        
        /* USING DEALLOC METHODS */
        // All our classes so far inherit from NSObject, and thus have an init, alloc method
        // But NSObjects also have a dealloc method - automatically called at the end of an object's lifetime
    }
    return 0;
}
