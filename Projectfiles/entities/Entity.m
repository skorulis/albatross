//
//  Entity.m
//  albatross
//
//  Created by Alex Skorulis on 4/11/12.
//
//

#import "Entity.h"

@implementation Entity

@synthesize loc;

- (void) commonInit {
    self.vel = [Vec2f new];
    self.loc = [Vec2f new];
}

- (void) setLoc:(Vec2f *)l {
    loc = l;
}

- (Vec2f*) loc {
    loc.x = self.position.x;
    loc.y = self.position.y;
    return loc;
}

@end
