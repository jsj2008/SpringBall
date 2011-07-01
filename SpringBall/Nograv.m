//
//  Nograv.m
//  Springs
//
//  Created by вадим on 3/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Nograv.h"

@implementation Nograv

@synthesize active;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		active = NO;
		
		sprite = [CCSprite spriteWithFile:@"nogravity.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
		
		shape = cpCircleShapeNew(body, NOGRAV_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_NOGRAV;
		
		cpSpaceAddShape(space, shape);

		body->w = 0;

	}
	
	return self;
	
}

- (void) hit {

	active = YES;//!active;
	
	if (active) 
		body->w = 0.4f;
	else
		body->w = 0;
}

- (void) dealloc {

	[super dealloc];
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - NOGRAV_RADIUS, sprite.position.y - NOGRAV_RADIUS, NOGRAV_RADIUS * 2, NOGRAV_RADIUS * 2);
}

@end
