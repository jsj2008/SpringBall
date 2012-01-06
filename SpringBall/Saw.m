//
//  Saw.m
//  Springs
//
//  Created by вадим on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Saw.h"


@implementation Saw

//- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type {
	
	self = [super init];
	
	if(self !=nil) {
		
        typ = type;
        
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"saw.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
	
//        [bg runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.7f position:ccp(size.width/2 + 10, size.height/2)], [CCCallFuncN actionWithTarget:self selector:@selector(init1)], nil]];
        
		shape = cpCircleShapeNew(body, SAW_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_SAW;
		
		cpSpaceAddShape(space, shape);
		
//		body->w = 1.5f;

//		cpBodyApplyImpulse(body, cpvmult(cpvnormalize(cpvrperp(sprite.position)),400), cpv(0,5.0f));
		cpBodyApplyImpulse(body, cpv(400,400), cpvzero);
	
	}
	
	return self;
	
}

- (void) dealloc {
	
	[super dealloc];
}

- (CGRect) getRect {

	return CGRectMake( sprite.position.x - SAW_RADIUS, sprite.position.y - SAW_RADIUS, SAW_RADIUS * 2, SAW_RADIUS * 2);
}

@end
