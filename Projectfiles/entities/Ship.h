//
//  Ship.h
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import <Foundation/Foundation.h>
#import "Vec2f.h"

@interface Ship : CCSprite

@property (nonatomic) float acc;
@property (nonatomic) float maxVel;
@property (nonatomic,strong) Vec2f* vel;


@end
