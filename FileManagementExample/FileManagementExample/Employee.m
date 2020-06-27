//
//  Employee.m
//  FileManagementExample
//
//  Created by Megan Yu on 6/18/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "Employee.h"

@implementation Employee

// this method is automatically called when we save our object, <NSCoding> requires it to be implemented
-(void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.firstName forKey:@"fname"];
    [coder encodeObject:self.lastName forKey:@"lname"];
    [coder encodeObject:self.hireDate forKey:@"hdate"];
    [coder encodeInt:self.employeeNumber forKey:@"empnum"];
}

// this method is also required to be implemented by <NSCoding>
-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _firstName = [coder decodeObjectForKey:@"fname"];
        _lastName = [coder decodeObjectForKey:@"lname"];
        _hireDate = [coder decodeObjectForKey:@"hdate"];
        _employeeNumber = [coder decodeIntForKey:@"empnum"];
    }
    return self;
}

-(NSString *) description {
    NSString *desc = [NSString stringWithFormat:@"\t Employee: %i \n \t Name: %@ %@ \n \t Was hired on: %@ \n -----", [self employeeNumber], [self firstName], [self lastName], [self hireDate]];
    return desc;
}

@end
