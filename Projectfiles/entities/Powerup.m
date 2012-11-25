//
//  Powerup.m
//  albatross
//
//  Created by Alex Skorulis on 13/11/12.
//
//

#import "Powerup.h"

@implementation Powerup

- (id) init {
    self = [super initWithFile:@"powerup-plain.png"];
    [self commonInit];
    return self;
}


@end
