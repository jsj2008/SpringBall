//
//  LevelScene3.m
//  Springs
//
//  Created by вадим on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LevelScene1.h"
#import "LevelScene2.h"
#import "LevelScene3.h"

#import "Common.h"

#import "SpringScene.h"

@implementation LevelScene3

+ (id) scene {

	CCScene *scene = [CCScene node];
	LevelScene3 *layer = [LevelScene3 node];
	[scene addChild: layer];
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = NO;

		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"u61.png" selectedImage:@"p61.png" target:self selector:@selector(pCallback1:)];
		CCMenuItemImage* item2 = [CCMenuItemImage itemFromNormalImage:@"u62.png" selectedImage:@"p62.png" target:self selector:@selector(pCallback2:)];
		CCMenuItemImage* item3 = [CCMenuItemImage itemFromNormalImage:@"u63.png" selectedImage:@"p63.png" target:self selector:@selector(pCallback3:)];
		CCMenuItemImage* item4 = [CCMenuItemImage itemFromNormalImage:@"u64.png" selectedImage:@"p64.png" target:self selector:@selector(pCallback4:)];
		CCMenuItemImage* item5 = [CCMenuItemImage itemFromNormalImage:@"u65.png" selectedImage:@"p65.png" target:self selector:@selector(pCallback5:)];
		CCMenuItemImage* item6 = [CCMenuItemImage itemFromNormalImage:@"u66.png" selectedImage:@"p66.png" target:self selector:@selector(pCallback6:)];
		CCMenuItemImage* item7 = [CCMenuItemImage itemFromNormalImage:@"u67.png" selectedImage:@"p67.png" target:self selector:@selector(pCallback7:)];
		CCMenuItemImage* item8 = [CCMenuItemImage itemFromNormalImage:@"u68.png" selectedImage:@"p68.png" target:self selector:@selector(pCallback8:)];
		CCMenuItemImage* item9 = [CCMenuItemImage itemFromNormalImage:@"u69.png" selectedImage:@"p69.png" target:self selector:@selector(pCallback9:)];
		CCMenuItemImage* item10 = [CCMenuItemImage itemFromNormalImage:@"u70.png" selectedImage:@"p70.png" target:self selector:@selector(pCallback10:)];
		CCMenuItemImage* item11 = [CCMenuItemImage itemFromNormalImage:@"u71.png" selectedImage:@"p71.png" target:self selector:@selector(pCallback11:)];
		CCMenuItemImage* item12 = [CCMenuItemImage itemFromNormalImage:@"u72.png" selectedImage:@"p72.png" target:self selector:@selector(pCallback12:)];
		CCMenuItemImage* item13 = [CCMenuItemImage itemFromNormalImage:@"u73.png" selectedImage:@"p73.png" target:self selector:@selector(pCallback13:)];
		CCMenuItemImage* item14 = [CCMenuItemImage itemFromNormalImage:@"u74.png" selectedImage:@"p74.png" target:self selector:@selector(pCallback14:)];
		CCMenuItemImage* item15 = [CCMenuItemImage itemFromNormalImage:@"u75.png" selectedImage:@"p75.png" target:self selector:@selector(pCallback15:)];
		CCMenuItemImage* item16 = [CCMenuItemImage itemFromNormalImage:@"u76.png" selectedImage:@"p76.png" target:self selector:@selector(pCallback16:)];
		CCMenuItemImage* item17 = [CCMenuItemImage itemFromNormalImage:@"u77.png" selectedImage:@"p77.png" target:self selector:@selector(pCallback17:)];
		CCMenuItemImage* item18 = [CCMenuItemImage itemFromNormalImage:@"u78.png" selectedImage:@"p78.png" target:self selector:@selector(pCallback18:)];
		CCMenuItemImage* item19 = [CCMenuItemImage itemFromNormalImage:@"u79.png" selectedImage:@"p79.png" target:self selector:@selector(pCallback19:)];
		CCMenuItemImage* item20 = [CCMenuItemImage itemFromNormalImage:@"u80.png" selectedImage:@"p80.png" target:self selector:@selector(pCallback20:)];
		CCMenuItemImage* item21 = [CCMenuItemImage itemFromNormalImage:@"u81.png" selectedImage:@"p81.png" target:self selector:@selector(pCallback21:)];
		CCMenuItemImage* item22 = [CCMenuItemImage itemFromNormalImage:@"u82.png" selectedImage:@"p82.png" target:self selector:@selector(pCallback22:)];
		CCMenuItemImage* item23 = [CCMenuItemImage itemFromNormalImage:@"u83.png" selectedImage:@"p83.png" target:self selector:@selector(pCallback23:)];
		CCMenuItemImage* item24 = [CCMenuItemImage itemFromNormalImage:@"u84.png" selectedImage:@"p84.png" target:self selector:@selector(pCallback24:)];
		CCMenuItemImage* item25 = [CCMenuItemImage itemFromNormalImage:@"u85.png" selectedImage:@"p85.png" target:self selector:@selector(pCallback25:)];
		CCMenuItemImage* item26 = [CCMenuItemImage itemFromNormalImage:@"u86.png" selectedImage:@"p86.png" target:self selector:@selector(pCallback26:)];
		CCMenuItemImage* item27 = [CCMenuItemImage itemFromNormalImage:@"u87.png" selectedImage:@"p87.png" target:self selector:@selector(pCallback27:)];
		CCMenuItemImage* item28 = [CCMenuItemImage itemFromNormalImage:@"u88.png" selectedImage:@"p88.png" target:self selector:@selector(pCallback28:)];
		CCMenuItemImage* item29 = [CCMenuItemImage itemFromNormalImage:@"u89.png" selectedImage:@"p89.png" target:self selector:@selector(pCallback29:)];
		CCMenuItemImage* item30 = [CCMenuItemImage itemFromNormalImage:@"u90.png" selectedImage:@"p90.png" target:self selector:@selector(pCallback30:)];

		CCMenuItemImage* arrow_left = [CCMenuItemImage itemFromNormalImage:@"arrow_left.png" selectedImage:@"arrow_left.png" target:self selector:@selector(pCallback_left:)];
		CCMenuItemImage* arrow_right = [CCMenuItemImage itemFromNormalImage:@"arrow_right.png" selectedImage:@"arrow_right.png" target:self selector:@selector(pCallback_right:)];
		menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25, item26, item27, item28, item29, item30, arrow_left, arrow_right, nil];
		//menu.visible = NO;
		menu.position = ccp(0,0);
		item1.position = ccp(50, 297);	
		item2.position = ccp(143, 297);	
		item3.position = ccp(236, 297);	
		item4.position = ccp(329, 297);	
		item5.position = ccp(422, 297);	
		item6.position = ccp(50, 249);	
		item7.position = ccp(143, 249);	
		item8.position = ccp(236, 249);	
		item9.position = ccp(329, 249);	
		item10.position = ccp(422, 249);	
		item11.position = ccp(50, 201);	
		item12.position = ccp(143, 201);	
		item13.position = ccp(236, 201);	
		item14.position = ccp(329, 201);	
		item15.position = ccp(422, 201);	
		item16.position = ccp(50, 153);	
		item17.position = ccp(143, 153);	
		item18.position = ccp(236, 153);	
		item19.position = ccp(329, 153);	
		item20.position = ccp(422, 153);	
		item21.position = ccp(50, 105);	
		item22.position = ccp(143, 105);	
		item23.position = ccp(236, 105);	
		item24.position = ccp(329, 105);	
		item25.position = ccp(422, 105);	
		item26.position = ccp(50, 57);	
		item27.position = ccp(143, 57);	
		item28.position = ccp(236, 57);	
		item29.position = ccp(329, 57);	
		item30.position = ccp(422, 57);	
		
		arrow_left.position = ccp(50, 17);	
		arrow_right.position = ccp(422, 17);	
		
		[self addChild: menu z:500];
		
	}
	
	return self;
}
- (void) pCallback1:(id) sender { [Common instance].setlevel = 61; [self quit]; }
- (void) pCallback2:(id) sender { [Common instance].setlevel = 62; [self quit]; }
- (void) pCallback3:(id) sender { [Common instance].setlevel = 63; [self quit]; }
- (void) pCallback4:(id) sender { [Common instance].setlevel = 64; [self quit]; }
- (void) pCallback5:(id) sender { [Common instance].setlevel = 65; [self quit]; }
- (void) pCallback6:(id) sender { [Common instance].setlevel = 66; [self quit]; }
- (void) pCallback7:(id) sender { [Common instance].setlevel = 67; [self quit]; }
- (void) pCallback8:(id) sender { [Common instance].setlevel = 68; [self quit]; }
- (void) pCallback9:(id) sender { [Common instance].setlevel = 69; [self quit]; }
- (void) pCallback10:(id) sender { [Common instance].setlevel = 70; [self quit]; }
- (void) pCallback11:(id) sender { [Common instance].setlevel = 71; [self quit]; }
- (void) pCallback12:(id) sender { [Common instance].setlevel = 72; [self quit]; }
- (void) pCallback13:(id) sender { [Common instance].setlevel = 73; [self quit]; }
- (void) pCallback14:(id) sender { [Common instance].setlevel = 74; [self quit]; }
- (void) pCallback15:(id) sender { [Common instance].setlevel = 75; [self quit]; }
- (void) pCallback16:(id) sender { [Common instance].setlevel = 76; [self quit]; }
- (void) pCallback17:(id) sender { [Common instance].setlevel = 77; [self quit]; }
- (void) pCallback18:(id) sender { [Common instance].setlevel = 78; [self quit]; }
- (void) pCallback19:(id) sender { [Common instance].setlevel = 79; [self quit]; }
- (void) pCallback20:(id) sender { [Common instance].setlevel = 80; [self quit]; }
- (void) pCallback21:(id) sender { [Common instance].setlevel = 81; [self quit]; }
- (void) pCallback22:(id) sender { [Common instance].setlevel = 82; [self quit]; }
- (void) pCallback23:(id) sender { [Common instance].setlevel = 83; [self quit]; }
- (void) pCallback24:(id) sender { [Common instance].setlevel = 84; [self quit]; }
- (void) pCallback25:(id) sender { [Common instance].setlevel = 85; [self quit]; }
- (void) pCallback26:(id) sender { [Common instance].setlevel = 86; [self quit]; }
- (void) pCallback27:(id) sender { [Common instance].setlevel = 87; [self quit]; }
- (void) pCallback28:(id) sender { [Common instance].setlevel = 88; [self quit]; }
- (void) pCallback29:(id) sender { [Common instance].setlevel = 89; [self quit]; }
- (void) pCallback30:(id) sender { [Common instance].setlevel = 90; [self quit]; }

- (void) pCallback_left:(id) sender { [[CCDirector sharedDirector] replaceScene:[LevelScene2 scene]]; }
- (void) pCallback_right:(id) sender{ [[CCDirector sharedDirector] replaceScene:[LevelScene1 scene]]; }

- (void) quit {
	
	[[CCDirector sharedDirector] pushScene:[SpringScene scene]];	
}

@end
