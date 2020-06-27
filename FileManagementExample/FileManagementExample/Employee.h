//
//  Employee.h
//  FileManagementExample
//
//  Created by Megan Yu on 6/18/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject <NSCoding> // need this class to do encoding/decoding

@property NSString *firstName;
@property NSString *lastName;
@property NSDate *hireDate;
@property int employeeNumber;

@end

NS_ASSUME_NONNULL_END
