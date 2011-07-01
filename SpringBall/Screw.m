//
//  Screw.m
//  Springs
//
//  Created by Admin on 08.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Screw.h"


@implementation Screw

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"platform0.PNG"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		cpVect verts[] = {
			cpv(-7, -44.5f),
			cpv(-7, 44.5f),
			cpv( 7, 44.5f),
			cpv( 7, -44.5f),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);
		
		shape = cpPolyShapeNew(body, 4, verts, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;
		shape->collision_type = CT_SCREW;
		
		cpSpaceAddShape(sp, shape);
		
		body->w = 1.5f;
		
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

