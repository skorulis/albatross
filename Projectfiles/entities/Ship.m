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
    self.acc = 50;
    self.maxVel = 150;
    self.vel = [Vec2f new];
    return self;
}

@end
