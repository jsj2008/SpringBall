//
//  Common.h
//  Springs
//
//  Created by вадим on 2/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Wind.h"
#import "MassBody.h"
#import "Arrow.h"
#import "Hyper.h"
#import "Spike.h"
#import "Repel.h"
#import "Nograv.h"
#import "Platform.h"
#import "Platform1.h"
#import "Platform2.h"
#import "Saw.h"
#import "Star.h"
#import "Teleport.h"
#import "Screw.h"

#define MAX_WINDCNT 4
#define MAX_TRANSITCNT 4
#define MAX_STARTCNT 3
#define MAX_FINISHCNT 3
#define MAX_ARROWCNT 4
#define MAX_HYPERCNT 3
#define MAX_SPIKECNT 22
#define MAX_REPELCNT 20
#define MAX_NOGRAVCNT 2
#define MAX_PLATFORMCNT 15
#define MAX_PLATFORMCNT1 15
#define MAX_PLATFORMCNT2 15
#define MAX_SAWCNT 5
#define MAX_STARCNT 15
#define MAX_TELEPORTCNT 8
#define MAX_SCREWCNT 2

#define SEASON_LEVELS_CNT 15

enum BallColors { BC_BLUE, BC_GREEN, BC_RED, BC_VIOLET, BC_YELLOW, BC_MAX /* vsegda v konce */};

/*@interface ATPStruct : NSObject {

@public
	int angle;
	int type;
	CGPoint pos; 
}
@end*/

struct ATPStruct {
	int angle;
	int type;
	CGPoint pos; 
};

/*@interface TPStruct : NSObject {
	
@public
	int type;
	CGPoint pos; 
}
@end*/

struct TPStruct {
	int type;
	CGPoint pos; 
};

/*@interface APStruct : NSObject {

@public
	int angle;
	CGPoint pos; 
}
@end*/

struct APStruct {
	int angle;
	CGPoint pos; 
};

/*@interface BPStruct : NSObject {
	
@public
	int balls;
	CGPoint pos; 
}
@end*/


struct BPStruct {
	int balls;
	CGPoint pos; 
};

@interface LevelStruct : NSObject {

@public
	int wind_count;
	struct ATPStruct iwind[MAX_WINDCNT];
	int transit_count;
	CGPoint itransit[MAX_TRANSITCNT];
	int finish_count;
	CGPoint ifinish[MAX_FINISHCNT];
	int start_count;
	struct BPStruct istart[MAX_STARTCNT];
	int arrow_count;
	struct APStruct iarrow[MAX_ARROWCNT];
	int hyper_count;
	CGPoint ihyper[MAX_HYPERCNT];
	int spike_count;
	struct APStruct ispike[MAX_SPIKECNT];
	int repel_count;
	struct TPStruct irepel[MAX_REPELCNT];
	int nograv_count;
	CGPoint inograv[MAX_NOGRAVCNT];
	int platform_count;
	struct APStruct iplatform[MAX_PLATFORMCNT];
	int platform_count1;
	struct APStruct iplatform1[MAX_PLATFORMCNT1];
	int platform_count2;
	struct APStruct iplatform2[MAX_PLATFORMCNT2];
	int saw_count;
	CGPoint isaw[MAX_SAWCNT];
	int star_count;
	CGPoint istar[MAX_STARCNT];
	int teleport_count;
	CGPoint iteleport[MAX_TELEPORTCNT];
	int screw_count;
	CGPoint iscrew[MAX_SCREWCNT];
	int ballsnum;
//	int balls_num;
//	CGPoint start;
//	CGPoint finish;
}
@end

extern LevelStruct* ls;

@interface Common : NSObject {
	
	NSMutableDictionary* params;
	CCLayer* lay;
	int score;
	int gravity;
	int strongwind;
	int weakwind;
	int ringspeed;
	float ringspin;
	int shootkoeff;
	int repelpower1;
	int repelpower2;
	int repelpower3;
	bool editor;
	float tailfadeout;
	int tailcount;
	float bottomForce;	
	int ballsonfinish;
	int gravityAngle;
	bool gravityexists;
	int setlevel;
	
	CCSprite* back_sprite;
	Wind* wind_array[MAX_WINDCNT];
	MassBody* transit_array[MAX_TRANSITCNT];
	MassBody* start_array[MAX_STARTCNT];
	MassBody* finish_array[MAX_FINISHCNT];	
	Arrow* arrow_array[MAX_ARROWCNT];
	Hyper* hyper_array[MAX_HYPERCNT];
	Spike* spike_array[MAX_SPIKECNT];
	Repel* repel_array[MAX_REPELCNT];
	Nograv* nograv_array[MAX_NOGRAVCNT];
	Platform* platform_array[MAX_PLATFORMCNT];
	Platform1* platform_array1[MAX_PLATFORMCNT1];
	Platform2* platform_array2[MAX_PLATFORMCNT2];
	Saw* saw_array[MAX_SAWCNT];
	Star* star_array[MAX_STARCNT];
	Teleport* teleport_array[MAX_TELEPORTCNT];
	Screw* screw_array[MAX_SCREWCNT];

}

@property (readwrite) int score;
@property (readwrite) int strongwind;
@property (readwrite) int weakwind;
@property (readwrite) int ringspeed;
@property (readwrite) float ringspin;
@property (readwrite) int shootkoeff;
@property (readwrite) int repelpower1;
@property (readwrite) int repelpower2;
@property (readwrite) int repelpower3;
@property (readwrite) bool editor;
@property (readwrite) int tailcount;
@property (readwrite) float tailfadeout;
@property (readwrite) float bottomForce;
@property (readwrite) int ballsonfinish;
@property (readwrite) bool gravityexists;
@property (readwrite) int setlevel;

+ (Common*) instance;

- (void) setLayer: (CCLayer*)lr;

- (float) getParams: (NSString*) name;
- (void) getLevelParams: (int)level params:(LevelStruct*) parms;
- (void) setLevelParams: (int)level params:(LevelStruct*) parms;

- (void) resetGame;
- (cpVect) getGravity;
- (void) setGravityAngle: (int)a;
- (void) resetGravityAngle;
- (void) setWind: (Wind*) w at:(int) c;
- (Wind*) getWind: (int) c;
- (void) deleteWind: (int) c;
- (void) setTransit: (MassBody*) w at:(int) c;
- (MassBody*) getTransit: (int) c;
- (void) deleteTransit: (int) c;
- (void) setStart: (MassBody*) w at:(int) c;
- (MassBody*) getStart: (int) c;
- (void) deleteStart: (int) c;
- (void) setFinish: (MassBody*) w at:(int) c;
- (MassBody*) getFinish: (int) c;
- (void) deleteFinish: (int) c;
- (void) setArrow: (Arrow*) w at:(int) c;
- (Arrow*) getArrow: (int) c;
- (void) deleteArrow: (int) c;
- (void) setHyper: (Hyper*) w at:(int) c;
- (Hyper*) getHyper: (int) c;
- (void) deleteHyper: (int) c;
- (void) setSpike: (Spike*) w at:(int) c;
- (Spike*) getSpike: (int) c;
- (void) deleteSpike: (int) c;
- (void) setRepel: (Repel*) w at:(int) c;
- (Repel*) getRepel: (int) c;
- (void) deleteRepel: (int) c;
- (void) setNograv: (Nograv*) w at:(int) c;
- (Nograv*) getNograv: (int) c;
- (void) deleteNograv: (int) c;
- (void) setPlatform: (Platform*) w at:(int) c;
- (Platform*) getPlatform: (int) c;
- (void) deletePlatform: (int) c;
- (void) setPlatform1: (Platform1*) w at:(int) c;
- (Platform1*) getPlatform1: (int) c;
- (void) deletePlatform1: (int) c;
- (void) setPlatform2: (Platform2*) w at:(int) c;
- (Platform2*) getPlatform2: (int) c;
- (void) deletePlatform2: (int) c;
- (void) setSaw: (Saw*) w at:(int) c;
- (Saw*) getSaw: (int) c;
- (void) deleteSaw: (int) c;
- (void) setStar: (Star*) w at:(int) c;
- (Star*) getStar: (int) c;
- (void) deleteStar: (int) c;
- (void) setTeleport: (Teleport*) w at:(int) c;
- (Teleport*) getTeleport: (int) c;
- (void) deleteTeleport: (int) c;
- (void) setScrew: (Screw*) w at:(int) c;
- (Screw*) getScrew: (int) c;
- (void) deleteScrew: (int) c;

@end
