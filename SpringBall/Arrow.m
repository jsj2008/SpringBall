//
//  Arrow.m
//  Springs
//
//  Created by вадим on 3/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Arrow.h"


@implementation Arrow

//static 	CCSprite* back_sprite;

@synthesize angle;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* type:(int)type*/ {	
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
//		typ = type;
		angle = 0;

		sprite = [CCSprite spriteWithFile:@"arrow.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
				
		cpVect verts[] = {
			cpv(-18, -18),
			cpv(-18, 18),
			cpv( 18, 18),
			cpv( 18, -18),
		};
		
		body = cpBodyNew(1e10/*INFINITY*/, INFINITY);
		cpSpaceAddBody(sp, body);
		
		shape = cpPolyShapeNew(body, 4, verts, cpvzero);
		shape->e = 1.0f;
		shape->u = 1.0f;
		shape->data = self;
		shape->collision_type = CT_ARROW;
		
		cpSpaceAddShape(sp, shape);
		
	}
	
	return self;
	
	
}
- (void) dealloc {
/*	
	//	[super dealloc];
	//[sprite stopAllActions];
	[lay removeChild:sprite cleanup:YES];
//	[lay removeChild:back_sprite cleanup:NO];
	
//	shape->body = nil;
//	shape->data = nil;
	cpSpaceRemoveShape(sp, shape);
	cpShapeFree(shape);
	cpSpaceRemoveBody(sp, body);
	cpBodyFree(body);
*/		
	[super dealloc];
}

- (void) rotate90 {
	angle += 90;
	if(angle > 270)
		angle = 0;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (void) setAngle: (cpFloat)a {
	angle = a;
	cpBodySetAngle(body, CC_DEGREES_TO_RADIANS(-angle));
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 18, sprite.position.y - 18, 36, 36);
}

@end
