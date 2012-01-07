//
//  Wind.m
//  Springs
//
//  Created by вадим on 2/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Wind.h"
#import "Common.h"

@implementation Wind

@synthesize angle;
@synthesize typ;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type {	
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		typ = type;
		angle = 0;
		
		sprite = [CCSprite spriteWithFile:@"wing_weak_1.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	

		id anim1 = [CCAnimation animationWithName:@"weakwind" delay:0.03f];
		for( int j = 1; j <= 10; j++)
			[anim1 addFrameWithFilename:[NSString stringWithFormat:@"wing_weak_%d.png", j]];

		id anim2 = [CCAnimation animationWithName:@"strongwind" delay:0.03f];
		for( int j = 1; j <= 10; j++)
			[anim2 addFrameWithFilename:[NSString stringWithFormat:@"wing_strong_%d.png", j]];
		
		anm_move1 = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anim1 restoreOriginalFrame:NO]]retain];
		anm_move2 = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anim2 restoreOriginalFrame:NO]]retain];

		[sprite runAction:(type == WIND_EASY)?anm_move1:anm_move2];
		
		cpVect verts1[] = {
			cpv(-60, -55.5f),
			cpv(-60, 55.5f),
			cpv( 60, 55.5f),
			cpv( 60, -55.5f),
		};
		cpVect verts2[] = {
			cpv(-60, -49.5f),
			cpv(-60, 49.5f),
			cpv( 60, 49.5f),
			cpv( 60, -49.5f),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);

		shape = cpPolyShapeNew(body, 4, (type == WIND_EASY)?verts1:verts2, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;//sprite;
		shape->collision_type = CT_WIND;
		
		cpSpaceAddShape(sp, shape);
		
	}
	
	return self;
	
	
}
- (void) dealloc {
/*	
//	[super dealloc];
	[sprite stopAllActions];
	[lay removeChild:sprite cleanup:NO];

//	shape->body = nil;
//	shape->data = nil;
	cpSpaceRemoveShape(sp, shape);
	cpShapeFree(shape);
	cpSpaceRemoveBody(sp, body);
	cpBodyFree(body);
	
*/	

	[anm_move1 release];
	[anm_move2 release];

	[super dealloc];
	
}

- (void) rotate90 {
	angle += 90;
	if(angle > 270)
		angle = 0;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (void) setAngle: (cpFloat)a {
	angle = a;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 50, sprite.position.y - 50, 100, 100);
}

- (int) getWindPower {

	switch (typ) {
	case WIND_EASY: return [Common instance].weakwind;
	case WIND_STRONG: return [Common instance].strongwind;
	}
	
	return 0;
}

@end
