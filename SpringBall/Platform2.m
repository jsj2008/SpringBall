//
//  Platform2.m
//  BestJumps
//
//  Created by naceka on 19.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Platform2.h"
#import "Common.h"

@implementation Platform2

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space {	
	
	self = [super init];
	
	if(self !=nil) {
		
		sp = space;
		lay = lr;
		
//		sprite = [CCSprite spriteWithFile:@"platform_grass.png"];

        switch ([Common instance].season) {
            case SZ_SUMMER:
            default:
                sprite = [CCSprite spriteWithFile:@"platform_summer.png"];
                break;
            case SZ_AUTUMN:
                sprite = [CCSprite spriteWithFile:@"platform_autumn.png"];
                break;
            case SZ_WINTER:
                sprite = [CCSprite spriteWithFile:@"platform_winter.png"];
                break;
            case SZ_SPRING:
                sprite = [CCSprite spriteWithFile:@"platform_spring.png"];
                break;
        }

        sprite.position = ccp(-500, -500);
		[lr addChild:sprite z:6];	
		
		cpVect verts[] = {
			cpv(-38, -15),
			cpv(-38, -7),
			cpv( 50, -7),
			cpv( 50, -15),
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
