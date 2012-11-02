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
    [self scheduleUpdate];
    self.position = CGPointMake(100, 100);
    return self;
}

-(void) update:(ccTime)delta {
    self.position = CGPointMake(self.position.x+(32*delta), self.position.y+(32*delta));
    
}

@end
