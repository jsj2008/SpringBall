//
//  Ball.h
//  Springs
//
//  Created by s1ip on 01.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MassBody.h"
#import "Wind.h"
#import "Common.h"

enum BallStatus {BS_ONSTART, BS_ONFINISH, BS_FREE, BS_DIED, BS_ONWIND, BS_HYPER};

#define MAX_SHADOW 40

//extern LevelStruct* ls;

@interface Ball : CommonObj {

	cpConstraint* cons;
	id anm_move;
	id anm_vzr;
	int status;
//	bool iswind;
	CCSprite* shadow[MAX_SHADOW];
	int shd_cnt;
}

@property (readonly) int status;

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space pos:(CGPoint)pos color:(int)color;
- (bool) isFree;
- (bool) canGo;
- (bool) isHyper;
- (void) hangon:(MassBody*)mb;
- (void) windon:(Wind*)w;
- (void) windoff;
- (void) w_friction;
- (void) go:(CGPoint)v;
- (void) stop;
- (void) drawShadow;
- (void) predrawShadow;
- (void) changeGravity;
- (void) setHyper;
- (void) die;
- (void) repelon:(Repel*)r;
- (void) setTeleport: (int)t;
//- (void) repeloff;
- (void) vzrCallback;

@end
