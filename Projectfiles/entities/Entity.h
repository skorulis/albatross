//
//  Entity.h
//  albatross
//
//  Created by Alex Skorulis on 4/11/12.
//
//

#import "CCSprite.h"
#import "Vec2f.h"

@interface Entity : CCSprite

@property (nonatomic) float acc;
@property (nonatomic,strong) Vec2f* vel;
@property (nonatomic,strong) Vec2f* loc;
@property (nonatomic) float maxVel;

- (void) commonInit;

@end
