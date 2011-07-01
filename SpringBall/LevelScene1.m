//
//  LevelScene1.m
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

@implementation LevelScene1

+ (id) scene {

	CCScene *scene = [CCScene node];
	LevelScene1 *layer = [LevelScene1 node];
	[scene addChild: layer];
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = NO;

		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"u1.png" selectedImage:@"p1.png" target:self selector:@selector(pCallback1:)];
		CCMenuItemImage* item2 = [CCMenuItemImage itemFromNormalImage:@"u2.png" selectedImage:@"p2.png" target:self selector:@selector(pCallback2:)];
		CCMenuItemImage* item3 = [CCMenuItemImage itemFromNormalImage:@"u3.png" selectedImage:@"p3.png" target:self selector:@selector(pCallback3:)];
		CCMenuItemImage* item4 = [CCMenuItemImage itemFromNormalImage:@"u4.png" selectedImage:@"p4.png" target:self selector:@selector(pCallback4:)];
		CCMenuItemImage* item5 = [CCMenuItemImage itemFromNormalImage:@"u5.png" selectedImage:@"p5.png" target:self selector:@selector(pCallback5:)];
		CCMenuItemImage* item6 = [CCMenuItemImage itemFromNormalImage:@"u6.png" selectedImage:@"p6.png" target:self selector:@selector(pCallback6:)];
		CCMenuItemImage* item7 = [CCMenuItemImage itemFromNormalImage:@"u7.png" selectedImage:@"p7.png" target:self selector:@selector(pCallback7:)];
		CCMenuItemImage* item8 = [CCMenuItemImage itemFromNormalImage:@"u8.png" selectedImage:@"p8.png" target:self selector:@selector(pCallback8:)];
		CCMenuItemImage* item9 = [CCMenuItemImage itemFromNormalImage:@"u9.png" selectedImage:@"p9.png" target:self selector:@selector(pCallback9:)];
		CCMenuItemImage* item10 = [CCMenuItemImage itemFromNormalImage:@"u10.png" selectedImage:@"p10.png" target:self selector:@selector(pCallback10:)];
		CCMenuItemImage* item11 = [CCMenuItemImage itemFromNormalImage:@"u11.png" selectedImage:@"p11.png" target:self selector:@selector(pCallback11:)];
		CCMenuItemImage* item12 = [CCMenuItemImage itemFromNormalImage:@"u12.png" selectedImage:@"p12.png" target:self selector:@selector(pCallback12:)];
		CCMenuItemImage* item13 = [CCMenuItemImage itemFromNormalImage:@"u13.png" selectedImage:@"p13.png" target:self selector:@selector(pCallback13:)];
		CCMenuItemImage* item14 = [CCMenuItemImage itemFromNormalImage:@"u14.png" selectedImage:@"p14.png" target:self selector:@selector(pCallback14:)];
		CCMenuItemImage* item15 = [CCMenuItemImage itemFromNormalImage:@"u15.png" selectedImage:@"p15.png" target:self selector:@selector(pCallback15:)];
		CCMenuItemImage* item16 = [CCMenuItemImage itemFromNormalImage:@"u16.png" selectedImage:@"p16.png" target:self selector:@selector(pCallback16:)];
		CCMenuItemImage* item17 = [CCMenuItemImage itemFromNormalImage:@"u17.png" selectedImage:@"p17.png" target:self selector:@selector(pCallback17:)];
		CCMenuItemImage* item18 = [CCMenuItemImage itemFromNormalImage:@"u18.png" selectedImage:@"p18.png" target:self selector:@selector(pCallback18:)];
		CCMenuItemImage* item19 = [CCMenuItemImage itemFromNormalImage:@"u19.png" selectedImage:@"p19.png" target:self selector:@selector(pCallback19:)];
		CCMenuItemImage* item20 = [CCMenuItemImage itemFromNormalImage:@"u20.png" selectedImage:@"p20.png" target:self selector:@selector(pCallback20:)];
		CCMenuItemImage* item21 = [CCMenuItemImage itemFromNormalImage:@"u21.png" selectedImage:@"p21.png" target:self selector:@selector(pCallback21:)];
		CCMenuItemImage* item22 = [CCMenuItemImage itemFromNormalImage:@"u22.png" selectedImage:@"p22.png" target:self selector:@selector(pCallback22:)];
		CCMenuItemImage* item23 = [CCMenuItemImage itemFromNormalImage:@"u23.png" selectedImage:@"p23.png" target:self selector:@selector(pCallback23:)];
		CCMenuItemImage* item24 = [CCMenuItemImage itemFromNormalImage:@"u24.png" selectedImage:@"p24.png" target:self selector:@selector(pCallback24:)];
		CCMenuItemImage* item25 = [CCMenuItemImage itemFromNormalImage:@"u25.png" selectedImage:@"p25.png" target:self selector:@selector(pCallback25:)];
		CCMenuItemImage* item26 = [CCMenuItemImage itemFromNormalImage:@"u26.png" selectedImage:@"p26.png" target:self selector:@selector(pCallback26:)];
		CCMenuItemImage* item27 = [CCMenuItemImage itemFromNormalImage:@"u27.png" selectedImage:@"p27.png" target:self selector:@selector(pCallback27:)];
		CCMenuItemImage* item28 = [CCMenuItemImage itemFromNormalImage:@"u28.png" selectedImage:@"p28.png" target:self selector:@selector(pCallback28:)];
		CCMenuItemImage* item29 = [CCMenuItemImage itemFromNormalImage:@"u29.png" selectedImage:@"p29.png" target:self selector:@selector(pCallback29:)];
		CCMenuItemImage* item30 = [CCMenuItemImage itemFromNormalImage:@"u30.png" selectedImage:@"p30.png" target:self selector:@selector(pCallback30:)];

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
- (void) pCallback1:(id) sender { [Common instance].setlevel = 1; [self quit]; }
- (void) pCallback2:(id) sender { [Common instance].setlevel = 2; [self quit]; }
- (void) pCallback3:(id) sender { [Common instance].setlevel = 3; [self quit]; }
- (void) pCallback4:(id) sender { [Common instance].setlevel = 4; [self quit]; }
- (void) pCallback5:(id) sender { [Common instance].setlevel = 5; [self quit]; }
- (void) pCallback6:(id) sender { [Common instance].setlevel = 6; [self quit]; }
- (void) pCallback7:(id) sender { [Common instance].setlevel = 7; [self quit]; }
- (void) pCallback8:(id) sender { [Common instance].setlevel = 8; [self quit]; }
- (void) pCallback9:(id) sender { [Common instance].setlevel = 9; [self quit]; }
- (void) pCallback10:(id) sender { [Common instance].setlevel = 10; [self quit]; }
- (void) pCallback11:(id) sender { [Common instance].setlevel = 11; [self quit]; }
- (void) pCallback12:(id) sender { [Common instance].setlevel = 12; [self quit]; }
- (void) pCallback13:(id) sender { [Common instance].setlevel = 13; [self quit]; }
- (void) pCallback14:(id) sender { [Common instance].setlevel = 14; [self quit]; }
- (void) pCallback15:(id) sender { [Common instance].setlevel = 15; [self quit]; }
- (void) pCallback16:(id) sender { [Common instance].setlevel = 16; [self quit]; }
- (void) pCallback17:(id) sender { [Common instance].setlevel = 17; [self quit]; }
- (void) pCallback18:(id) sender { [Common instance].setlevel = 18; [self quit]; }
- (void) pCallback19:(id) sender { [Common instance].setlevel = 19; [self quit]; }
- (void) pCallback20:(id) sender { [Common instance].setlevel = 20; [self quit]; }
- (void) pCallback21:(id) sender { [Common instance].setlevel = 21; [self quit]; }
- (void) pCallback22:(id) sender { [Common instance].setlevel = 22; [self quit]; }
- (void) pCallback23:(id) sender { [Common instance].setlevel = 23; [self quit]; }
- (void) pCallback24:(id) sender { [Common instance].setlevel = 24; [self quit]; }
- (void) pCallback25:(id) sender { [Common instance].setlevel = 25; [self quit]; }
- (void) pCallback26:(id) sender { [Common instance].setlevel = 26; [self quit]; }
- (void) pCallback27:(id) sender { [Common instance].setlevel = 27; [self quit]; }
- (void) pCallback28:(id) sender { [Common instance].setlevel = 28; [self quit]; }
- (void) pCallback29:(id) sender { [Common instance].setlevel = 29; [self quit]; }
- (void) pCallback30:(id) sender { [Common instance].setlevel = 30; [self quit]; }

- (void) pCallback_left:(id) sender { [[CCDirector sharedDirector] replaceScene:[LevelScene3 scene]]; }
- (void) pCallback_right:(id) sender{ [[CCDirector sharedDirector] replaceScene:[LevelScene2 scene]]; }

- (void) quit {
	
	[[CCDirector sharedDirector] pushScene:[SpringScene scene]];	
}

@end
