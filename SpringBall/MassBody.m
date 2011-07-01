//
//  MassBody.m
//  Springs
//
//  Created by s1ip on 10.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MassBody.h"


@implementation MassBody

@synthesize type;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* pos:(CGPoint)pos*/ type:(int)typ {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		type = typ;
		
		sprite = [CCSprite spriteWithFile:(typ==MS_START)?@"start.png":((typ==MS_FINISH)?@"finish.png":@"pitstop.png")];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	

		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);

		shape = cpCircleShapeNew(body, MASSBODY_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_PITSTOP;
		
		cpSpaceAddShape(space, shape);
		
	}
	
	return self;
	
}

- (void) dealloc {
/*	
	//[super dealloc];
	[sprite stopAllActions];
	[lay removeChild:sprite cleanup:YES];
	
//	shape->body = nil;
//	shape->data = nil;
	cpSpaceRemoveShape(sp, shape);
	cpShapeFree(shape);
	cpSpaceRemoveBody(sp, body);
	cpBodyFree(body);
	
*/	
	[super dealloc];
}

	
- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 21, sprite.position.y - 21, 42, 42);
}

@end
