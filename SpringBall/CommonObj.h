//
//  CommonObj.h
//  Springs
//
//  Created by s1ip on 10.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "chipmunk.h"

#define BALL_RADIUS 13

enum Collision_type { CT_WALL = 1, CT_PITSTOP, CT_BALL, CT_WIND, CT_SHADOW, CT_ARROW, CT_HYPER, CT_SPIKE, CT_REPEL, CT_NOGRAV, CT_PLATFORM, CT_SAW, CT_TELEPORT, CT_SCREW, CT_PLATFORM1, CT_PLATFORM2, CT_STAR };

@protocol Rotate

- (void) setAngle: (cpFloat)a;
@end

@interface CommonObj : NSObject {

	cpBody* body;
	cpShape* shape;
	CCSprite* sprite;
	cpSpace* sp;
	CCLayer* lay;
}

- (void) setPosition:(CGPoint)pos;
- (CGRect) getRect;
- (void) rotate90;

@property (readonly) CCSprite* sprite;
@property (readonly) cpBody* body;

@end
