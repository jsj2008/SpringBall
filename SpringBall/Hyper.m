//
//  Hyper.m
//  Springs
//
//  Created by вадим on 3/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Hyper.h"


@implementation Hyper

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"time.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
		
		shape = cpCircleShapeNew(body, HYPER_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_HYPER;
		
		cpSpaceAddShape(space, shape);
		
	}
	
	return self;
	
}

- (void) dealloc {
	/*
	//	[super dealloc];
//	[sprite stopAllActions];
	[lay removeChild:sprite cleanup:NO];
	
	//	shape->body = nil;
	//	shape->data = nil;
	cpSpaceRemoveShape(sp, shape);
	cpShapeFree(shape);
	cpSpaceRemoveBody(sp, body);
	cpBodyFree(body);
	
	//	[anm_move1 release];
	//	[anm_move2 release];
	*/
	[super dealloc];
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - HYPER_RADIUS, sprite.position.y - HYPER_RADIUS, HYPER_RADIUS * 2, HYPER_RADIUS * 2);
}

@end
