//
//  HelpScene1.m
//  BestJumps
//
//  Created by naceka on 22.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelpScene1.h"
#import "HelpScene2.h"

@implementation HelpScene1

+ (id) scene {
    
	CCScene *scene = [CCScene node];
	HelpScene1 *layer = [HelpScene1 node];
	[scene addChild: layer];
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];

        CCSprite* bg = [CCSprite spriteWithFile:@"help_screen_1.jpg"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"next.png" selectedImage:@"next_activ.png" target:self selector:@selector(pCallback1:)];

		CCMenu* menu = [CCMenu menuWithItems:item1, nil];
		menu.position = ccp(0,0);
//		item1.position = ccp(size.width - 82, 59);	
        item1.position = ccp(550, 45);	
        [item1 runAction:[CCMoveTo actionWithDuration:0.4f position:ccp(size.width - 82, 59)]];
		
		[self addChild: menu z:500];
		
	}
	
	return self;
}

- (void) pCallback1:(id) sender {

//    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1.0f scene:[HelpScene2 scene]]];
    [[CCDirector sharedDirector] replaceScene:[HelpScene2 scene]];
}

@end
