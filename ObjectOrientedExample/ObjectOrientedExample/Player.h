//
//  Player.h
//  ObjectOrientedExample
//
//  Created by Megan Yu on 6/17/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property int score;

-(instancetype) initWithInteger:(int) initialScore;

@end

NS_ASSUME_NONNULL_END
