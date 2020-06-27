//
//  Account+PrivateProperties.h
//  LanguageFeaturesExample
//
//  Created by Megan Yu on 6/21/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Account ()

@property NSDecimalNumber *balance;

// Technically you can also list private methods here, but it's not necessary. You can just implement it in the implementation file and not write the signature in the interface - then the method will be usable inside the class but not outside

@end

NS_ASSUME_NONNULL_END
