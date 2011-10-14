//
//  SummerLayer.h
//  BestJumps
//
//  Created by naceka on 13.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Common.h"

#define ITEM_TAG 2000

@interface SummerLayer : CCLayer {
    
    BOOL click;
    CCSprite* gazons[SEASON_LEVELS_CNT];
    float ey;
    float fy;
    float ex;
    float fx;
    CCSprite* ia1;
}

+ (CCScene *) scene;

- (void) pCallback1:(id) sender;
- (void) pBack:(id) sender;
//- (void) pCallback2:(id) sender;
//- (void) pCallback3:(id) sender;
//- (void) pCallback4:(id) sender;
//- (void) pCallback5:(id) sender;
//- (void) pCallback6:(id) sender;
//- (void) pCallback7:(id) sender;
//- (void) pCallback8:(id) sender;
//- (void) pCallback9:(id) sender;
//- (void) pCallback10:(id) sender;
//- (void) pCallback11:(id) sender;
//- (void) pCallback12:(id) sender;
//- (void) pCallback13:(id) sender;
//- (void) pCallback14:(id) sender;
//- (void) pCallback15:(id) sender;

@end

/*
In CCMenu.m :

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if( state_ != kCCMenuStateWaiting || !visible_ )
		return NO;
	
	selectedItem_ = [self itemForTouch:touch];
	[selectedItem_ selected];
	
    
    CCMenuItem *currentItem = [self itemForTouch:touch];
    if (currentItem.tag > 1000) {
        //        NSLog(@"11111111111");
        [selectedItem_ activate];
        
    }
	if( selectedItem_ ) {
		state_ = kCCMenuStateTrackingTouch;
		return YES;
	}
	return NO;
}
*/