/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim, Andreas Loew 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

//  Updated by Andreas Loew on 20.06.11:
//  * retina display
//  * framerate independency
//  * using TexturePacker http://www.texturepacker.com

#import "InputLayer.h"

#import "SimpleAudioEngine.h"

@interface InputLayer (PrivateMethods)
-(void) addFireButton;
-(void) addJoystick;
@end

@implementation InputLayer

@synthesize joystick,fireButton;

-(id) init
{
	if ((self = [super init]))
	{
		[self addFireButton];
		[self addJoystick];
	}
	
	return self;
}

-(void) addFireButton
{
	float buttonRadius = 50;
	CGSize screenSize = [[CCDirector sharedDirector] winSize];

	fireButton = [SneakyButton button];
	fireButton.isHoldable = YES;
	
	SneakyButtonSkinnedBase* skinFireButton = [SneakyButtonSkinnedBase skinnedButton];
	skinFireButton.position = CGPointMake(screenSize.width - buttonRadius * 1.5f, buttonRadius * 1.5f);
    
    skinFireButton.defaultSprite = [CCSprite spriteWithFile:@"fire-button-idle.png"];
    skinFireButton.pressSprite = [CCSprite spriteWithFile:@"fire-button-pressed.png"];
	skinFireButton.button = fireButton;
	[self addChild:skinFireButton];
}

-(void) addJoystick
{
	float stickRadius = 50;

	joystick = [SneakyJoystick joystickWithRect:CGRectMake(0, 0, stickRadius, stickRadius)];
	joystick.autoCenter = YES;
	
	SneakyJoystickSkinnedBase* skinStick = [SneakyJoystickSkinnedBase skinnedJoystick];
	skinStick.position = CGPointMake(stickRadius * 1.5f, stickRadius * 1.5f);
    skinStick.backgroundSprite = [CCSprite spriteWithFile:@"joystick-back.png"];
	skinStick.thumbSprite = [CCSprite spriteWithFile:@"joystick-stick.png"];
	skinStick.joystick = joystick;
	[self addChild:skinStick];
}

-(void) update:(ccTime)delta
{

}

@end
