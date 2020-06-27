//
//  Account.h
//  LanguageFeaturesExample
//
//  Created by Megan Yu on 6/21/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject

@property NSString *accountName;
@property int accountNumber;

// Another option is to have the balance property in the Account extension, but also have a readonly version in the public header file to generate a reader version
@property (readonly) NSDecimalNumber *balance;

-(void) deposit: (NSDecimalNumber *) amount;
-(void) withdraw: (NSDecimalNumber *) amount;

@end

NS_ASSUME_NONNULL_END
