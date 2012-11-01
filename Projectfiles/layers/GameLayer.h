//
//  GameLayer.h
//  albatross
//
//  Created by Alex Skorulis on 31/10/2012.
//
//

#import "CCLayer.h"

@class Ship;
@class InputLayer;

@interface GameLayer : CCLayer

@property (nonatomic,strong) Ship* ship;
@property (nonatomic, strong) InputLayer* inputLayer;

@end
