//
//  Spike.m
//  Springs
//
//  Created by вадим on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Spike.h"


@implementation Spike

@synthesize angle;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"spikes.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
/*		cpVect verts[] = {
			cpv(-34.5f, -9.5f),
			cpv(-34.5f, 9.5f),
			cpv( 34.5f, 9.5f),
			cpv( 34.5f, -9.5f),
		};*/
		cpVect verts[] = {
			cpv(-42.0f, -7.5f),
			cpv(-42.0f, 7.5f),
			cpv( 42.0f, 7.5f),
			cpv( 42.0f, -7.5f),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);
		
		shape = cpPolyShapeNew(body, 4, verts, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;
		shape->collision_type = CT_SPIKE;
		
		cpSpaceAddShape(sp, shape);
		
	}
	
	return self;
	
}

- (void) dealloc {

	[super dealloc];
}

- (void) rotate90 {
	angle += 45;//90;
	if(angle > 315/*270*/)
		angle = 0;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (void) setAngle: (cpFloat)a {
	angle = a;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 23, sprite.position.y - 23, 46, 46);
}

@end
