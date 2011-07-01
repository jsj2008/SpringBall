//
//  Ball.m
//  Springs
//
//  Created by s1ip on 01.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "Common.h"

//LevelStruct* ls = nil;

@implementation Ball

@synthesize status;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space pos:(CGPoint)pos {

	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
			
		status = BS_FREE;

		sprite = [CCSprite spriteWithFile:@"2.png"];
		sprite.position = pos;//ccp(240, 160);
		[lr addChild:sprite z:5];
		
		for(int i = 0; i <  [Common instance].tailcount; i++) {
			shadow[i] = [CCSprite spriteWithFile:@"70.png"];
			shadow[i].position = pos;
			shadow[i].opacity = 0;
			//[shadow[i] runAction:[CCFadeOut actionWithDuration:0.001f]];
			[lr addChild:shadow[i] z:4];			
		}
		
		shd_cnt = 0;

		id anim1 = [CCAnimation animationWithName:@"ball" delay:0.3f + CCRANDOM_0_1() / 2];
		for( int j = 1; j <= 2; j++)
			[anim1 addFrameWithFilename:[NSString stringWithFormat:@"%d.png", j]];

		anm_move = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: anim1 restoreOriginalFrame:NO]]retain];
		[sprite runAction:anm_move];

		id anim2 = [CCAnimation animationWithName:@"ballvzr" delay:0.3f];
		for( int j = 1; j <= 4; j++)
			[anim2 addFrameWithFilename:[NSString stringWithFormat:@"vzr%d.png", j]];
		anm_vzr = [[CCSequence actions:
						[CCAnimate actionWithAnimation: anim2],
						[CCCallFunc actionWithTarget:self selector:@selector(vzrCallback)],
						nil]retain];
		
		body = cpBodyNew(10.0f, /*INFINITY*/cpMomentForCircle(100.0f, 1, 1, cpvzero));
		body->p = pos;//ccp(240, Y);
		cpSpaceAddBody(space, body);

		shape = cpCircleShapeNew(body, BALL_RADIUS, cpvzero);
		shape->e = 0.7f;
		shape->u = 1.0f;
		shape->data = self;//sprite;
		shape->collision_type = CT_BALL;
		cpSpaceAddShape(space, shape);

		cpBodyApplyForce(body, [[Common instance] getGravity], cpvzero);
		
	}
	
	return self;
	
}

- (bool) isFree {
	
	if((status == BS_FREE) || (status == BS_ONWIND) || (status == BS_HYPER))
		return YES;
	return NO;
}	

- (bool) canGo {

	if((status == BS_ONSTART) || (status == BS_HYPER))
		return YES;
	return NO;
}

- (bool) isHyper {
	
	return (status == BS_HYPER);
}

- (void) repelon:(Repel*)r {
	int f = (r.typ == 0)?[Common instance].repelpower1:((r.typ == 1)?[Common instance].repelpower2:[Common instance].repelpower3);
	cpBodyApplyImpulse(body, cpvmult(cpvnormalize(body->v), f), cpvzero);
//	cpBodyApplyImpulse(body, body->v, cpvzero);
}

//- (void) repeloff {
//
//}

- (void) hangon:(MassBody*)mb {
//	NSLog(@"hangon");
//	if(status != BS_FREE)
	if(![self isFree])
		return;
	cpBodyResetForces(body);
	body->v = cpvzero;
	body->w = 0;
	body->i = 0;
	cons = cpPinJointNew(body, mb.body, cpv(0,0), cpv(0,0));
	cpSpaceAddConstraint(sp, cons);
	cpBodyApplyImpulse(body, cpvmult(cpvnormalize(cpvrperp(mb.sprite.position)),[Common instance].ringspeed), cpv(0,[Common instance].ringspin));
	
	switch(mb.type) {
		case MS_FINISH:
			status = BS_ONFINISH;
			[Common instance].ballsonfinish++;
			break;
		case MS_START:
		case MS_TRANSIT:
		default:
			status = BS_ONSTART;
			break;
	}
}

- (void) windon:(Wind*)w {
	
//	if(iswind)
//		return;
//	iswind = YES;
	if(status == BS_ONWIND)
		return;
	status = BS_ONWIND;
	cpBodyResetForces(body);
//	cpBodyApplyForce(body, cpv(0, [w getWindPower]/*[Common instance].wind*/), cpvzero);
	cpVect av = cpvforangle(CC_DEGREES_TO_RADIANS(-w.angle + 90));
	cpBodyApplyForce(body, cpvmult(av,[w getWindPower]), cpvzero);
	
}

- (void) windoff {
	
	cpBodyResetForces(body);
	cpBodyApplyForce(body, /*cpv(0, -[Common instance].gravity)*/[[Common instance] getGravity], cpvzero);
//	iswind = NO;
	status = BS_FREE;
	
}

- (void) changeGravity {
	
	if(status == BS_FREE) {
		cpBodyResetForces(body);
//		if([Common instance].gravityexists)
			cpBodyApplyForce(body, [[Common instance] getGravity], cpvzero);
	}
	
}

- (void) vzrCallback {
	
	sprite.visible = NO;
}

- (void) die {

	if(status == BS_DIED)
		return;
	[sprite stopAllActions];
	status = BS_DIED;
	//[sprite initWithFile:@"2.png"];
	[sprite runAction:anm_vzr];
	cpBodyResetForces(body);
	body->w = 0;
	body->i = 0;
	body->v = cpvzero;
	
}

- (void) w_friction {
	if(status == BS_DIED)
		return;
	
	//NSLog(@"fric");

	body->w *= 0.9;
	if((body->w * body->w < 0.09) && (body->w * body->w > 0.00001))
		[self die];
}

- (void) dealloc {
		
	//	[super dealloc];

	if((status == BS_ONSTART) || (status == BS_ONFINISH)) {
		cpConstraintDestroy(cons);
		cpConstraintFree(cons);
		cpSpaceRemoveConstraint(sp, cons);
	}
	
//	[sprite stopAllActions];
//	[lay removeChild:sprite cleanup:NO];
	
//	cpSpaceRemoveShape(sp, shape);
//	cpShapeFree(shape);
//	cpSpaceRemoveBody(sp, body);
//	cpBodyFree(body);
	
	[anm_move release];
	[anm_vzr release];
	
	for(int i = 0; i <  [Common instance].tailcount; i++)
		[lay removeChild:shadow[i] cleanup:NO];

	[super dealloc];
	
	
}

- (void) go:(CGPoint)v {
	
	if((status == BS_ONSTART) || (status == BS_ONFINISH)) {
		cpConstraintDestroy(cons);
		cpConstraintFree(cons);
		cpSpaceRemoveConstraint(sp, cons);
	}
		
	status = BS_FREE;
	cpBodyApplyImpulse(body, v, cpvzero);
	cpBodyApplyForce(body, [[Common instance] getGravity], cpvzero);

	body->w = 30 * (0.5f - CCRANDOM_0_1());

	for(int i = 0; i < [Common instance].tailcount; i++) {
		shadow[i].position = sprite.position;
		shadow[i].opacity = 255;
	}
}

- (void) stop {

	body->v = cpvzero;
	body->w = 0;
	body->i = 0;

}

- (void) predrawShadow {

//	if(status != BS_FREE) {
	if(![self isFree]) {	
	shadow[shd_cnt].opacity = 0;
	shd_cnt++;
	if(shd_cnt >= [Common instance].tailcount)
		shd_cnt = 0;
	
	}
	
}

- (void) drawShadow {

//	if(status != BS_FREE)
//		return;
	if(![self isFree])
		return;
		
			shadow[shd_cnt].position = sprite.position;
			int pst = shd_cnt;
			float kf = 1.0f;
			do {
				shadow[pst].scale = kf;
				shadow[pst].opacity = 255 * kf;
				kf *= [Common instance].tailfadeout;
				pst--;
				if(pst < 0)
					pst = [Common instance].tailcount - 1;
			} while (pst != shd_cnt); 

	shd_cnt++;
	if(shd_cnt >= [Common instance].tailcount)
		shd_cnt = 0;
}

- (void) setHyper {

	if(status == BS_HYPER)
		return;
	status = BS_HYPER;
	cpBodyResetForces(body);
	body->v = cpvmult(body->v, 0.15f);
	body->w = body->w * 0.8f;
	cpBodyApplyForce(body, cpvmult([[Common instance] getGravity], 0.1f), cpvzero);
	
}

- (void) setTeleport: (int)t {
	
//	int n = (t % 2)?t-1:t+1;
//	if(n >= ls->teleport_count)
//		return;
	[self setPosition:ls->iteleport[/*n*/t]];
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - BALL_RADIUS, sprite.position.y - BALL_RADIUS, BALL_RADIUS * 2, BALL_RADIUS * 2);
}

@end
