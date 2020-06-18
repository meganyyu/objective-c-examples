//
//  Employee.h
//  ObjectOrientedExample
//
//  Created by Megan Yu on 6/17/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

// properties that each Employee instance has
@property NSString *name;
@property NSDate *hireDate;
@property int employeeNumber;

/* PROPERTIES
 * Historically, didn't always have properties in Obj-C.
 * To define class data you defined instance variables (ivars) in a group at the top inside {}. These can't be accessed directly from outside the class, have to create accessor methods (getter/setter)
 * Instead, properties allow us to automatically generate accessor methods. (@property)
 * Previously, you had to match .h @property statements with corresponding @synthesize statements in .m file. No longer needed, compiler handles.
 * Properties also have optional attributes written in ().
 * (FORMAT: @property (attributes) type name;)
 * EXAMPLE: @property (strong) NSString *firstName;
 * --> says this property should be considered a strong reference to this NSString object (meaning, this class owns this object, so as long as we keep a pointer to it, ARC will keep the object alive).
 * --> versus weak reference? Means the object will live as long as some other object holds a strong reference to it.
 * --> we don't actually have to write (strong) anymore, that's default.
 * Other possible attributes?:
 * --> (readonly) - will only synthesize getter method, not setter
 * --> (nonatomic) - deals with thread safety
 * What if we want an instance variable that's not a property? You can still use instance variables, but they shouldn't be defined in the interface, only in .m file (inside {} at the very top, right after @implementation statement)
 */

// - specifies this is an instance method
-(void) someMethod;

@end

NS_ASSUME_NONNULL_END
