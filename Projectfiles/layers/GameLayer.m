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
#import "Log.h"

@implementation GameLayer

- (id) init {
    self = [super init];
    self.ship = [[Ship alloc] init];
    [self addChild:self.ship];
    self.ship.position = CGPointMake(300, 300);

    self.asteroids = [NSMutableArray new];
    
    self.inputLayer = [[InputLayer alloc] init];
    
    [self addChild:self.inputLayer z:1];
    
    float width = MAX(self.contentSize.width,self.contentSize.height);
    float height = MIN(self.contentSize.width,self.contentSize.height);
    self.box = CGRectMake(0, 0, width, height);
    self.kInput = [KKInput sharedInput];
    self.kInput.accelerometerActive = self.kInput.accelerometerAvailable;
    self.kInput.gyroActive = self.kInput.gyroAvailable;
    
    [self scheduleUpdate];
    [self addAsteroid];
    return self;
}

-(void) update:(ccTime)delta
{
    [self checkInput:delta];
    
    [self moveEntity:self.ship delta:delta];
    
    Vec2f* shipLoc = self.ship.loc;
    for(Asteroid* a in self.asteroids) {
        [self accelEntity:a towards:shipLoc delta:delta];
        [self moveEntity:a delta:delta];
    }
    
}

- (void) checkInput:(ccTime)delta {
    CGPoint vel = self.inputLayer.joystick.velocity;
    self.ship.vel.x+= vel.x*delta*self.ship.acc;
    self.ship.vel.y+= vel.y*delta*self.ship.acc;
    
    self.ship.vel.x += self.kInput.acceleration.smoothedX * self.ship.acc;
    self.ship.vel.y += self.kInput.acceleration.smoothedY * self.ship.acc;
}

- (void)accelEntity:(Entity*)e towards:(Vec2f*)pos delta:(ccTime)delta {
    Vec2f* dir = [pos minus:e.loc].normaliseE;
    [dir multE:2000*delta];
    e.vel = dir;
}

- (void) moveEntity:(Entity*)e delta:(ccTime)delta {
    NSAssert(e.vel!=nil,@"Attempt to move entity without velocity");
    e.position = CGPointMake(e.position.x + e.vel.x*delta, e.position.y + e.vel.y*delta);
    if( (e.position.x <= 0 && e.vel.x < 0)  || (e.position.x > self.box.size.width && e.vel.x > 0)) {
        e.vel.x*=-1;
    }
    if( (e.position.y <= 0 && e.vel.y < 0)  || (e.position.y > self.box.size.height && e.vel.y > 0)) {
        e.vel.y*=-1;
    }
}


- (void) addAsteroid {
    Asteroid* a = [[Asteroid alloc] init];
    [self addChild:a];
    [self.asteroids addObject:a];
}

@end
