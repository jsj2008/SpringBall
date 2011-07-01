//
//  Repel.m
//  Springs
//
//  Created by вадим on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Repel.h"


@implementation Repel

@synthesize typ;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type {
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		typ = type;
		
		sprite = [CCSprite spriteWithFile:(typ == 0)?@"repel.png":((typ == 1)?@"repel_1.PNG":@"repel_2.PNG")];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY /*cpMomentForCircle(1.0, 1, 1, cpvzero)*/);
		cpSpaceAddBody(sp, body);
		
		shape = cpCircleShapeNew(body, REPEL_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;
		shape->collision_type = CT_REPEL;
		
		cpSpaceAddShape(sp, shape);
		
	}
	
	return self;
	
}

- (void) dealloc {

	[super dealloc];
}

- (void) ballon {

	[sprite initWithFile:@"repel_select.png"];
}

- (void) balloff {

	[sprite initWithFile:(typ == 0)?@"repel.png":((typ == 1)?@"repel_1.PNG":@"repel_2.PNG")];
}

- (CGRect) getRect {

	return CGRectMake( sprite.position.x - REPEL_RADIUS, sprite.position.y - REPEL_RADIUS, REPEL_RADIUS * 2, REPEL_RADIUS * 2);
}

@end
