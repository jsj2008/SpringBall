//
//  SeasonLayer.m
//  BestJumps
//
//  Created by вадим on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SeasonLayer.h"

@implementation SeasonLayer

+ (CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SeasonLayer *layer = [SeasonLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
    
	if( (self = [super init])) {
		
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* bg = [CCSprite spriteWithFile:@"fon_4seasons.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
             
        float e = size.height / 8;
        float f = size.height / 4;

        CCSprite* lck1 = [CCSprite spriteWithFile:@"locked_fil.png"];
        lck1.position = ccp(size.width / 2, f * 0 + e);
        lck1.visible = NO;
        [self addChild:lck1 z:5];
        
        CCSprite* lck2 = [CCSprite spriteWithFile:@"locked_fil.png"];
        lck2.position = ccp(size.width / 2, f * 1 + e);
        lck2.visible = NO;
        [self addChild:lck2 z:5];

        CCSprite* lck3 = [CCSprite spriteWithFile:@"locked_fil.png"];
        lck3.position = ccp(size.width / 2, f * 2 + e);
        lck3.visible = NO;
        [self addChild:lck3 z:5];

                
        CCMenuItemImage* itemSummer = [CCMenuItemImage itemFromNormalImage:@"button_summer.png" selectedImage:@"button_summer_activ.png" target:self selector:@selector(summerBt)];
        itemSummer.position = ccp(-77, f * 3 + e);
        [itemSummer runAction:[CCMoveTo actionWithDuration:0.4f position:ccp(77, f * 3 + e)]];

        CCMenuItemImage* itemAutumn = [CCMenuItemImage itemFromNormalImage:@"button_autumn.png" selectedImage:@"button_autumn_activ.png" target:self selector:@selector(autumnBt)];
        itemAutumn.position = ccp(-74, f * 2 + e);
        [itemAutumn runAction:[CCMoveTo actionWithDuration:0.2f position:ccp(74, f * 2 + e)]];
        
        CCMenuItemImage* itemWinter = [CCMenuItemImage itemFromNormalImage:@"button_winter.png" selectedImage:@"button_winter_activ.png" target:self selector:@selector(winterBt)];
        itemWinter.position = ccp(-68, f * 1 + e);
        [itemWinter runAction:[CCMoveTo actionWithDuration:0.5f position:ccp(68, f * 1 + e)]];

        CCMenuItemImage* itemSpring = [CCMenuItemImage itemFromNormalImage:@"button_spring.png" selectedImage:@"button_spring_activ.png" target:self selector:@selector(springBt)];
        itemSpring.position = ccp(-69, f * 0 + e);
        [itemSpring runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(69, f * 0 + e)]];

        int t = [[NSUserDefaults standardUserDefaults] integerForKey:@"openSeason"];
        //        [[NSUserDefaults standardUserDefaults] setBool:b forKey:@"onlyWiFi"];
        
        switch (t) {
            case 0:
                itemAutumn.visible = NO;
                lck3.visible = YES;
            case 1:
                itemWinter.visible = NO;
                lck2.visible = YES;
            case 2:
                itemSpring.visible = NO;
                lck1.visible = YES;
        }
        
        CCMenu* menu = [CCMenu menuWithItems:itemSummer, itemAutumn, itemWinter, itemSpring, nil];
        menu.position = ccp(0,0);
        [self addChild: menu];
    }
    
    return self;
}

- (void) summerBt {
    
}

- (void) autumnBt {
    
}

- (void) winterBt {
    
}

- (void) springBt {
    
}

@end
