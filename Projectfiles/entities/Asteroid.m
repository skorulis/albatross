//
//  Asteroid.m
//  albatross
//
//  Created by Alex Skorulis on 01/11/2012.
//
//

#import "Asteroid.h"

@implementation Asteroid

- (id) init {
    self = [super initWithFile:@"joystick-stick.png"];
    self.acc = 100;
    self.maxVel = 50;
    [self commonInit];
    return self;
}

@end
