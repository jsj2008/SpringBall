//
//  HelpScene1.m
//  BestJumps
//
//  Created by naceka on 22.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelpScene2.h"
#import "MenuLayer.h"

@implementation HelpScene2

+ (id) scene {
    
	CCScene *scene = [CCScene node];
	HelpScene2 *layer = [HelpScene2 node];
	[scene addChild: layer];
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"help_screen_2.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"menu.png" selectedImage:@"menu_activ.png" target:self selector:@selector(pCallback1:)];
        
		CCMenu* menu = [CCMenu menuWithItems:item1, nil];
		menu.position = ccp(0,0);
		item1.position = ccp(size.width - 82, 59);	
		
		[self addChild: menu z:500];
		
	}
	
	return self;
}

- (void) pCallback1:(id) sender {
    
    [[CCDirector sharedDirector] replaceScene:[MenuLayer scene]];
}

@end
