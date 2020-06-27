//
//  NSString+FormattingOptions.m
//  LanguageFeaturesExample
//
//  Created by Megan Yu on 6/21/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import "NSString+FormattingOptions.h"

@implementation NSString (FormattingOptions)

-(NSString *)convertWhitespace {
    NSString *newString = [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    return newString;
}

@end
