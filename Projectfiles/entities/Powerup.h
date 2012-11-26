//
//  Powerup.h
//  albatross
//
//  Created by Alex Skorulis on 13/11/12.
//
//

#import "Entity.h"

typedef enum {
    kBulletType
    
    
} PowerupType;

@interface Powerup : Entity

@property (nonatomic, assign) PowerupType type;

@end
