//
//  GameLayer.h
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import "CCLayer.h"

@class Ship;

@interface GameLayer : CCLayer

@property (nonatomic,strong) Ship* ship;

@end
