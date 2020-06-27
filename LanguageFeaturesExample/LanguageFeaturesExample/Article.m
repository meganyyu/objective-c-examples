//
//  Article.m
//  LanguageFeaturesExample
//
//  Created by Megan Yu on 6/21/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "Article.h"

@implementation Article

/* INHERITANCE */

// Almost every class (subclass) inherits from NSObject (superclass)
// You can override methods in the superclass and provide your own implementation - all you have to do is write a method in the subclass with the same signature as the superclass (don't need to include in the interface, only implementation)
// Often you want to call the superclass version of the method before running your own implementation. But not always.

-(NSString *)description {
    // return some meaningful description of the inner state of the object
    return @"Uh... Hello, I'm an Article object. That's all I know.";
}



@end
