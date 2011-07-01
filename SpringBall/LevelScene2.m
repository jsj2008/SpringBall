//
//  LevelScene2.m
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

@implementation LevelScene2

+ (id) scene {

	CCScene *scene = [CCScene node];
	LevelScene2 *layer = [LevelScene2 node];
	[scene addChild: layer];
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = NO;

		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"u31.png" selectedImage:@"p31.png" target:self selector:@selector(pCallback1:)];
		CCMenuItemImage* item2 = [CCMenuItemImage itemFromNormalImage:@"u32.png" selectedImage:@"p32.png" target:self selector:@selector(pCallback2:)];
		CCMenuItemImage* item3 = [CCMenuItemImage itemFromNormalImage:@"u33.png" selectedImage:@"p33.png" target:self selector:@selector(pCallback3:)];
		CCMenuItemImage* item4 = [CCMenuItemImage itemFromNormalImage:@"u34.png" selectedImage:@"p34.png" target:self selector:@selector(pCallback4:)];
		CCMenuItemImage* item5 = [CCMenuItemImage itemFromNormalImage:@"u35.png" selectedImage:@"p35.png" target:self selector:@selector(pCallback5:)];
		CCMenuItemImage* item6 = [CCMenuItemImage itemFromNormalImage:@"u36.png" selectedImage:@"p36.png" target:self selector:@selector(pCallback6:)];
		CCMenuItemImage* item7 = [CCMenuItemImage itemFromNormalImage:@"u37.png" selectedImage:@"p37.png" target:self selector:@selector(pCallback7:)];
		CCMenuItemImage* item8 = [CCMenuItemImage itemFromNormalImage:@"u38.png" selectedImage:@"p38.png" target:self selector:@selector(pCallback8:)];
		CCMenuItemImage* item9 = [CCMenuItemImage itemFromNormalImage:@"u39.png" selectedImage:@"p39.png" target:self selector:@selector(pCallback9:)];
		CCMenuItemImage* item10 = [CCMenuItemImage itemFromNormalImage:@"u40.png" selectedImage:@"p40.png" target:self selector:@selector(pCallback10:)];
		CCMenuItemImage* item11 = [CCMenuItemImage itemFromNormalImage:@"u41.png" selectedImage:@"p41.png" target:self selector:@selector(pCallback11:)];
		CCMenuItemImage* item12 = [CCMenuItemImage itemFromNormalImage:@"u42.png" selectedImage:@"p42.png" target:self selector:@selector(pCallback12:)];
		CCMenuItemImage* item13 = [CCMenuItemImage itemFromNormalImage:@"u43.png" selectedImage:@"p43.png" target:self selector:@selector(pCallback13:)];
		CCMenuItemImage* item14 = [CCMenuItemImage itemFromNormalImage:@"u44.png" selectedImage:@"p44.png" target:self selector:@selector(pCallback14:)];
		CCMenuItemImage* item15 = [CCMenuItemImage itemFromNormalImage:@"u45.png" selectedImage:@"p45.png" target:self selector:@selector(pCallback15:)];
		CCMenuItemImage* item16 = [CCMenuItemImage itemFromNormalImage:@"u46.png" selectedImage:@"p46.png" target:self selector:@selector(pCallback16:)];
		CCMenuItemImage* item17 = [CCMenuItemImage itemFromNormalImage:@"u47.png" selectedImage:@"p47.png" target:self selector:@selector(pCallback17:)];
		CCMenuItemImage* item18 = [CCMenuItemImage itemFromNormalImage:@"u48.png" selectedImage:@"p48.png" target:self selector:@selector(pCallback18:)];
		CCMenuItemImage* item19 = [CCMenuItemImage itemFromNormalImage:@"u49.png" selectedImage:@"p49.png" target:self selector:@selector(pCallback19:)];
		CCMenuItemImage* item20 = [CCMenuItemImage itemFromNormalImage:@"u50.png" selectedImage:@"p50.png" target:self selector:@selector(pCallback20:)];
		CCMenuItemImage* item21 = [CCMenuItemImage itemFromNormalImage:@"u51.png" selectedImage:@"p51.png" target:self selector:@selector(pCallback21:)];
		CCMenuItemImage* item22 = [CCMenuItemImage itemFromNormalImage:@"u52.png" selectedImage:@"p52.png" target:self selector:@selector(pCallback22:)];
		CCMenuItemImage* item23 = [CCMenuItemImage itemFromNormalImage:@"u53.png" selectedImage:@"p53.png" target:self selector:@selector(pCallback23:)];
		CCMenuItemImage* item24 = [CCMenuItemImage itemFromNormalImage:@"u54.png" selectedImage:@"p54.png" target:self selector:@selector(pCallback24:)];
		CCMenuItemImage* item25 = [CCMenuItemImage itemFromNormalImage:@"u55.png" selectedImage:@"p55.png" target:self selector:@selector(pCallback25:)];
		CCMenuItemImage* item26 = [CCMenuItemImage itemFromNormalImage:@"u56.png" selectedImage:@"p56.png" target:self selector:@selector(pCallback26:)];
		CCMenuItemImage* item27 = [CCMenuItemImage itemFromNormalImage:@"u57.png" selectedImage:@"p57.png" target:self selector:@selector(pCallback27:)];
		CCMenuItemImage* item28 = [CCMenuItemImage itemFromNormalImage:@"u58.png" selectedImage:@"p58.png" target:self selector:@selector(pCallback28:)];
		CCMenuItemImage* item29 = [CCMenuItemImage itemFromNormalImage:@"u59.png" selectedImage:@"p59.png" target:self selector:@selector(pCallback29:)];
		CCMenuItemImage* item30 = [CCMenuItemImage itemFromNormalImage:@"u60.png" selectedImage:@"p60.png" target:self selector:@selector(pCallback30:)];

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
- (void) pCallback1:(id) sender { [Common instance].setlevel = 31; [self quit]; }
- (void) pCallback2:(id) sender { [Common instance].setlevel = 32; [self quit]; }
- (void) pCallback3:(id) sender { [Common instance].setlevel = 33; [self quit]; }
- (void) pCallback4:(id) sender { [Common instance].setlevel = 34; [self quit]; }
- (void) pCallback5:(id) sender { [Common instance].setlevel = 35; [self quit]; }
- (void) pCallback6:(id) sender { [Common instance].setlevel = 36; [self quit]; }
- (void) pCallback7:(id) sender { [Common instance].setlevel = 37; [self quit]; }
- (void) pCallback8:(id) sender { [Common instance].setlevel = 38; [self quit]; }
- (void) pCallback9:(id) sender { [Common instance].setlevel = 39; [self quit]; }
- (void) pCallback10:(id) sender { [Common instance].setlevel = 40; [self quit]; }
- (void) pCallback11:(id) sender { [Common instance].setlevel = 41; [self quit]; }
- (void) pCallback12:(id) sender { [Common instance].setlevel = 42; [self quit]; }
- (void) pCallback13:(id) sender { [Common instance].setlevel = 43; [self quit]; }
- (void) pCallback14:(id) sender { [Common instance].setlevel = 44; [self quit]; }
- (void) pCallback15:(id) sender { [Common instance].setlevel = 45; [self quit]; }
- (void) pCallback16:(id) sender { [Common instance].setlevel = 46; [self quit]; }
- (void) pCallback17:(id) sender { [Common instance].setlevel = 47; [self quit]; }
- (void) pCallback18:(id) sender { [Common instance].setlevel = 48; [self quit]; }
- (void) pCallback19:(id) sender { [Common instance].setlevel = 49; [self quit]; }
- (void) pCallback20:(id) sender { [Common instance].setlevel = 50; [self quit]; }
- (void) pCallback21:(id) sender { [Common instance].setlevel = 51; [self quit]; }
- (void) pCallback22:(id) sender { [Common instance].setlevel = 52; [self quit]; }
- (void) pCallback23:(id) sender { [Common instance].setlevel = 53; [self quit]; }
- (void) pCallback24:(id) sender { [Common instance].setlevel = 54; [self quit]; }
- (void) pCallback25:(id) sender { [Common instance].setlevel = 55; [self quit]; }
- (void) pCallback26:(id) sender { [Common instance].setlevel = 56; [self quit]; }
- (void) pCallback27:(id) sender { [Common instance].setlevel = 57; [self quit]; }
- (void) pCallback28:(id) sender { [Common instance].setlevel = 58; [self quit]; }
- (void) pCallback29:(id) sender { [Common instance].setlevel = 59; [self quit]; }
- (void) pCallback30:(id) sender { [Common instance].setlevel = 60; [self quit]; }

- (void) pCallback_left:(id) sender { [[CCDirector sharedDirector] replaceScene:[LevelScene1 scene]]; }
- (void) pCallback_right:(id) sender{ [[CCDirector sharedDirector] replaceScene:[LevelScene3 scene]]; }

- (void) quit {
	
	[[CCDirector sharedDirector] pushScene:[SpringScene scene]];	
}

@end
