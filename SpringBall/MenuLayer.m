//
//  MenuLayer.m
//  BestJumps
//
//  Created by вадим on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
//#import "LevelScene1.h"
#import "HelpScene1.h"
#import "SeasonLayer.h"

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
        bg.position = ccp(size.width/2 - 69, size.height/2 - 7);
        [self addChild:bg z:0];
        [bg runAction:[CCScaleTo actionWithDuration:0.7f scale:0.83f]];
        [bg runAction:[CCSequence actions:[CCMoveTo actionWithDuration:0.7f position:ccp(size.width/2 + 10, size.height/2)], [CCCallFuncN actionWithTarget:self selector:@selector(init1)], nil]];
        
        
    }
 
    return self;
}

- (void) init1 {

    CGSize size = [[CCDirector sharedDirector] winSize];
    CCMenuItemImage* itemStart = [CCMenuItemImage itemFromNormalImage:@"s_start.png" selectedImage:@"s_start_activ.png" target:self selector:@selector(startBt)];
    itemStart.position = ccp(-66, size.height / 2 - 0);
    [itemStart runAction:[CCMoveTo actionWithDuration:0.2f position:ccp(66, size.height / 2 - 0)]];
    
    CCMenuItemImage* itemHelp = [CCMenuItemImage itemFromNormalImage:@"s_help.png" selectedImage:@"s_help_activ.png" target:self selector:@selector(helpBt)];
    itemHelp.position = ccp(-52, size.height / 2 - 0);
    [itemHelp runAction:[CCMoveTo actionWithDuration:0.35f position:ccp(52, size.height / 2 - 60)]];
    
    CCMenuItemImage* itemScore = [CCMenuItemImage itemFromNormalImage:@"s_score.png" selectedImage:@"s_score_activ.png" target:self selector:@selector(scoreBt)];
    itemScore.position = ccp(-55, size.height / 2 - 230);
    [itemScore runAction:[CCMoveTo actionWithDuration:0.5f position:ccp(55, size.height / 2 - 130)]];
    
    CCMenuItemImage* itemSoundOn = [CCMenuItemImage itemFromNormalImage:@"s_sound_ON.png" selectedImage:@"s_sound_ON.png" target:nil selector:nil];
    CCMenuItemImage* itemSoundOff = [CCMenuItemImage itemFromNormalImage:@"s_sound_OFF.png" selectedImage:@"s_sound_OFF.png" target:nil selector:nil];
    CCMenuItemToggle* itemSound =  [CCMenuItemToggle itemWithTarget:self selector:@selector(soundBt:) items:itemSoundOn , itemSoundOff , nil];
    
    itemSound.position = ccp(30, size.height / 2 + 130);
    
    CCMenu* menu = [CCMenu menuWithItems:itemStart, itemHelp, itemScore, itemSound, nil];
    menu.position = ccp(0,0);
    [self addChild: menu z:4];
}

- (void) startBt {
    
//    [[CCDirector sharedDirector] replaceScene: [LevelScene1 scene]];
    [[CCDirector sharedDirector] replaceScene: [SeasonLayer scene]];
}

- (void) helpBt {
  
//    [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1.0f scene:[HelpScene1 scene]]];
    [[CCDirector sharedDirector] replaceScene:[HelpScene1 scene]];
}

- (void) scoreBt {
    
}

- (void) soundBt :(id) sender  {
    
    NSLog(@"item - %d", [sender selectedIndex]);
}

@end
