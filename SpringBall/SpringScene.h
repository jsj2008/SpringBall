//#import <UIKit/UIKit.h>

#import "cocos2d.h"
#import "chipmunk.h"

#import "Ball.h"
#import "MassBody.h"
#import "Wind.h"
#import "Common.h"

#define MAX_BALLS_NUM 20

//extern LevelStruct* ls;

enum EditorObjects { EO_EASYWIND/*must be 1st*/, /*EO_STRONGWIND,*/ EO_START, EO_FINISH, EO_TRANSIT, EO_ARROW, EO_HYPER, EO_SPIKE, EO_REPEL0, EO_REPEL1, EO_REPEL2, EO_NOGRAV, EO_PLATFORM, EO_PLATFORM1, EO_PLATFORM2, EO_SAW, EO_TELEPORT, EO_SCREW, EO_STAR, EO_MAX/*must be always at the end*/ };

//extern int balls_num[MAX_LEVEL];
//extern int start_pos[MAX_LEVEL][2];
//extern int finish_pos[MAX_LEVEL][2];
//extern int transit_pos[MAX_LEVEL][2];

@interface SpringScene : CCLayer {
	
	cpSpace* space;
//	LevelStruct* ls;
//	Ball* ball[MAX_BALLS_NUM];
	CCSprite* direction_sprite;
	CCSprite* direction_sprite_max;
	CCSprite* editor_sprite;
	CCSprite* editor_sprite1;
	CCSprite* editor_sprite2;
//	MassBody* startmassbody;
//	MassBody* finishmassbody;
	int level;
	int selected;
	CommonObj* obj_selected;
	CommonObj* obj_hanged;
	int shadow_count;
	CGPoint convLocation;
	CGPoint convLocationMoved;
	int editorobj;
	int* decrement_counter;

//	CCMenu* menu;

}

+(id) scene;

-(void) startLevel: (int) l;
-(void) step: (ccTime) dt;

- (void) nextlevelCallback:(id) sender;


@end
