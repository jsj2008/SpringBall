//
//  Star.m
//  Springs
//
//  Created by вадим on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Star.h"


@implementation Star

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
	
	self = [super init];
	
	if(self != nil) {
		
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"star.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
		
		shape = cpCircleShapeNew(body, STAR_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_STAR;
		
		cpSpaceAddShape(space, shape);

   		id anim1 = [CCAnimation animationWithName:@"star" delay:0.08f];
        for( int j = 1; j <= 9; j++)
			[anim1 addFrameWithFilename:[NSString stringWithFormat:@"%dstar.png", j]];
        anm_star = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anim1 restoreOriginalFrame:NO]]retain];

        [sprite runAction:anm_star];
        
		fluct = [[CCRepeatForever actionWithAction:[CCSequence actions:
														[CCScaleTo actionWithDuration:1.0f scale:0.5f],
													    [CCScaleTo actionWithDuration:1.0f scale:1.0f],
														nil]]retain];
		[sprite runAction:fluct];
        
		goout = [[CCFadeOut actionWithDuration:1]retain];
		active = YES;
	}
	
	return self;
	
}

- (void) act {
	
	if(!active)
		return;
	active = NO;
	[sprite stopAllActions];
	[sprite runAction:goout];
}

//- (void) actCallback {
//}

- (void) dealloc {
	
	[fluct release];
	[goout release];
	
    [anm_star release];
    
	[super dealloc];
}

- (CGRect) getRect {
	
	return CGRectMake( sprite.position.x - STAR_RADIUS, sprite.position.y - STAR_RADIUS, STAR_RADIUS * 2, STAR_RADIUS * 2);
}

@end
