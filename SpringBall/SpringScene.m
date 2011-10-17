//
//  SpringScene.m
//  Springs
//
//  Created by вадим on 1/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleAudioEngine.h"
#import "SpringScene.h"

static 	Ball* ball[MAX_BALLS_NUM];

static int beginWindBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 1;
}

static int presolveWindBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Wind* w = a->data;
	Ball* ba = b->data;
	[ba windon:w];
	return 0;
}

static void postsolveWindBall(cpArbiter* arb, cpSpace* space, void* ignore) {
}

static void separateWindBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba windoff];
}

static int presolveArrowBall(cpArbiter* arb, cpSpace* space, void* ignore) {

	CP_ARBITER_GET_SHAPES(arb, a, b);
	Arrow* w = a->data;
	[[Common instance] setGravityAngle:w.angle];
	for(int i = 0; i < ls->ballsnum; i++)
		[ball[i] changeGravity];
	return 0;
}

//--------------
static int presolveStarBall(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int beginStarBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Star* s = a->data;
	[s act];
	return 0;
}

//--------------
static int presolveHyperBall(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int beginHyperBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba setHyper];
	return 0;
}
static void separateHyperBall(cpArbiter* arb, cpSpace* space, void* ignore) { }
//--------------
static int beginPitstopBall(cpArbiter* arb, cpSpace* space, void* ignore) {

	CP_ARBITER_GET_SHAPES(arb, a, b);
//	cpBody* body1 = a->body;
//	cpBody* body2 = b->body;
	MassBody* mb = a->data;
	Ball* ba = b->data;
	[ba hangon:mb];
	return 0;
}

static int presolvePitstopBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveBallBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolvePitPit(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolvePitWall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveWallBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	if(a->u >= 1.0f)
		return 1;
	Ball* ba = b->data;
	[ba w_friction];
	return 1;
}

static int presolvePlatformBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba w_friction];
	return 1;
}
static int presolvePlatformBall1(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba w_friction];
	return 1;
}


static int presolveShadowWall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveShadowBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveShadowWind(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveWindWind(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveWallWind(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveShadowPitstop(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveSpikeBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba die];
	return 0;
}

static int presolveSpikeSpike(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int presolveSpikeWall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int beginRepelBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Repel* r = a->data;
//	Ball* ba = b->data;
	[r ballon];
	return 1;
}

static int presolveRepelBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 1;
}

static void separateRepelBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Repel* r = a->data;
	Ball* ba = b->data;
	[ba repelon:r];
	[r balloff];
}

static int presolveNogravBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	return 0;
}

static int beginNogravBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Nograv* w = a->data;
	[w hit];
	[Common instance].gravityexists = !w.active;//NO;
	for(int i = 0; i < ls->ballsnum; i++)
		[ball[i] changeGravity];
	return 0;
}

static int presolveSawBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Ball* ba = b->data;
	[ba die];
	return 0;
}

static int presolveTeleportSaw(cpArbiter* arb, cpSpace* space, void* ignore) {

	return 0;
}

static int presolveTeleportPitstop(cpArbiter* arb, cpSpace* space, void* ignore) {
	
	return 0;
}

static int presolveTeleportBall(cpArbiter* arb, cpSpace* space, void* ignore) {

	CP_ARBITER_GET_SHAPES(arb, a, b);
	Teleport* r = a->data;
	if(r.active) {
		int n = (r.number % 2)?r.number-1:r.number+1;
		if(n >= ls->teleport_count)
			return 0;
		[[Common instance] getTeleport:n].active = NO;
		Ball* ba = b->data;
		[ba setTeleport:n];
	}
	return 0;
}

static void separateTeleportBall(cpArbiter* arb, cpSpace* space, void* ignore) {
	CP_ARBITER_GET_SHAPES(arb, a, b);
	Teleport* r = a->data;
	r.active = YES;
}

static int presolveScrewSaw(cpArbiter* arb, cpSpace* space, void* ignore) {	return 0; }
static int presolveScrewPitstop(cpArbiter* arb, cpSpace* space, void* ignore) {	return 0; }
static int presolveScrewWind(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewRepel(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewWall(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewSpike(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewNograv(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewArrow(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewHyper(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewPlatform(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewPlatform1(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveScrewTeleport(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }

static int presolveStarSaw(cpArbiter* arb, cpSpace* space, void* ignore) {	return 0; }
static int presolveStarPitstop(cpArbiter* arb, cpSpace* space, void* ignore) {	return 0; }
static int presolveStarWind(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarRepel(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarWall(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarSpike(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarNograv(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarArrow(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarHyper(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarPlatform(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarPlatform1(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarTeleport(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarScrew(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }
static int presolveStarStar(cpArbiter* arb, cpSpace* space, void* ignore) { return 0; }


static void eachShape(void* ptr, void* unused) {
	
	cpShape* shape = (cpShape*) ptr;
	CommonObj* cobj = shape->data;
	CCSprite* sprite = cobj.sprite;
	if( sprite ) {
		cpBody* body = shape->body;
		
		// TIP: cocos2d and chipmunk uses the same struct to store it's position
		// chipmunk uses: cpVect, and cocos2d uses CGPoint but in reality the are the same
		// since v0.7.1 you can mix them if you want.		
//		[sprite setPosition: body->p];
		sprite.position = body->p;
		
//		[sprite setRotation: (float) CC_RADIANS_TO_DEGREES( -body->a )];
		sprite.rotation = (float) CC_RADIANS_TO_DEGREES( -body->a );
	}
}

@implementation SpringScene

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SpringScene *layer = [SpringScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
	
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = NO;
		
		editorobj = EO_EASYWIND;
		
		ls = [LevelStruct alloc];
		
		[[Common instance] setLayer:self];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:LEVEL_MUSIC loop:YES];
        
        NSString* fon;
        NSString* fon1;
        switch ([Common instance].season) {
            case SZ_SUMMER:
            default:
                fon = @"background_summer.png";
                fon1 = @"ground_summer.png";
                break;
            case SZ_AUTUMN:
                fon = @"background_autumn.png";
                fon1 = @"ground_autumn.png";
                break;
            case SZ_WINTER:
                fon = @"background_winter.png";
                fon1 = @"ground_winter.png";
                break;
            case SZ_SPRING:
                fon = @"background_spring.png";
                fon1 = @"ground_spring.png";
                break;
        }

		CCSprite* bg = [CCSprite spriteWithFile:fon];
		bg.position = ccp(240, 160);
		[self addChild:bg z:0];		

		CCSprite* bgg = [CCSprite spriteWithFile:fon1];
		bgg.position = ccp(240, 18);
		[self addChild:bgg z:6];		

		direction_sprite = [CCSprite spriteWithFile:@"direction.png"];
		[self addChild:direction_sprite z:5];
		direction_sprite.visible = NO;
		direction_sprite.anchorPoint = ccp(0, 0.5f);

		direction_sprite_max = [CCSprite spriteWithFile:@"direction_max.png"];
		[self addChild:direction_sprite_max z:5];		
		direction_sprite_max.visible = NO;
		direction_sprite_max.anchorPoint = ccp(0, 0.5f);

		editor_sprite = [CCSprite spriteWithFile:@"editor_no.png"];
		editor_sprite.position = ccp(20,300);
		[self addChild:editor_sprite z:9];

		editor_sprite1 = [CCSprite spriteWithFile:@"chg.png"];
		editor_sprite1.position = ccp(460,300);
		[self addChild:editor_sprite1 z:9];

		editor_sprite2 = [CCSprite spriteWithFile:@"exit.png"];
		editor_sprite2.position = ccp(20,20);
		[self addChild:editor_sprite2 z:9];
		
		CGSize wins = [[CCDirector sharedDirector] winSize];
		cpInitChipmunk();
		
		cpBody* staticBody = cpBodyNew(INFINITY, INFINITY);
		space = cpSpaceNew();
		
		//space->gravity = ccp(0, -200);
		space->elasticIterations = space->iterations;
		//space->damping = 0.95f;
		
/*		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"next level.png" selectedImage:@"next level.png" target:self selector:@selector(nextlevelCallback:)];
		menu = [CCMenu menuWithItems:item1, nil];
		menu.visible = NO;
		menu.position = ccp(0,0);
		item1.position = ccp(240, 50);	
		[item1 setIsEnabled:NO];
 		[self addChild: menu z:3];
*/		

		
        CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"icon_pause.png" selectedImage:@"icon_pause.png" target:self selector:@selector(pause:)];
        item2 = [CCMenuItemImage itemFromNormalImage:@"button_resume.png" selectedImage:@"button_resume_activ.png" target:self selector:@selector(resume:)];
        item3 = [CCMenuItemImage itemFromNormalImage:@"button_restart.png" selectedImage:@"button_restart_activ.png" target:self selector:@selector(restart:)];
        item4 = [CCMenuItemImage itemFromNormalImage:@"menu.png" selectedImage:@"menu_activ.png" target:self selector:@selector(menu:)];

        CCMenuItemImage* itemSoundOn = [CCMenuItemImage itemFromNormalImage:@"s_sound_ON.png" selectedImage:@"s_sound_ON.png" target:nil selector:nil];
        CCMenuItemImage* itemSoundOff = [CCMenuItemImage itemFromNormalImage:@"s_sound_OFF.png" selectedImage:@"s_sound_OFF.png" target:nil selector:nil];

        item5 =  [CCMenuItemToggle itemWithTarget:self selector:@selector(sound:) items:itemSoundOn , itemSoundOff , nil];
        
        CCMenu* menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5, nil];
//        menu.visible = NO;
        menu.position = ccp(0,0);
        item1.position = ccp(445, 305);	
        item2.position = ccp(85, 200);	
        item3.position = ccp(84, 150);
        item4.position = ccp(398, 59);	
        item5.position = ccp(30, 290);

        [self addChild: menu z:50];

        bgp = [CCSprite spriteWithFile:@"black_fon.png"];
		bgp.position = ccp(240, 160);
        bgp.visible = NO;
        item2.visible = NO;
        item3.visible = NO;
        item4.visible = NO;
        item5.visible = NO;
        
		[self addChild:bgp z:48];	
		// right
		cpShape *shape1;
		shape1 = cpSegmentShapeNew(staticBody, ccp(wins.width,0), ccp(wins.width,wins.height), 0.0f);
		shape1->e = 1.0f; shape1->u = 1.0f;
		shape1->collision_type = CT_WALL;
		shape1->data = 0;
		cpSpaceAddStaticShape(space, shape1);

		// bottom
		cpShape *shape2;
		shape2 = cpSegmentShapeNew(staticBody, ccp(0,4), ccp(wins.width,4), 0.0f);
		shape2->e = /*1.1f*/[Common instance].bottomForce; shape2->u = 0.9999f;//sign that it is bottom in collision
		shape2->collision_type = CT_WALL;
		shape2->data = 0; 
		cpSpaceAddStaticShape(space, shape2);
		
		// top
		cpShape *shape3;
		shape3 = cpSegmentShapeNew(staticBody, ccp(0,wins.height), ccp(wins.width,wins.height), 0.0f);
		shape3->e = 1.0f; shape3->u = 1.0f;
		shape3->collision_type = CT_WALL;
		shape3->data = 0;
		cpSpaceAddStaticShape(space, shape3);
		
		// left
		cpShape *shape4;
		shape4 = cpSegmentShapeNew(staticBody, ccp(0,0), ccp(0,wins.height), 0.0f);
		shape4->e = 1.0f; shape4->u = 1.0f;
		shape4->collision_type = CT_WALL;
		shape4->data = 0;
		cpSpaceAddStaticShape(space, shape4);
				
//		startmassbody = [[[MassBody alloc]initWithParams:self space:space type:MS_START]retain];
//		finishmassbody = [[[MassBody alloc]initWithParams:self space:space type:MS_FINISH]retain];
		
		cpSpaceAddCollisionHandler(space, CT_BALL, CT_BALL, /*begin33*/NULL, presolveBallBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PITSTOP, CT_BALL, beginPitstopBall, presolvePitstopBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_WIND, CT_BALL, beginWindBall, presolveWindBall, postsolveWindBall, separateWindBall, NULL);
		cpSpaceAddCollisionHandler(space, CT_ARROW, CT_BALL, NULL, presolveArrowBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_HYPER, CT_BALL, beginHyperBall, presolveHyperBall, NULL, separateHyperBall, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_BALL, beginStarBall, presolveStarBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_WALL, CT_BALL, NULL, presolveWallBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PLATFORM, CT_BALL, NULL, presolvePlatformBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PLATFORM1, CT_BALL, NULL, presolvePlatformBall1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PLATFORM2, CT_BALL, NULL, presolvePlatformBall1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PITSTOP, CT_PITSTOP, NULL, presolvePitPit, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_PITSTOP, CT_WALL, NULL, presolvePitWall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SHADOW, CT_WALL, NULL, presolveShadowWall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SHADOW, CT_BALL, NULL, presolveShadowBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SHADOW, CT_PITSTOP, NULL, presolveShadowPitstop, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SHADOW, CT_WIND, NULL, presolveShadowWind, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_WIND, CT_WIND, NULL, presolveWindWind, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_WALL, CT_WIND, NULL, presolveWallWind, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SPIKE, CT_BALL, NULL, presolveSpikeBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SPIKE, CT_SPIKE, NULL, presolveSpikeSpike, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SPIKE, CT_WALL, NULL, presolveSpikeWall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_REPEL, CT_BALL, beginRepelBall, presolveRepelBall, NULL, separateRepelBall, NULL);
		cpSpaceAddCollisionHandler(space, CT_NOGRAV, CT_BALL, beginNogravBall, presolveNogravBall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SAW, CT_BALL, NULL, presolveSawBall, NULL, NULL, NULL);

		cpSpaceAddCollisionHandler(space, CT_TELEPORT, CT_SAW, NULL, presolveTeleportSaw, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_TELEPORT, CT_PITSTOP, NULL, presolveTeleportPitstop, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_TELEPORT, CT_BALL, NULL, presolveTeleportBall, NULL, separateTeleportBall, NULL);

		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_SAW, NULL, presolveScrewSaw, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_PITSTOP, NULL, presolveScrewPitstop, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_WIND, NULL, presolveScrewWind, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_REPEL, NULL, presolveScrewRepel, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_WALL, NULL, presolveScrewWall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_SPIKE, NULL, presolveScrewSpike, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_NOGRAV, NULL, presolveScrewNograv, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_ARROW, NULL, presolveScrewArrow, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_HYPER, NULL, presolveScrewHyper, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_PLATFORM, NULL, presolveScrewPlatform, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_PLATFORM1, NULL, presolveScrewPlatform1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_PLATFORM2, NULL, presolveScrewPlatform1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_SCREW, CT_TELEPORT, NULL, presolveScrewTeleport, NULL, NULL, NULL);

		cpSpaceAddCollisionHandler(space, CT_STAR, CT_SAW, NULL, presolveStarSaw, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_PITSTOP, NULL, presolveStarPitstop, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_WIND, NULL, presolveStarWind, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_REPEL, NULL, presolveStarRepel, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_WALL, NULL, presolveStarWall, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_SPIKE, NULL, presolveStarSpike, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_NOGRAV, NULL, presolveStarNograv, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_ARROW, NULL, presolveStarArrow, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_HYPER, NULL, presolveStarHyper, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_PLATFORM, NULL, presolveStarPlatform, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_PLATFORM1, NULL, presolveStarPlatform1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_PLATFORM2, NULL, presolveStarPlatform1, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_TELEPORT, NULL, presolveStarTeleport, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_SCREW, NULL, presolveStarScrew, NULL, NULL, NULL);
		cpSpaceAddCollisionHandler(space, CT_STAR, CT_STAR, NULL, presolveStarStar, NULL, NULL, NULL);
		
		cpSpaceResizeStaticHash(space, 400.0f, 40);
		cpSpaceResizeActiveHash(space, 100, 600);
		
		shadow_count = 0;
		
		ls->wind_count = 0;
		ls->transit_count = 0;
		ls->start_count = 0;
		ls->finish_count = 0;
		ls->arrow_count = 0;
		ls->hyper_count = 0;
		ls->spike_count = 0;
		ls->repel_count = 0;
		ls->nograv_count = 0;
		ls->platform_count = 0;
		ls->platform_count1 = 0;
		ls->saw_count = 0;
		ls->star_count = 0;
		ls->teleport_count = 0;
		ls->screw_count = 0;

		//[Common instance].scorescene = [ScoreScene node];
//		[[CCDirector sharedDirector] pushScene:[LevelScene1 scene]];	
//		[[CCDirector sharedDirector] runWithScene:[LevelScene1 scene]];	

		[self startLevel:/*1*/[Common instance].setlevel];
		
		[self schedule: @selector(step:)];// interval:0.5];
	}
	
	return self;
}

- (void) pause:(id) sender {
    
    NSLog(@"Pause");
    bgp.visible = YES;
    item2.visible = YES;
    item3.visible = YES;
    item4.visible = YES;
    item5.visible = YES;
    [[CCDirector sharedDirector] pause];
    
}

- (void) resume:(id) sender {

    NSLog(@"Resume");
    bgp.visible = NO;
    item2.visible = NO;
    item3.visible = NO;
    item4.visible = NO;
    item5.visible = NO;
    
    [[CCDirector sharedDirector] resume];
 
}

- (void) restart:(id) sender {
    
    NSLog(@"Restart");
    bgp.visible = NO;
    item2.visible = NO;
    item3.visible = NO;
    item4.visible = NO;
    item5.visible = NO;

    [self unschedule: @selector(step:)];

    [[CCDirector sharedDirector] resume];
    [self startLevel:level];
    [self schedule: @selector(step:)];// interval:0.5];

}

- (void) menu:(id) sender {
    
    bgp.visible = NO;
    item2.visible = NO;
    item3.visible = NO;
    item4.visible = NO;
    item5.visible = NO;
    
    [[CCDirector sharedDirector] resume];
        NSLog(@"Menu");
    [[CCDirector sharedDirector] popScene/*replaceScene:[SpringScene scene]*/];

}

- (void) sound:(id) sender {
 
        NSLog(@"sound - %d", [sender selectedIndex]);
}

- (void) nextlevelCallback:(id) sender {
	[self startLevel:(level + 1)];
}

-(void) startLevel: (int) l {
	
    NSLog(@"Started level %d", l);

    
	level = l;
	selected = -1;	
	[Common instance].editor = NO;
	[Common instance].ballsonfinish = 0;
	[[Common instance] resetGravityAngle];
	[Common instance].gravityexists = YES;
//	menu.visible = NO;
	
	for(int i = 0; i < ls->wind_count; i++)
		[[[Common instance] getWind:i] release];
	for(int i = 0; i < ls->transit_count; i++)
		[[[Common instance] getTransit:i] release];
	for(int i = 0; i < ls->start_count; i++)
		[[[Common instance] getStart:i] release];
	for(int i = 0; i < ls->finish_count; i++)
		[[[Common instance] getFinish:i] release];
	for(int i = 0; i < ls->arrow_count; i++)
		[[[Common instance] getArrow:i] release];
	for(int i = 0; i < ls->hyper_count; i++)
		[[[Common instance] getHyper:i] release];
	for(int i = 0; i < ls->spike_count; i++)
		[[[Common instance] getSpike:i] release];
	for(int i = 0; i < ls->repel_count; i++)
		[[[Common instance] getRepel:i] release];
	for(int i = 0; i < ls->nograv_count; i++)
		[[[Common instance] getNograv:i] release];
	for(int i = 0; i < ls->platform_count; i++)
		[[[Common instance] getPlatform:i] release];
	for(int i = 0; i < ls->platform_count1; i++)
		[[[Common instance] getPlatform1:i] release];
	for(int i = 0; i < ls->platform_count2; i++)
		[[[Common instance] getPlatform2:i] release];
	for(int i = 0; i < ls->saw_count; i++)
		[[[Common instance] getSaw:i] release];
	for(int i = 0; i < ls->star_count; i++)
		[[[Common instance] getStar:i] release];
	for(int i = 0; i < ls->teleport_count; i++)
		[[[Common instance] getTeleport:i] release];
	for(int i = 0; i < ls->screw_count; i++)
		[[[Common instance] getScrew:i] release];
	
    for(int i = 0; i < ls->ballsnum; i++) {
           
        NSLog(@"Ball %d releasing", i);
		[ball[i] release];
    }
		
	[[Common instance] getLevelParams:level params:ls];
	
	for(int i = 0; i < ls->wind_count; i++)
		[[Common instance] setWind:[[Wind alloc]initWithParams:self space:space type:ls->iwind[i].type] at:i];
	for(int i = 0; i < ls->transit_count; i++)
		[[Common instance] setTransit:[[MassBody alloc]initWithParams:self space:space type:MS_TRANSIT] at:i];
	for(int i = 0; i < ls->start_count; i++)
		[[Common instance] setStart:[[MassBody alloc]initWithParams:self space:space type:MS_START] at:i];
	for(int i = 0; i < ls->finish_count; i++)
		[[Common instance] setFinish:[[MassBody alloc]initWithParams:self space:space type:MS_FINISH] at:i];
	for(int i = 0; i < ls->arrow_count; i++)
		[[Common instance] setArrow:[[Arrow alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->hyper_count; i++)
		[[Common instance] setHyper:[[Hyper alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->spike_count; i++)
		[[Common instance] setSpike:[[Spike alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->repel_count; i++)
		[[Common instance] setRepel:[[Repel alloc]initWithParams:self space:space type:ls->irepel[i].type] at:i];
	for(int i = 0; i < ls->nograv_count; i++)
		[[Common instance] setNograv:[[Nograv alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->platform_count; i++)
		[[Common instance] setPlatform:[[Platform alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->platform_count1; i++)
		[[Common instance] setPlatform1:[[Platform1 alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->platform_count2; i++)
		[[Common instance] setPlatform2:[[Platform2 alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->saw_count; i++)
		[[Common instance] setSaw:[[Saw alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->star_count; i++)
		[[Common instance] setStar:[[Star alloc]initWithParams:self space:space] at:i];
	for(int i = 0; i < ls->teleport_count; i++)
		[[Common instance] setTeleport:[[Teleport alloc]initWithParams:self space:space num:i] at:i];
	for(int i = 0; i < ls->screw_count; i++)
		[[Common instance] setScrew:[[Screw alloc]initWithParams:self space:space] at:i];
	
//	[startmassbody setPosition:ls->start];
//	[finishmassbody setPosition:ls->finish];

	for(int i = 0; i < ls->wind_count; i++) {
		Wind* w = [[Common instance] getWind:i];
		[w setPosition:ls->iwind[i].pos];
		[w setAngle:ls->iwind[i].angle];
	}
	for(int i = 0; i < ls->transit_count; i++) {
		MassBody* w = [[Common instance] getTransit:i];
		[w setPosition:ls->itransit[i]];
	}
	for(int i = 0; i < ls->start_count; i++) {
		MassBody* w = [[Common instance] getStart:i];
		[w setPosition:ls->istart[i].pos];
	}
	for(int i = 0; i < ls->finish_count; i++) {
		MassBody* w = [[Common instance] getFinish:i];
		[w setPosition:ls->ifinish[i]];
	}
	for(int i = 0; i < ls->arrow_count; i++) {
		Arrow* w = [[Common instance] getArrow:i];
		[w setPosition:ls->iarrow[i].pos];
		[w setAngle:ls->iarrow[i].angle];
	}
	for(int i = 0; i < ls->hyper_count; i++) {
		Hyper* w = [[Common instance] getHyper:i];
		[w setPosition:ls->ihyper[i]];
	}
	for(int i = 0; i < ls->spike_count; i++) {
		Spike* w = [[Common instance] getSpike:i];
		[w setPosition:ls->ispike[i].pos];
		[w setAngle:ls->ispike[i].angle];
	}

	for(int i = 0; i < ls->repel_count; i++) {
		Repel* w = [[Common instance] getRepel:i];
		[w setPosition:ls->irepel[i].pos];
	}

	for(int i = 0; i < ls->nograv_count; i++) {
		Nograv* w = [[Common instance] getNograv:i];
		[w setPosition:ls->inograv[i]];
	}

	for(int i = 0; i < ls->platform_count; i++) {
		Platform* w = [[Common instance] getPlatform:i];
		[w setPosition:ls->iplatform[i].pos];
		[w setAngle:ls->iplatform[i].angle];
	}

	for(int i = 0; i < ls->platform_count1; i++) {
		Platform1* w = [[Common instance] getPlatform1:i];
		[w setPosition:ls->iplatform1[i].pos];
		[w setAngle:ls->iplatform1[i].angle];
	}

	for(int i = 0; i < ls->platform_count2; i++) {
		Platform2* w = [[Common instance] getPlatform2:i];
		[w setPosition:ls->iplatform2[i].pos];
//		[w setAngle:ls->iplatform2[i].angle];
	}
	
	for(int i = 0; i < ls->saw_count; i++) {
		Saw* w = [[Common instance] getSaw:i];
		[w setPosition:ls->isaw[i]];
	}

	for(int i = 0; i < ls->star_count; i++) {
		Star* w = [[Common instance] getStar:i];
		[w setPosition:ls->istar[i]];
	}
	
	for(int i = 0; i < ls->teleport_count; i++) {
		Teleport* w = [[Common instance] getTeleport:i];
		[w setPosition:ls->iteleport[i]];
	}

	for(int i = 0; i < ls->screw_count; i++) {
		Screw* w = [[Common instance] getScrew:i];
		[w setPosition:ls->iscrew[i]];
	}
	
//    NSLog(@"start_count = %d", ls->istart[0].balls);
//    NSLog(@"retains0 = %d", [ball[0] retainCount]);
//	ls->ballsnum = 0;
	int h = 0;
    int col = BC_BLUE;
	for(int j = 0; j < ls->start_count; j++) {
//		MassBody* w = [[Common instance] getStart:j];
//		ls->ballsnum += ls->istart[j].balls;
		for(int i = 0; i < ls->istart[j].balls/*ls->balls_num*/; i++) {
			
            int randx = 25 - CCRANDOM_0_1() * 50;
			int randy = 0;
			ball[h++/*i*/] = [[Ball alloc]initWithParams:self space:space pos:ccp(randx + ls->istart[j].pos.x/*ls->start.x*/, randy + ls->istart[j].pos.y/*ls->start.y*/ + 20) color:col];
            [ball[h-1] release];
            col++;
            if(col >= BC_MAX)
                col = BC_BLUE;
		}
	}
	ls->ballsnum = h;
    
    NSLog(@"retains1 = %d", [ball[0] retainCount]);

	
}

- (void) ccTouchesMoved:(NSSet* )touches withEvent:(UIEvent* )event {

	UITouch *touch = [touches anyObject];	
	CGPoint location = [touch locationInView: [touch view]];
	convLocationMoved = [[CCDirector sharedDirector] convertToGL:location];

	if(obj_selected) {
		obj_hanged = nil;
		[obj_selected setPosition:convLocationMoved];
		for(int i = 0; i < ls->ballsnum; i++)
			[ball[i] stop];

	}
	
}

- (void) ccTouchesBegan:(NSSet* )touches withEvent:(UIEvent* )event {
	
	//NSLog(@"ccTouchesBegan");

	obj_selected = NULL;
	
	selected = -1;
	
	UITouch *touch = [touches anyObject];	
	NSUInteger tapCount = [touch tapCount];
	//NSLog(@"tapCount = %d", tapCount);
	CGPoint location = [touch locationInView: [touch view]];
	/*CGPoint*/ convLocation = [[CCDirector sharedDirector] convertToGL:location];
	//int tx = convertedLocation.x;
	//int ty = convertedLocation.y;
	
	convLocationMoved = convLocation;
	
	if((convLocation.x < 30) && (convLocation.y > 290)) {
		[Common instance].editor = ![Common instance].editor;
		if([Common instance].editor)
			[editor_sprite initWithFile:@"editor_yes.png"];
		else
			[editor_sprite initWithFile:@"editor_no.png"];
		
		editor_sprite.position = ccp(20,300);
		return;
	}

	if((convLocation.x < 30) && (convLocation.y < 30) && [Common instance].editor) {
		
		[[CCDirector sharedDirector] popScene/*replaceScene:[SpringScene scene]*/];
	}

	if((convLocation.x > 450) && (convLocation.y > 290) && [Common instance].editor) {
		//NSLog(@"x = %f, y = %f", obj_hanged.sprite.position.x, obj_hanged.sprite.position.y);
		
		if(obj_hanged/* && (obj_hanged.sprite.position.x == 240) && (obj_hanged.sprite.position.y == 160)*/) {
			(*decrement_counter)--;
			[obj_hanged release];
			obj_hanged = nil;
		}
		
		switch(editorobj) {
			case EO_EASYWIND: {
				int i = ls->wind_count + 1;
				if(i > MAX_WINDCNT)
					break;
				ls->wind_count = i;
				Wind* w = [[Wind alloc]initWithParams:self space:space type:WIND_EASY];
				[w setPosition:ccp(240,160)];
				[[Common instance] setWind:w at:i-1];
				ls->iwind[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->wind_count;
				//NSLog(@"xw = %f, yw = %f", w.sprite.position.x, w.sprite.position.y);
				break;
			}
/*			case EO_STRONGWIND: {
				int i = ls->wind_count + 1;
				if(i > MAX_WINDCNT)
					break;
				ls->wind_count = i;
				Wind* w = [[Wind alloc]initWithParams:self space:space type:WIND_STRONG];
				[w setPosition:ccp(240,160)];
				[[Common instance] setWind:w at:i-1];
				ls->iwind[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->wind_count;
				break;
			}	*/			
			case EO_TRANSIT: {
				int i = ls->transit_count + 1;
				if(i > MAX_TRANSITCNT)
					break;
				ls->transit_count = i;
				MassBody* w = [[MassBody alloc]initWithParams:self space:space type:MS_TRANSIT];
				[w setPosition:ccp(240,160)];
				[[Common instance] setTransit:w at:i-1];
				ls->itransit[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->transit_count;
				break;
			}
			case EO_START: {
				int i = ls->start_count + 1;
				if(i > MAX_STARTCNT)
					break;
				ls->start_count = i;
				MassBody* w = [[MassBody alloc]initWithParams:self space:space type:MS_START];
				[w setPosition:ccp(240,160)];
				[[Common instance] setStart:w at:i-1];
				ls->istart[i-1].pos = ccp(240,160);
				ls->istart[i-1].balls = 3;
				obj_hanged = w;
				decrement_counter = &ls->start_count;
				break;
			}
			case EO_FINISH: {
				int i = ls->finish_count + 1;
				if(i > MAX_FINISHCNT)
					break;
				ls->finish_count = i;
				MassBody* w = [[MassBody alloc]initWithParams:self space:space type:MS_FINISH];
				[w setPosition:ccp(240,160)];
				[[Common instance] setFinish:w at:i-1];
				ls->ifinish[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->finish_count;
				break;
			}
			case EO_ARROW: {
				int i = ls->arrow_count + 1;
				if(i > MAX_ARROWCNT)
					break;
				ls->arrow_count = i;
				Arrow* w = [[Arrow alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setArrow:w at:i-1];
				ls->iarrow[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->arrow_count;
				break;
			}
			case EO_HYPER: {
				int i = ls->hyper_count + 1;
				if(i > MAX_HYPERCNT)
					break;
				ls->hyper_count = i;
				Hyper* w = [[Hyper alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setHyper:w at:i-1];
				ls->ihyper[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->hyper_count;
				break;
			}
			case EO_SPIKE: {
				int i = ls->spike_count + 1;
				if(i > MAX_SPIKECNT)
					break;
				ls->spike_count = i;
				Spike* w = [[Spike alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setSpike:w at:i-1];
				ls->ispike[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->spike_count;
				break;
			}
			case EO_REPEL0: {
				int i = ls->repel_count + 1;
				if(i > MAX_REPELCNT)
					break;
				ls->repel_count = i;
				Repel* w = [[Repel alloc]initWithParams:self space:space type:0];
				[w setPosition:ccp(240,160)];
				[[Common instance] setRepel:w at:i-1];
				ls->irepel[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->repel_count;
				break;
			}
			case EO_REPEL1: {
				int i = ls->repel_count + 1;
				if(i > MAX_REPELCNT)
					break;
				ls->repel_count = i;
				Repel* w = [[Repel alloc]initWithParams:self space:space type:1];
				[w setPosition:ccp(240,160)];
				[[Common instance] setRepel:w at:i-1];
				ls->irepel[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->repel_count;
				break;
			}
			case EO_REPEL2: {
				int i = ls->repel_count + 1;
				if(i > MAX_REPELCNT)
					break;
				ls->repel_count = i;
				Repel* w = [[Repel alloc]initWithParams:self space:space type:2];
				[w setPosition:ccp(240,160)];
				[[Common instance] setRepel:w at:i-1];
				ls->irepel[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->repel_count;
				break;
			}
			case EO_REPEL3: {
				int i = ls->repel_count + 1;
				if(i > MAX_REPELCNT)
					break;
				ls->repel_count = i;
				Repel* w = [[Repel alloc]initWithParams:self space:space type:3];
				[w setPosition:ccp(240,160)];
				[[Common instance] setRepel:w at:i-1];
				ls->irepel[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->repel_count;
				break;
			}
			case EO_REPEL4: {
				int i = ls->repel_count + 1;
				if(i > MAX_REPELCNT)
					break;
				ls->repel_count = i;
				Repel* w = [[Repel alloc]initWithParams:self space:space type:4];
				[w setPosition:ccp(240,160)];
				[[Common instance] setRepel:w at:i-1];
				ls->irepel[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->repel_count;
				break;
			}
			case EO_NOGRAV: {
				int i = ls->nograv_count + 1;
				if(i > MAX_NOGRAVCNT)
					break;
				ls->nograv_count = i;
				Nograv* w = [[Nograv alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setNograv:w at:i-1];
				ls->inograv[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->nograv_count;
				break;
			}
			case EO_PLATFORM: {
				int i = ls->platform_count + 1;
				if(i > MAX_PLATFORMCNT)
					break;
				ls->platform_count = i;
				Platform* w = [[Platform alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setPlatform:w at:i-1];
				ls->iplatform[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->platform_count;
				break;
			}
			case EO_PLATFORM1: {
				int i = ls->platform_count1 + 1;
				if(i > MAX_PLATFORMCNT1)
					break;
				ls->platform_count1 = i;
				Platform1* w = [[Platform1 alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setPlatform1:w at:i-1];
				ls->iplatform1[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->platform_count1;
				break;
			}
			case EO_PLATFORM2: {
				int i = ls->platform_count2 + 1;
				if(i > MAX_PLATFORMCNT2)
					break;
				ls->platform_count2 = i;
				Platform2* w = [[Platform2 alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setPlatform2:w at:i-1];
				ls->iplatform2[i-1].pos = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->platform_count2;
				break;
			}
			case EO_SAW: {
				int i = ls->saw_count + 1;
				if(i > MAX_SAWCNT)
					break;
				ls->saw_count = i;
				Saw* w = [[Saw alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setSaw:w at:i-1];
				ls->isaw[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->saw_count;
				break;
			}
			case EO_STAR: {
				int i = ls->star_count + 1;
				if(i > MAX_STARCNT)
					break;
				ls->star_count = i;
				Star* w = [[Star alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setStar:w at:i-1];
				ls->istar[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->star_count;
				break;
			}
			case EO_TELEPORT: {
				int i = ls->teleport_count + 1;
				if(i > MAX_TELEPORTCNT)
					break;
				ls->teleport_count = i;
				Teleport* w = [[Teleport alloc]initWithParams:self space:space num:i-1];
				[w setPosition:ccp(240,160)];
				[[Common instance] setTeleport:w at:i-1];
				ls->iteleport[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->teleport_count;
				break;
			}
			case EO_SCREW: {
				int i = ls->screw_count + 1;
				if(i > MAX_SCREWCNT)
					break;
				ls->screw_count = i;
				Screw* w = [[Screw alloc]initWithParams:self space:space];
				[w setPosition:ccp(240,160)];
				[[Common instance] setScrew:w at:i-1];
				ls->iscrew[i-1] = ccp(240,160);
				obj_hanged = w;
				decrement_counter = &ls->screw_count;
				break;
			}
			default:break;
		}
		editorobj++;
		if(editorobj == EO_MAX)
			editorobj = EO_EASYWIND;
		
		return;
	}
	
	if([Common instance].editor) {
		
		CGRect sRect;
		for(int i = 0; i < ls->transit_count; i++) {
			MassBody* w = [[Common instance] getTransit:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteTransit:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
				obj_selected = w;
				return;
			}
		}
		
		for(int i = 0; i < ls->start_count; i++) {
			MassBody* w = [[Common instance] getStart:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteStart:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->finish_count; i++) {
			MassBody* w = [[Common instance] getFinish:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteFinish:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}
		
		for(int i = 0; i < ls->arrow_count; i++) {
			Arrow* w = [[Common instance] getArrow:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteArrow:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->hyper_count; i++) {
			Hyper* w = [[Common instance] getHyper:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteHyper:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->spike_count; i++) {
			Spike* w = [[Common instance] getSpike:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteSpike:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}
		
		for(int i = 0; i < ls->wind_count; i++) {
			Wind* w = [[Common instance] getWind:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteWind:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
			return;
			}
		}

		for(int i = 0; i < ls->repel_count; i++) {
			Repel* w = [[Common instance] getRepel:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteRepel:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->nograv_count; i++) {
			Nograv* w = [[Common instance] getNograv:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteNograv:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->platform_count; i++) {
			Platform* w = [[Common instance] getPlatform:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deletePlatform:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->platform_count1; i++) {
			Platform1* w = [[Common instance] getPlatform1:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deletePlatform1:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

        for(int i = 0; i < ls->platform_count2; i++) {
			Platform2* w = [[Common instance] getPlatform2:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deletePlatform2:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->saw_count; i++) {
			Saw* w = [[Common instance] getSaw:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteSaw:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->star_count; i++) {
			Star* w = [[Common instance] getStar:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteStar:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->teleport_count; i++) {
			Teleport* w = [[Common instance] getTeleport:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteTeleport:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}

		for(int i = 0; i < ls->screw_count; i++) {
			Screw* w = [[Common instance] getScrew:i];
			sRect = [w getRect];
			if(CGRectContainsPoint( sRect, convLocation )) {
				if(tapCount == 2) {
					[[Common instance] deleteScrew:i];
					[[Common instance] setLevelParams:level params:ls];
				}
				else
					obj_selected = w;
				return;
			}
		}
		
	}
	
	for(int i = 0; i < ls->ballsnum; i++) {
		CGRect sRect = [ball[i] getRect]; 
		if([ball[i] canGo] && CGRectContainsPoint( sRect, convLocation ) ) {
			if(![ball[i] isHyper])
				[ball[i] stop];
			selected = i;
			break;
		}
	}	
}

- (void) ccTouchesEnded:(NSSet* )touches withEvent:(UIEvent* )event {

	//NSLog(@"ccTouchesEnded");

	CGPoint pt = [self convertTouchToNodeSpace:[touches anyObject]];

	
		if(obj_selected) {
			
           // NSLog(@"x, pt.x, y, pt.y: %f, %f, %f, %f", convLocation.x, pt.x, convLocation.y, pt.y);
			if((fabs(convLocation.x - pt.x)<=1) && (fabs(convLocation.y == pt.y)<=1)) {
                //NSLog(@"rotate");
				[obj_selected rotate90];
			}
			
			[obj_selected setPosition:pt];
			obj_selected = NULL;

//			ls->start = startmassbody.sprite.position;
//			ls->finish = finishmassbody.sprite.position;
			
			for(int i = 0; i < ls->transit_count; i++) {
				MassBody* w = [[Common instance] getTransit:i];
				ls->itransit[i] = w.sprite.position;
			}

			for(int i = 0; i < ls->start_count; i++) {
				MassBody* w = [[Common instance] getStart:i];
				ls->istart[i].pos = w.sprite.position;
			}

			for(int i = 0; i < ls->finish_count; i++) {
				MassBody* w = [[Common instance] getFinish:i];
				ls->ifinish[i] = w.sprite.position;
			}
			
			for(int i = 0; i < ls->wind_count; i++) {
				Wind* w = [[Common instance] getWind:i];
				ls->iwind[i].pos = w.sprite.position;
				ls->iwind[i].angle = w.angle;
				ls->iwind[i].type = w.typ;
			}

			for(int i = 0; i < ls->arrow_count; i++) {
				Arrow* w = [[Common instance] getArrow:i];
				ls->iarrow[i].pos = w.sprite.position;
				ls->iarrow[i].angle = w.angle;
			}

			for(int i = 0; i < ls->hyper_count; i++) {
				Hyper* w = [[Common instance] getHyper:i];
				ls->ihyper[i] = w.sprite.position;
			}

			for(int i = 0; i < ls->spike_count; i++) {
				Spike* w = [[Common instance] getSpike:i];
				ls->ispike[i].pos = w.sprite.position;
				ls->ispike[i].angle = w.angle;
			}

			for(int i = 0; i < ls->repel_count; i++) {
				Repel* w = [[Common instance] getRepel:i];
				ls->irepel[i].pos = w.sprite.position;
				ls->irepel[i].type = w.typ;
			}

			for(int i = 0; i < ls->nograv_count; i++) {
				Nograv* w = [[Common instance] getNograv:i];
				ls->inograv[i] = w.sprite.position;
			}

			for(int i = 0; i < ls->platform_count; i++) {
				Platform* w = [[Common instance] getPlatform:i];
				ls->iplatform[i].pos = w.sprite.position;
				ls->iplatform[i].angle = w.angle;
			}

			for(int i = 0; i < ls->platform_count1; i++) {
				Platform1* w = [[Common instance] getPlatform1:i];
				ls->iplatform1[i].pos = w.sprite.position;
				ls->iplatform1[i].angle = w.angle;
			}

            for(int i = 0; i < ls->platform_count2; i++) {
				Platform2* w = [[Common instance] getPlatform2:i];
				ls->iplatform2[i].pos = w.sprite.position;
//				ls->iplatform2[i].angle = w.angle;
			}

			for(int i = 0; i < ls->saw_count; i++) {
				Saw* w = [[Common instance] getSaw:i];
				ls->isaw[i] = w.sprite.position;
			}

			for(int i = 0; i < ls->star_count; i++) {
				Star* w = [[Common instance] getStar:i];
				ls->istar[i] = w.sprite.position;
			}
			
			for(int i = 0; i < ls->teleport_count; i++) {
				Teleport* w = [[Common instance] getTeleport:i];
				ls->iteleport[i] = w.sprite.position;
			}

			for(int i = 0; i < ls->screw_count; i++) {
				Screw* w = [[Common instance] getScrew:i];
				ls->iscrew[i] = w.sprite.position;
			}
			
			[[Common instance] setLevelParams:level params:ls];

			return;
		}
		
		
	if(selected < 0)
		return;

	direction_sprite.visible = NO;
	direction_sprite_max.visible = NO;
	
//	CGPoint pt = [self convertTouchToNodeSpace:[touches anyObject]];
	CGPoint forceVect = ccpSub(pt, ball[selected].sprite.position);
	//NSLog(@"scale = %f", cpvlength(forceVect));
	cpFloat ln = cpvlength(forceVect);
	cpFloat k = [Common instance].shootkoeff;
	cpFloat ml = (ln <= 150)?k:(2 * k * 100 / ln);
	[ball[selected] go:ccpMult(forceVect, ml)];
	selected = -1;
}

- (void) dealloc {
	
    [self deleteObjects];

	[super dealloc];
	
//	[startmassbody release];
//	[finishmassbody release];

	[ls release];

//	[obj_hanged release];
//	[obj_selected release];
	
	cpSpaceFreeChildren(space);
	cpSpaceFree(space);

}

-(void) deleteObjects {
    
    for(int i = 0; i < ls->wind_count; i++)
		[[[Common instance] getWind:i] release];
	for(int i = 0; i < ls->transit_count; i++)
		[[[Common instance] getTransit:i] release];
	for(int i = 0; i < ls->start_count; i++)
		[[[Common instance] getStart:i] release];
	for(int i = 0; i < ls->finish_count; i++)
		[[[Common instance] getFinish:i] release];
	for(int i = 0; i < ls->arrow_count; i++)
		[[[Common instance] getArrow:i] release];
	for(int i = 0; i < ls->hyper_count; i++)
		[[[Common instance] getHyper:i] release];
	for(int i = 0; i < ls->spike_count; i++)
		[[[Common instance] getSpike:i] release];
	for(int i = 0; i < ls->repel_count; i++)
		[[[Common instance] getRepel:i] release];
	for(int i = 0; i < ls->nograv_count; i++)
		[[[Common instance] getNograv:i] release];
	for(int i = 0; i < ls->platform_count; i++)
		[[[Common instance] getPlatform:i] release];
	for(int i = 0; i < ls->platform_count1; i++)
		[[[Common instance] getPlatform1:i] release];
	for(int i = 0; i < ls->platform_count2; i++)
		[[[Common instance] getPlatform2:i] release];
	for(int i = 0; i < ls->saw_count; i++)
		[[[Common instance] getSaw:i] release];
	for(int i = 0; i < ls->star_count; i++)
		[[[Common instance] getStar:i] release];
	for(int i = 0; i < ls->teleport_count; i++)
		[[[Common instance] getTeleport:i] release];
	for(int i = 0; i < ls->screw_count; i++)
		[[[Common instance] getScrew:i] release];
	for(int i = 0; i < ls->ballsnum; i++)
		[ball[i] release];
}

-(void) step: (ccTime) delta {

	//NSLog(@"%f",delta);
	
	int steps = 2;
	CGFloat dt = delta/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(space, dt);
	}
	cpSpaceHashEach(space->activeShapes, &eachShape, nil);
	cpSpaceHashEach(space->staticShapes, &eachShape, nil);
	
	for(int i = 0; i < ls->ballsnum; i++)
		[ball[i] predrawShadow];
	
	shadow_count++;
	if(shadow_count >= 3) {
	for(int i = 0; i < ls->ballsnum; i++)
		[ball[i] drawShadow];
		shadow_count = 0;
	}
	
//	if([Common instance].ballsonfinish > 0)
//		menu.visible = YES;
	
	if(selected < 0)
		return;
	
	cpFloat at;
	float o = ball[selected].sprite.position.x - convLocationMoved.x;
	float a = ball[selected].sprite.position.y - convLocationMoved.y;
	if(o || a){
		at = (float) CC_RADIANS_TO_DEGREES( atanf( o/a) );
		if( a < 0 ) {
			if(  o < 0 )
				at = 180 + abs(at);
			else
				at = 180 - abs(at);	
		}
	}
	
	cpFloat d2 = o * o + a * a;
	cpFloat sc = d2 / 20000;
	if(sc <= 1) {
		direction_sprite.position = ball[selected].sprite.position;
		direction_sprite.rotation = at + 90;
		direction_sprite.scale = sc;
		direction_sprite_max.visible = NO;
		direction_sprite.visible = YES;
	} else {
		direction_sprite_max.position = ball[selected].sprite.position;
		direction_sprite_max.rotation = at + 90;
		//direction_sprite_max.scale = 1;
		direction_sprite.visible = NO;
		direction_sprite_max.visible = YES;
	}
	
}

@end
