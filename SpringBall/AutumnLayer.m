//
//  SummerLayer.m
//  BestJumps
//
//  Created by naceka on 13.10.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutumnLayer.h"
#import "SpringScene.h"

@implementation AutumnLayer

+ (CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AutumnLayer *layer = [AutumnLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
    
	if( (self = [super init])) {
		
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        ey = size.height / 6;
        fy = size.height / 3;
        ex = size.width / 10;
        fx = size.width / 5;
        
        CCSprite* bg = [CCSprite spriteWithFile:@"fon_autumn.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];
        
        ia1 = [CCSprite spriteWithFile:@"gazon_autumn_activ.png"];
        ia1.visible = NO;
        [self addChild:ia1 z:1];
        
        CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"1.png" selectedImage:@"1_activ.png" target:self selector:@selector(pCallback1:)];
        item1.tag = 2000;
        item1.position = ccp(fx * 0 + ex, fy * 2 + ey);
        
        CCMenuItemImage* item2 = [CCMenuItemImage itemFromNormalImage:@"2.png" selectedImage:@"2_activ.png" target:self selector:@selector(pCallback1:)];
        item2.tag = 2001;
        item2.position = ccp(fx * 1 + ex, fy * 2 + ey);
        
        CCMenuItemImage* item3 = [CCMenuItemImage itemFromNormalImage:@"3.png" selectedImage:@"3_activ.png" target:self selector:@selector(pCallback1:)];
        item3.tag = 2002;
        item3.position = ccp(fx * 2 + ex, fy * 2 + ey);
        
        CCMenuItemImage* item4 = [CCMenuItemImage itemFromNormalImage:@"4.png" selectedImage:@"4_activ.png" target:self selector:@selector(pCallback1:)];
        item4.tag = 2003;
        item4.position = ccp(fx * 3 + ex, fy * 2 + ey);
        
        CCMenuItemImage* item5 = [CCMenuItemImage itemFromNormalImage:@"5.png" selectedImage:@"5_activ.png" target:self selector:@selector(pCallback1:)];
        item5.tag = 2004;
        item5.position = ccp(fx * 4 + ex, fy * 2 + ey);
        
        CCMenuItemImage* item6 = [CCMenuItemImage itemFromNormalImage:@"6.png" selectedImage:@"6_activ.png" target:self selector:@selector(pCallback1:)];
        item6.tag = 2005;
        item6.position = ccp(fx * 0 + ex, fy * 1 + ey);
        
        CCMenuItemImage* item7 = [CCMenuItemImage itemFromNormalImage:@"7.png" selectedImage:@"7_activ.png" target:self selector:@selector(pCallback1:)];
        item7.tag = 2006;
        item7.position = ccp(fx * 1 + ex, fy * 1 + ey);
        
        CCMenuItemImage* item8 = [CCMenuItemImage itemFromNormalImage:@"8.png" selectedImage:@"8_activ.png" target:self selector:@selector(pCallback1:)];
        item8.tag = 2007;
        item8.position = ccp(fx * 2 + ex, fy * 1 + ey);
        
        CCMenuItemImage* item9 = [CCMenuItemImage itemFromNormalImage:@"9.png" selectedImage:@"9_activ.png" target:self selector:@selector(pCallback1:)];
        item9.tag = 2008;
        item9.position = ccp(fx * 3 + ex, fy * 1 + ey);
        
        CCMenuItemImage* item10 = [CCMenuItemImage itemFromNormalImage:@"10.png" selectedImage:@"10_activ.png" target:self selector:@selector(pCallback1:)];
        item10.tag = 2009;
        item10.position = ccp(fx * 4 + ex, fy * 1 + ey);
        
        CCMenuItemImage* item11 = [CCMenuItemImage itemFromNormalImage:@"11.png" selectedImage:@"11_activ.png" target:self selector:@selector(pCallback1:)];
        item11.tag = 2010;
        item11.position = ccp(fx * 0 + ex, fy * 0 + ey);
        
        CCMenuItemImage* item12 = [CCMenuItemImage itemFromNormalImage:@"12.png" selectedImage:@"12_activ.png" target:self selector:@selector(pCallback1:)];
        item12.tag = 2011;
        item12.position = ccp(fx * 1 + ex, fy * 0 + ey);
        
        CCMenuItemImage* item13 = [CCMenuItemImage itemFromNormalImage:@"13.png" selectedImage:@"13_activ.png" target:self selector:@selector(pCallback1:)];
        item13.tag = 2012;
        item13.position = ccp(fx * 2 + ex, fy * 0 + ey);
        
        CCMenuItemImage* item14 = [CCMenuItemImage itemFromNormalImage:@"14.png" selectedImage:@"14_activ.png" target:self selector:@selector(pCallback1:)];
        item14.tag = 2013;
        item14.position = ccp(fx * 3 + ex, fy * 0 + ey);
        
        CCMenuItemImage* item15 = [CCMenuItemImage itemFromNormalImage:@"15.png" selectedImage:@"15_activ.png" target:self selector:@selector(pCallback1:)];
        item15.tag = 2014;
        item15.position = ccp(fx * 4 + ex, fy * 0 + ey);
        
		CCMenu* menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, nil];
		//menu.visible = NO;
		menu.position = ccp(0,0);
        
        
        [self addChild:menu];
        
        
        //        NSLog(@"--- %f, %f, %f", (double)(0%5), (double)(1%5), (double)(7%5));
        
        for (int i = 0; i< SEASON_LEVELS_CNT; i++) {
            
            gazons[i] = [CCSprite spriteWithFile:@"gazon_autumn.png"];
            gazons[i].position = ccp(fx * (i%5) + ex, fy * (2-i/5) + ey);
            gazons[i].tag = ITEM_TAG + 1000 + i;
            [self addChild:gazons[i] z:1];
            
        }
        
        click = NO;
        
    }
    
    return self;
}

- (void) pCallback1:(id) sender {
    
    //    NSLog(@"Click!");
    
    int t = ((CCNode*)sender).tag;
    //    NSLog(@"tag = %d", t);
    
    int i = t - ITEM_TAG;
    
    if(!click){
        
        ia1.position = ccp(fx * (i%5) + ex, fy * (2-i/5) + ey);
        ia1.visible = YES;
        gazons[i].visible = NO;
    }
    else {
        
        ia1.visible = NO;
        gazons[i].visible = YES;
        
        [Common instance].setlevel = (i+1 + 15);
        [[CCDirector sharedDirector] pushScene:[SpringScene scene]];

    }
    
    click = !click;
    
}

@end
