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
#import "Asteroid.h"

@implementation GameLayer

- (id) init {
    self = [super init];
    self.ship = [[Ship alloc] init];
    [self addChild:self.ship];
    self.ship.position = CGPointMake(300, 300);

    self.asteroids = [NSMutableArray new];
    
    self.inputLayer = [[InputLayer alloc] init];
    [self addChild:self.inputLayer];

    [self scheduleUpdate];
    [self addAsteroid];
    return self;
}

-(void) update:(ccTime)delta
{
    CGPoint vel = self.inputLayer.joystick.velocity;
    self.ship.vel.x+= vel.x*delta*self.ship.acc;
    self.ship.vel.y+=vel.y*delta*self.ship.acc;
    
    [self moveEntity:self.ship delta:delta];
    
    
    for(Asteroid* a in self.asteroids) {
        
    }
    
}

- (void) moveEntity:(Entity*)e delta:(ccTime)delta {
    e.position = CGPointMake(e.position.x + e.vel.x*delta, e.position.y + e.vel.y*delta);
    if( (e.position.x <= 0 && e.vel.x < 0)  || (e.position.x > self.contentSize.width && e.vel.x > 0)) {
        e.vel.x*=-1;
    }
    if( (e.position.y <= 0 && e.vel.y < 0)  || (e.position.y > self.contentSize.height && e.vel.y > 0)) {
        e.vel.y*=-1;
    }
}


- (void) addAsteroid {
    Asteroid* a = [[Asteroid alloc] init];
    [self addChild:a];
    [self.asteroids addObject:a];
}

@end
