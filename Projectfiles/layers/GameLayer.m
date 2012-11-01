//
//  GameLayer.m
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import "GameLayer.h"
#import "InputLayer.h"
#import "Ship.h"

@implementation GameLayer

- (id) init {
    self = [super init];
    self.ship = [[Ship alloc] init];
    [self addChild:self.ship];
    self.ship.position = CGPointMake(100, 100);

    
    self.inputLayer = [[InputLayer alloc] init];
    [self addChild:self.inputLayer];

    [self scheduleUpdate];
    
    return self;
}

-(void) update:(ccTime)delta
{
    CGPoint vel = self.inputLayer.joystick.velocity;
    self.ship.position = CGPointMake(self.ship.position.x+vel.x, self.ship.position.y + vel.y);
    
    
}

@end
