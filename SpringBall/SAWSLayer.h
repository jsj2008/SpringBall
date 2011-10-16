//
//  SAWSLayer.h
//  BestJumps
//
//  Created by naceka on 14.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Common.h"


@interface SAWSLayer : CCLayer {
    
    BOOL click;
    CCSprite* gazons[SEASON_LEVELS_CNT];
    float ey;
    float fy;
    float ex;
    float fx;
    CCSprite* ia1;
    NSString* fon;
    NSString* gazon_activ;
    NSString* gazon;
    int level_add;
    int clic;
}

+ (CCScene *) scene;

- (void) pCallback1:(id) sender;
- (void) pBack:(id) sender;

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
 
 
 
 -(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
 {
 NSAssert(state_ == kCCMenuStateTrackingTouch, @"[Menu ccTouchMoved] -- invalid state");
 
 //	CCMenuItem *currentItem = [self itemForTouch:touch];
 
 //	if (currentItem != selectedItem_) {
 //		[selectedItem_ unselected];
 //		selectedItem_ = currentItem;
 //		[selectedItem_ selected];
 //	}
 }

 */