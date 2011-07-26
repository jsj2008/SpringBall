//
//  MenuLayer.m
//  BestJumps
//
//  Created by вадим on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "LevelScene1.h"

@implementation MenuLayer

+ (CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
    
	if( (self = [super init])) {
		
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"s_main_fon.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
        CCMenuItemImage* itemStart = [CCMenuItemImage itemFromNormalImage:@"s_start.png" selectedImage:@"s_start_activ.png" target:self selector:@selector(startBt)];
        itemStart.position = ccp(66, size.height / 2 - 10);

        CCMenuItemImage* itemHelp = [CCMenuItemImage itemFromNormalImage:@"s_help.png" selectedImage:@"s_help_activ.png" target:self selector:@selector(helpBt)];
        itemHelp.position = ccp(52, size.height / 2 - 80);

        CCMenuItemImage* itemSoundOn = [CCMenuItemImage itemFromNormalImage:@"s_sound_ON.png" selectedImage:@"s_sound_ON.png" target:nil selector:nil];
        CCMenuItemImage* itemSoundOff = [CCMenuItemImage itemFromNormalImage:@"s_sound_OFF.png" selectedImage:@"s_sound_OFF.png" target:nil selector:nil];
        CCMenuItemToggle* itemSound =  [CCMenuItemToggle itemWithTarget:self selector:@selector(soundBt:) items:itemSoundOn , itemSoundOff , nil];
        
        itemSound.position = ccp(30, size.height / 2 + 130);

        CCMenu* menu = [CCMenu menuWithItems:itemStart, itemHelp, itemSound, nil];
        menu.position = ccp(0,0);
        [self addChild: menu z:4];
        
    }
 
    return self;
}

- (void) startBt {
    
    [[CCDirector sharedDirector] replaceScene: [LevelScene1 scene]];
}

- (void) helpBt {
    
}

- (void) soundBt :(id) sender  {
    
    NSLog(@"item - %d", [sender selectedIndex]);
}

@end
