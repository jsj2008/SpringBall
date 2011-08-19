//
//  Platform2.m
//  BestJumps
//
//  Created by naceka on 19.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Platform2.h"


@implementation Platform2

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {	
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"platform_grass.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		cpVect verts[] = {
			cpv(-58, -21),
			cpv(-58, -5),
			cpv( 58, -5),
			cpv( 58, -21),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);
		
		shape = cpPolyShapeNew(body, 4, verts, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;
		shape->collision_type = CT_PLATFORM2;
		
		cpSpaceAddShape(sp, shape);
		
	}
	
	return self;
	
	
}
- (void) dealloc {
	
	[super dealloc];
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 10, sprite.position.y - 10, 20, 20);
}

@end
