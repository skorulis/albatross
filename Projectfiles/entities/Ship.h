//
//  Ship.h
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import <Foundation/Foundation.h>
#import "Vec2f.h"
#import "Entity.h"

@interface Ship : Entity

@property (nonatomic) float acc;
@property (nonatomic) float maxVel;


@end
