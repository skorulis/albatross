//
//  Ship.m
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import "Ship.h"

@implementation Ship

- (id) init {
    self = [super initWithFile:@"ship.png"];
    self.acc = 150;
    self.maxVel = 150;
    [self commonInit];
    return self;
}

@end
