//
//  Platform.m
//  Springs
//
//  Created by вадим on 3/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Platform.h"


@implementation Platform

@synthesize angle;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {	
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		angle = 0;
		
		sprite = [CCSprite spriteWithFile:@"platform.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		cpVect verts[] = {
			cpv(-13, -25),
			cpv(-13, 25),
			cpv( 13, 25),
			cpv( 13, -25),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);
		
		shape = cpPolyShapeNew(body, 4, verts, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;
		shape->collision_type = CT_PLATFORM;
		
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
	return CGRectMake( sprite.position.x - 10, sprite.position.y - 10, 20, 20);
}

@end
