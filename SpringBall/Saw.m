//
//  Saw.m
//  Springs
//
//  Created by вадим on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Saw.h"
#import "Common.h"

@implementation Saw

@synthesize typ;

//- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {
- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type {
	
	self = [super init];
	
	if(self !=nil) {
		
        typ = type;
        dir = false;
        
		sp = space;
		lay = lr;
		
		sprite = [CCSprite spriteWithFile:@"saw.png"];
		sprite.position = ccp(-500, -500);
		[lr addChild:sprite];	
		
//		body = cpBodyNew(1e10/*INFINITY*/, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		body = cpBodyNew(10.0f, /*INFINITY*/cpMomentForCircle(1.0, 1, 1, cpvzero));
		cpSpaceAddBody(sp, body);
	
//        [bg runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.7f position:ccp(size.width/2 + 10, size.height/2)], [CCCallFuncN actionWithTarget:self selector:@selector(init1)], nil]];
        
		shape = cpCircleShapeNew(body, SAW_RADIUS, cpvzero);
		shape->e = 0.5f;
		shape->u = 0.5f;
		shape->data = self;//sprite;
		shape->collision_type = CT_SAW;
		
		cpSpaceAddShape(space, shape);
		
//		body->w = 1.5f;

//        CGPoint forceVect = ccpSub(pt, ball[selected].sprite.position);
//        //NSLog(@"scale = %f", cpvlength(forceVect));
//        cpFloat ln = cpvlength(forceVect);
//        cpFloat k = [Common instance].shootkoeff;
//        cpFloat ml = (ln <= 150)?k:(2 * k * 100 / ln);
//        [ball[selected] go:ccpMult(forceVect, ml)];
        
//		cpBodyApplyImpulse(body, cpvmult(cpvnormalize(cpvrperp(sprite.position)),400), cpv(0,5.0f));
//		cpBodyApplyImpulse(body, cpv(sprite.position.x, sprite.position.y + 100), cpvzero);

        if(typ == ST_VERTICAL)
            cpBodyApplyImpulse(body, cpv(0, 100), cpvzero);
        else
            cpBodyApplyImpulse(body, cpv(100, 0), cpvzero);
            
	
	}
	
	return self;
	
}

- (void) rotate90 {

    body->v = cpv(0, 0);
    dir = false;
    
    if(typ == ST_VERTICAL) {

//        cpBodyApplyImpulse(body, cpv(0, 100*(dir?-1:1)), cpvzero);
        typ = ST_HORIZONTAL;
        cpBodyApplyImpulse(body, cpv(100, 0), cpvzero);
    }
    else {

//        cpBodyApplyImpulse(body, cpv(100*(dir?-1:1), 0), cpvzero);
        typ = ST_VERTICAL;
        cpBodyApplyImpulse(body, cpv(0, 100), cpvzero);
    }

}

- (void) changeDir {
  
    if(typ == ST_VERTICAL)
        cpBodyApplyImpulse(body, cpv(0, 100*(dir?2:-2)), cpvzero);
    else
        cpBodyApplyImpulse(body, cpv(100*(dir?2:-2), 0), cpvzero);
        
    dir = !dir;
}

- (void) dealloc {
	
	[super dealloc];
}

- (CGRect) getRect {

	return CGRectMake( sprite.position.x - SAW_RADIUS, sprite.position.y - SAW_RADIUS, SAW_RADIUS * 2, SAW_RADIUS * 2);
}

@end
