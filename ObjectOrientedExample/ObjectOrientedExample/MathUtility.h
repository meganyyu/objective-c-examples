//
//  MathUtility.h
//  ObjectOrientedExample
//
//  Created by Megan Yu on 6/17/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MathUtility : NSObject

/* DEFINING METHODS IN .h FILE
* 1. is this a class (+) or instance (-) method?
* 2. return type?
* 3. method name?
* 4. takes parameters?
* EXAMPLE 1 - returning/accepting primitive types
* -(int) timesTen: (int) num;
* EXAMPLE 2 - returning/accepting object types (specify pointers)
* -(NSString *) createMessage: (NSString *) input;
* EXAMPLE 3 - multiple parameters
* -(int) addNumber: (int) a   toNumber: (int) b;
*/

-(int) timesTen: (int) number;

-(int) addNumber: (int) a
        toNumber: (int) b;

@end

NS_ASSUME_NONNULL_END
