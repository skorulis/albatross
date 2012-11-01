//
//  MainLayer.m
//  albatross
//
//  Created by Alex Skorulis on 01/11/2012.
//
//

#import "MainLayer.h"
#import "GameLayer.h"

@interface MainLayer ()

@property (nonatomic,strong) GameLayer* game;

@end

@implementation MainLayer

- (id) init {
    self = [super init];
    self.game = [[GameLayer alloc] init];
    [self addChild:self.game];
    return self;
}

@end
