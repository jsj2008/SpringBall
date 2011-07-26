//
//  Teleport.m
//  Springs
//
//  Created by вадим on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Teleport.h"


@implementation Teleport

@synthesize number;
@synthesize active;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space num:(int)num {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		number = num;
		active = YES;
		
		sprite = [CCSprite spriteWithFile:@"tport.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
		
		shape = cpCircleShapeNew(body, TELEPORT_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;
		shape->collision_type = CT_TELEPORT;
		
		cpSpaceAddShape(space, shape);
		
		body->w = -4.0f;
		
		//		cpBodyApplyImpulse(body, cpvmult(cpvnormalize(cpvrperp(sprite.position)),400), cpv(0,5.0f));
		
	}
	
	return self;
	
}

- (void) dealloc {
	
	[super dealloc];
}

- (CGRect) getRect {
	
	return CGRectMake( sprite.position.x - TELEPORT_RADIUS, sprite.position.y - TELEPORT_RADIUS, TELEPORT_RADIUS * 2, TELEPORT_RADIUS * 2);
}

@end
