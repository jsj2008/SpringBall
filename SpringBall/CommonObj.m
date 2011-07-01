//
//  CommonObj.m
//  Springs
//
//  Created by s1ip on 10.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"


@implementation CommonObj

@synthesize sprite;
@synthesize body;

- (void) setPosition:(CGPoint)pos {
	body->p = pos;
}

- (CGRect) getRect {
	return CGRectMake( sprite.position.x - 1, sprite.position.y - 1, 2, 2);
}

- (void) rotate90 {
}

- (void) dealloc {
	
//	[super dealloc];
	
	[sprite stopAllActions];
	[lay removeChild:sprite cleanup:NO];
	
	cpSpaceRemoveShape(sp, shape);
	cpShapeFree(shape);
	cpSpaceRemoveBody(sp, body);
	cpBodyFree(body);

	[super dealloc];

}

@end
