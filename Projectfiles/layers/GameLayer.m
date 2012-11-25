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
#import "Random.h"
#import "Powerup.h"
#import "CCScale9Sprite.h"

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
    
    
    //CCScale9Sprite* bg = [[CCScale9Sprite alloc] initWithFile:@"ship.png" capInsets:CGRectMake(10, 10, 20, 20)];
    
    CCSprite* bg = [[CCSprite alloc] initWithFile:@"game-background.png"];

    bg.position = CGPointMake(width/2, height/2);
    //bg.contentSize = CGSizeMake(width, height);
    
    [self addChild:bg z:-1];
    
    [self scheduleUpdate];
    [self spawnAsteroid];
    [self spawnAsteroid];
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
    [e.vel addE:dir mult:e.acc*delta];
}

- (void) moveEntity:(Entity*)e delta:(ccTime)delta {
    NSAssert(e.vel!=nil,@"Attempt to move entity without velocity");
    [e.vel clampE:e.maxVel];
    
    e.position = CGPointMake(e.position.x + e.vel.x*delta, e.position.y + e.vel.y*delta);
    if( (e.position.x - e.size.width/2 <= 0 && e.vel.x < 0)  || (e.position.x + e.size.width/2 > self.box.size.width && e.vel.x > 0)) {
        e.vel.x*=-1;
    }
    if( (e.position.y - e.size.height/2 <= 0 && e.vel.y < 0)  || (e.position.y + e.size.height/2 > self.box.size.height && e.vel.y > 0)) {
        e.vel.y*=-1;
    }
}


- (void) spawnAsteroid {
    Asteroid* a = [[Asteroid alloc] init];
    a.loc = [self randomPosition];
    [self addChild:a];
    [self.asteroids addObject:a];
}

- (void) spawnPowerup {
    Powerup* p = [[Powerup alloc] init];
    p.loc = [self randomPosition];
    [self addChild:p];
}

- (Vec2f*) randomPosition {
    Vec2f* ret = [Vec2f new];
    ret.x = randDM(self.box.size.width);
    ret.y = randDM(self.box.size.height);
    return ret;
}

@end
