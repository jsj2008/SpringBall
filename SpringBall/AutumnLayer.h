//
//  SummerLayer.h
//  BestJumps
//
//  Created by naceka on 13.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Common.h"

@interface AutumnLayer : CCLayer {
    
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

@end
