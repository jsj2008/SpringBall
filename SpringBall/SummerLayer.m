//
//  SummerLayer.m
//  BestJumps
//
//  Created by naceka on 13.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SummerLayer.h"


@implementation SummerLayer

+ (CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SummerLayer *layer = [SummerLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
    
	if( (self = [super init])) {
		
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* bg = [CCSprite spriteWithFile:@"fon_summer.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
    
        CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"1.png" selectedImage:@"1_activ.png" target:self selector:@selector(pCallback1:)];
		CCMenu* menu = [CCMenu menuWithItems:item1, /*item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15,*/ nil];
		//menu.visible = NO;
		menu.position = ccp(0,0);
        
        float ey = size.height / 6;
        float fy = size.height / 3;
        float ex = size.width / 10;
        float fx = size.width / 5;
        
        item1.position = ccp(fx * 0 + ex, fy * 2 + ey);
//        item1.position = ccp(100, 100);
        
        [self addChild:menu];
    }
    
    return self;
}

- (void) pCallback1:(id) sender {
    
    NSLog(@"Click!");
}

@end
