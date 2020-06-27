//
//  main.m
//  LanguageFeaturesExample
//
//  Created by Megan Yu on 6/21/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"
#import "NSString+FormattingOptions.h"
#import "Account.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Article *a = [[Article alloc] init];
        Article *b = [[Article alloc] init];
        Article *c = [[Article alloc] init];
        
        // call description method
        NSDate *myDate = [NSDate date];
        NSLog(@"myDate: %@", myDate);
        
        // not all classes have or need a custom description
        NSFileManager *myFM = [[NSFileManager alloc] init];
        NSLog(@"myFM: %@", myFM);
        
        // new custom objects with custom overridden descriptions
        NSLog(@"Articles:\n %@ \n %@ \n %@", a, b, c);
        
        
        
        /* CATEGORIES */
        
        // In Objective-C, inheritance is not as important as in other object-oriented languages
        
        // Inheritance situations in most object-oriented languages
        // 1. General use: defining a new class for application, so you inherit from standard base class (i.e. NSObject)
        // 2. Specialized use: it's common in other obj-oriented languages to almost always be inheriting from more specialized classes because built-in ones don't have exactly the functionality you want
        // We don't need to do #2 as much in Objective-C because we have categories
        // Categories allow us to add our own methods to an existing class without sub-classing it (can't add properties)
        
        /* Format for inheritance:
         * @interface MyNewClass : NSObject
         * // properties and methods
         * // ...
         * @end
         */
        
        /* Format for creating a category:
         * @interface ClassToExtend (MyCategoryName)
         * // just new methods
         * @end
         */
        
        // Categories example! See NSString+FormattingOptions category
        NSString *message = @"The quick brown fox jumped over the lazy dog.";
        NSLog(@"The result is %@", [message convertWhitespace]);
        
        
        /* EXTENSIONS */
        
        // Purpose: to add private properties to your own classes
        Account *acc1 = [[Account alloc] init];
        [acc1 setAccountName:@"Chihiro"];
        [acc1 setAccountNumber:12345];
        [acc1 deposit:[NSDecimalNumber decimalNumberWithString:@"200.00"]];
        [acc1 withdraw:[NSDecimalNumber decimalNumberWithString:@"75.22"]];
        
        // There's nothing to stop users from directly accessing the balance property and bypassing the code we've written
        // acc1.balance = [NSDecimalNumber decimalNumberWithString:@"59999999.00"];
        
        // To fix this, let's add a class extension
        // Extensions are really a way to split your header file into two parts - the public header file and the private header file. But only one implementation file still.
        // This makes line 71 invalid
        
        // We added a readonly version of balance to the public header file, so even though we can't modify it we can access the value:
        NSLog(@"The balance, checked from main, is now: %@", acc1.balance.stringValue);
    }
    return 0;
}
