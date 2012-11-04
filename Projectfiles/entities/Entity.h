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

@property (nonatomic,strong) Vec2f* vel;

@end
