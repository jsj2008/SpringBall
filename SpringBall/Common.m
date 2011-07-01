//
//  Common.m
//  Springs
//
//  Created by вадим on 2/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

LevelStruct* ls = nil;

/*@implementation APStruct
@end
@implementation BPStruct
@end
@implementation TPStruct
@end
@implementation ATPStruct
@end*/
@implementation LevelStruct
@end


@implementation Common

@synthesize score;
//@synthesize gravity;
@synthesize strongwind;
@synthesize weakwind;
@synthesize ringspeed;
@synthesize ringspin;
@synthesize shootkoeff;
@synthesize repelpower1;
@synthesize repelpower2;
@synthesize repelpower3;
@synthesize editor;
@synthesize tailcount;
@synthesize tailfadeout;
@synthesize bottomForce;
@synthesize gravityexists;
@synthesize setlevel;

@synthesize ballsonfinish;
//@synthesize gravityAngle;

+ (Common*) instance  {
	static Common* instance;
	@synchronized(self) {
		if(!instance) {
			instance = [[Common alloc] init];
		}
	}
	return instance;
}

- (id) init {	
	
	self = [super init];
	if(self !=nil) {
		
		NSString *appFile = [[NSBundle mainBundle] pathForResource:@"params" ofType:@"plist"];
		params = [[NSMutableDictionary alloc] initWithContentsOfFile:appFile];
		
		[self resetGame];
	}
	return self;	
}

- (void) setLayer: (CCLayer*)lr {
	
	lay = lr;
	back_sprite = [CCSprite spriteWithFile:@"arrow_background.png"];
	back_sprite.position = ccp(240, 160);
	[lay addChild:back_sprite z:1];	
	
}

- (void) setWind: (Wind*) w at:(int) c {
	wind_array[c] = w;
}

- (Wind*) getWind: (int) c {
	return wind_array[c];
}

- (void) deleteWind: (int) c {
	
	[wind_array[c] release];
	ls->wind_count--;
	wind_array[c] = wind_array[ls->wind_count];
	ls->iwind[c] = ls->iwind[ls->wind_count];
}

- (void) setTransit: (MassBody*) w at:(int) c {
	transit_array[c] = w;
}

- (MassBody*) getTransit: (int) c {
	return transit_array[c];
}

- (void) deleteTransit: (int) c {

	[transit_array[c] release];
	ls->transit_count--;
	transit_array[c] = transit_array[ls->transit_count];
	ls->itransit[c] = ls->itransit[ls->transit_count];
}

- (void) setStart: (MassBody*) w at:(int) c {
	start_array[c] = w;
}

- (MassBody*) getStart: (int) c {
	return start_array[c];
}

- (void) deleteStart: (int) c {
	
	[start_array[c] release];
	ls->start_count--;
	start_array[c] = start_array[ls->start_count];
	ls->istart[c] = ls->istart[ls->start_count];
}

- (void) setFinish: (MassBody*) w at:(int) c {
	finish_array[c] = w;
}

- (MassBody*) getFinish: (int) c {
	return finish_array[c];
}

- (void) deleteFinish: (int) c {
	
	[finish_array[c] release];
	ls->finish_count--;
	finish_array[c] = finish_array[ls->finish_count];
	ls->ifinish[c] = ls->ifinish[ls->finish_count];
}

- (void) setArrow: (Arrow*) w at:(int) c {
	arrow_array[c] = w;
}

- (Arrow*) getArrow: (int) c {
	return arrow_array[c];
}

- (void) deleteArrow: (int) c {
	
	[arrow_array[c] release];
	ls->arrow_count--;
	arrow_array[c] = arrow_array[ls->arrow_count];
	ls->iarrow[c] = ls->iarrow[ls->arrow_count];
}

- (void) setHyper: (Hyper*) w at:(int) c {
	hyper_array[c] = w;
}

- (Hyper*) getHyper: (int) c {
	return hyper_array[c];
}

- (void) deleteHyper: (int) c {
	
	[hyper_array[c] release];
	ls->hyper_count--;
	hyper_array[c] = hyper_array[ls->hyper_count];
	ls->ihyper[c] = ls->ihyper[ls->hyper_count];
}

- (void) setSpike: (Spike*) w at:(int) c {
	spike_array[c] = w;
}

- (Spike*) getSpike: (int) c {
	return spike_array[c];
}

- (void) deleteSpike: (int) c {
	
	[spike_array[c] release];
	ls->spike_count--;
	spike_array[c] = spike_array[ls->spike_count];
	ls->ispike[c] = ls->ispike[ls->spike_count];
}

- (void) setRepel: (Repel*) w at:(int) c {
	repel_array[c] = w;
}

- (Repel*) getRepel: (int) c {
	return repel_array[c];
}

- (void) deleteRepel: (int) c {
	
	[repel_array[c] release];
	ls->repel_count--;
	repel_array[c] = repel_array[ls->repel_count];
	ls->irepel[c] = ls->irepel[ls->repel_count];
}


- (void) setNograv: (Nograv*) w at:(int) c {
	nograv_array[c] = w;
}

- (Nograv*) getNograv: (int) c {
	return nograv_array[c];
}

- (void) deleteNograv: (int) c {
	
	[nograv_array[c] release];
	ls->nograv_count--;
	nograv_array[c] = nograv_array[ls->nograv_count];
	ls->inograv[c] = ls->inograv[ls->nograv_count];
}

- (void) setPlatform: (Platform*) w at:(int) c {
	platform_array[c] = w;
}

- (Platform*) getPlatform: (int) c {
	return platform_array[c];
}

- (void) deletePlatform: (int) c {
	
	[platform_array[c] release];
	ls->platform_count--;
	platform_array[c] = platform_array[ls->platform_count];
	ls->iplatform[c] = ls->iplatform[ls->platform_count];
}

- (void) setPlatform1: (Platform1*) w at:(int) c {
	platform_array1[c] = w;
}

- (Platform1*) getPlatform1: (int) c {
	return platform_array1[c];
}

- (void) deletePlatform1: (int) c {
	
	[platform_array1[c] release];
	ls->platform_count1--;
	platform_array1[c] = platform_array1[ls->platform_count1];
	ls->iplatform1[c] = ls->iplatform1[ls->platform_count1];
}


- (void) setSaw: (Saw*) w at:(int) c {
	saw_array[c] = w;
}

- (Saw*) getSaw: (int) c {
	return saw_array[c];
}

- (void) deleteSaw: (int) c {
	
	[saw_array[c] release];
	ls->saw_count--;
	saw_array[c] = saw_array[ls->saw_count];
	ls->isaw[c] = ls->isaw[ls->saw_count];
}

- (void) setStar: (Star*) w at:(int) c {
	star_array[c] = w;
}

- (Star*) getStar: (int) c {
	return star_array[c];
}

- (void) deleteStar: (int) c {
	
	[star_array[c] release];
	ls->star_count--;
	star_array[c] = star_array[ls->star_count];
	ls->istar[c] = ls->istar[ls->star_count];
}

- (void) setTeleport: (Teleport*) w at:(int) c {
	teleport_array[c] = w;
}

- (Teleport*) getTeleport: (int) c {
	return teleport_array[c];
}

- (void) deleteTeleport: (int) c {
	
	[teleport_array[c] release];
	ls->teleport_count--;
	teleport_array[c] = teleport_array[ls->teleport_count];
	ls->iteleport[c] = ls->iteleport[ls->teleport_count];
}

- (void) setScrew: (Screw*) w at:(int) c {
	screw_array[c] = w;
}

- (Screw*) getScrew: (int) c {
	return screw_array[c];
}

- (void) deleteScrew: (int) c {
	
	[screw_array[c] release];
	ls->screw_count--;
	screw_array[c] = screw_array[ls->screw_count];
	ls->iscrew[c] = ls->iscrew[ls->screw_count];
}

- (float) getParams: (NSString*) name {

	NSString *s = [params objectForKey:name];
	float r = [s floatValue];
	return r;
}

- (void) getLevelParams: (int)level params:(LevelStruct*) parms {

	NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* docpath = [sp objectAtIndex: 0];
	NSString* filePath = [docpath stringByAppendingPathComponent:[NSString stringWithFormat:@"level%d.plist", level]];
	BOOL fe = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
	if(!fe) {

		NSString *appFile = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"level%d", level] ofType:@"plist"];
		NSString *appFile1 = [[NSBundle mainBundle] pathForResource:@"level_pattern" ofType:@"plist"];
		BOOL fe1 = [[NSFileManager defaultManager] fileExistsAtPath:appFile];
		NSError *error;
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager copyItemAtPath:fe1?appFile:appFile1 toPath:filePath error:&error];

	}

	NSMutableDictionary* prms = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];

	parms->transit_count = [[[prms objectForKey:@"Transit"] objectForKey:@"Transit_count"] intValue];
	for(int i = 0; i < parms->transit_count; i++) {
		id obj = [[prms objectForKey:@"Transit"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->itransit[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}

	parms->start_count = [[[prms objectForKey:@"Start"] objectForKey:@"Start_count"] intValue];
	for(int i = 0; i < parms->start_count; i++) {
		id obj = [[prms objectForKey:@"Start"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->istart[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->istart[i].balls = [[obj objectForKey:@"Balls_count"] intValue];
	}

	parms->finish_count = [[[prms objectForKey:@"Finish"] objectForKey:@"Finish_count"] intValue];
	for(int i = 0; i < parms->finish_count; i++) {
		id obj = [[prms objectForKey:@"Finish"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->ifinish[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}
	
	parms->wind_count = [[[prms objectForKey:@"Wind"] objectForKey:@"Wind_count"] intValue];
	for(int i = 0; i < parms->wind_count; i++) {
		id obj = [[prms objectForKey:@"Wind"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iwind[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->iwind[i].angle = [[obj objectForKey:@"Angle"] intValue];
		parms->iwind[i].type = [[obj objectForKey:@"Type"] intValue];
	}

	parms->arrow_count = [[[prms objectForKey:@"Arrow"] objectForKey:@"Arrow_count"] intValue];
	for(int i = 0; i < parms->arrow_count; i++) {
		id obj = [[prms objectForKey:@"Arrow"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iarrow[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->iarrow[i].angle = [[obj objectForKey:@"Angle"] intValue];
	}

	parms->hyper_count = [[[prms objectForKey:@"Hyper"] objectForKey:@"Hyper_count"] intValue];
	for(int i = 0; i < parms->hyper_count; i++) {
		id obj = [[prms objectForKey:@"Hyper"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->ihyper[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}

	parms->spike_count = [[[prms objectForKey:@"Spike"] objectForKey:@"Spike_count"] intValue];
	for(int i = 0; i < parms->spike_count; i++) {
		id obj = [[prms objectForKey:@"Spike"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->ispike[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->ispike[i].angle = [[obj objectForKey:@"Angle"] intValue];
	}

	parms->repel_count = [[[prms objectForKey:@"Repel"] objectForKey:@"Repel_count"] intValue];
	for(int i = 0; i < parms->repel_count; i++) {
		id obj = [[prms objectForKey:@"Repel"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->irepel[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->irepel[i].type = [[obj objectForKey:@"Type"] intValue];
	}

	parms->nograv_count = [[[prms objectForKey:@"Nograv"] objectForKey:@"Nograv_count"] intValue];
	for(int i = 0; i < parms->nograv_count; i++) {
		id obj = [[prms objectForKey:@"Nograv"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->inograv[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}

	parms->platform_count = [[[prms objectForKey:@"Platform"] objectForKey:@"Platform_count"] intValue];
	for(int i = 0; i < parms->platform_count; i++) {
		id obj = [[prms objectForKey:@"Platform"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iplatform[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->iplatform[i].angle = [[obj objectForKey:@"Angle"] intValue];
	}

	parms->platform_count1 = [[[prms objectForKey:@"Platform1"] objectForKey:@"Platform_count1"] intValue];
	for(int i = 0; i < parms->platform_count1; i++) {
		id obj = [[prms objectForKey:@"Platform1"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iplatform1[i].pos = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
		parms->iplatform1[i].angle = [[obj objectForKey:@"Angle"] intValue];
	}
	
	parms->saw_count = [[[prms objectForKey:@"Saw"] objectForKey:@"Saw_count"] intValue];
	for(int i = 0; i < parms->saw_count; i++) {
		id obj = [[prms objectForKey:@"Saw"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->isaw[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}

	parms->star_count = [[[prms objectForKey:@"Star"] objectForKey:@"Star_count"] intValue];
	for(int i = 0; i < parms->star_count; i++) {
		id obj = [[prms objectForKey:@"Star"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->istar[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}
	
	parms->teleport_count = [[[prms objectForKey:@"Teleport"] objectForKey:@"Teleport_count"] intValue];
	for(int i = 0; i < parms->teleport_count; i++) {
		id obj = [[prms objectForKey:@"Teleport"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iteleport[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}
	
	parms->screw_count = [[[prms objectForKey:@"Screw"] objectForKey:@"Screw_count"] intValue];
	for(int i = 0; i < parms->screw_count; i++) {
		id obj = [[prms objectForKey:@"Screw"] objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		parms->iscrew[i] = ccp([[obj objectForKey:@"x"] intValue],[[obj objectForKey:@"y"] intValue]);
	}

	[prms release];

}

- (void) setLevelParams: (int)level params:(LevelStruct*) parms {

	NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* docpath = [sp objectAtIndex: 0];
	NSString* filePath = [docpath stringByAppendingPathComponent:[NSString stringWithFormat:@"level%d.plist", level]];
	NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
	
	[plistDict removeObjectForKey:@"Teleport"];
	NSMutableDictionary* it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->teleport_count], nil]
													 forKeys:[NSArray arrayWithObjects:@"Teleport_count", nil]];

	[plistDict setObject:it forKey:@"Teleport"]; 
	
	id objte = [plistDict objectForKey:@"Teleport"];
//	[objte setValue: [NSNumber numberWithInt:parms->teleport_count] forKey:@"Teleport_count"];
	for(int i = 0; i < parms->teleport_count; i++) {
		id obj = [objte objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->iteleport[i].x],
																	   [NSNumber numberWithInt:parms->iteleport[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objte setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->iteleport[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->iteleport[i].y] forKey:@"y"];		
		}
	}	

	[plistDict removeObjectForKey:@"Saw"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->saw_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Saw_count", nil]];	
	[plistDict setObject:it forKey:@"Saw"]; 
	
	id objsa = [plistDict objectForKey:@"Saw"];
//	[objsa setValue: [NSNumber numberWithInt:parms->saw_count] forKey:@"Saw_count"];
	for(int i = 0; i < parms->saw_count; i++) {
		id obj = [objsa objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->isaw[i].x],
																	   [NSNumber numberWithInt:parms->isaw[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objsa setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->isaw[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->isaw[i].y] forKey:@"y"];		
		}
	}	
	
	[plistDict removeObjectForKey:@"Star"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->star_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Star_count", nil]];	

	[plistDict setObject:it forKey:@"Star"]; 
	
	id objsta = [plistDict objectForKey:@"Star"];
	for(int i = 0; i < parms->star_count; i++) {
		id obj = [objsta objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->istar[i].x],
																	   [NSNumber numberWithInt:parms->istar[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objsta setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->istar[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->istar[i].y] forKey:@"y"];		
		}
	}	
	
	[plistDict removeObjectForKey:@"Screw"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->screw_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Screw_count", nil]];	
	[plistDict setObject:it forKey:@"Screw"]; 
	
	id objsw = [plistDict objectForKey:@"Screw"];
	for(int i = 0; i < parms->screw_count; i++) {
		id obj = [objsw objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->iscrew[i].x],
																	   [NSNumber numberWithInt:parms->iscrew[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objsw setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->iscrew[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->iscrew[i].y] forKey:@"y"];		
		}
	}	
	
	[plistDict removeObjectForKey:@"Platform"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->platform_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Platform_count",	nil]];	
	[plistDict setObject:it forKey:@"Platform"]; 
	id objp = [plistDict objectForKey:@"Platform"];
//	[objp setValue: [NSNumber numberWithInt:parms->platform_count] forKey:@"Platform_count"];
	for(int i = 0; i < parms->platform_count; i++) {
		id obj = [objp objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->iplatform[i].angle],
																	   [NSNumber numberWithInt:parms->iplatform[i].pos.x],
																	   [NSNumber numberWithInt:parms->iplatform[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Angle",
																	  @"x",
																	  @"y",
																	  nil]];
			[objp setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->iplatform[i].angle] forKey:@"Angle"];
			[obj setValue:[NSNumber numberWithInt:parms->iplatform[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->iplatform[i].pos.y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Platform1"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->platform_count1], nil]
											forKeys:[NSArray arrayWithObjects: @"Platform_count1",	nil]];	
	[plistDict setObject:it forKey:@"Platform1"]; 
	id objp1 = [plistDict objectForKey:@"Platform1"];
	//	[objp setValue: [NSNumber numberWithInt:parms->platform_count] forKey:@"Platform_count"];
	for(int i = 0; i < parms->platform_count1; i++) {
		id obj = [objp1 objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->iplatform1[i].angle],
																	   [NSNumber numberWithInt:parms->iplatform1[i].pos.x],
																	   [NSNumber numberWithInt:parms->iplatform1[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Angle",
																	  @"x",
																	  @"y",
																	  nil]];
			[objp1 setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->iplatform1[i].angle] forKey:@"Angle"];
			[obj setValue:[NSNumber numberWithInt:parms->iplatform1[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->iplatform1[i].pos.y] forKey:@"y"];		
		}
	}
	
	[plistDict removeObjectForKey:@"Nograv"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->nograv_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Nograv_count",	nil]];	
	[plistDict setObject:it forKey:@"Nograv"]; 
	
	id objn = [plistDict objectForKey:@"Nograv"];
//	[objn setValue: [NSNumber numberWithInt:parms->nograv_count] forKey:@"Nograv_count"];
	for(int i = 0; i < parms->nograv_count; i++) {
		id obj = [objn objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->inograv[i].x],
																	   [NSNumber numberWithInt:parms->inograv[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objn setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->inograv[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->inograv[i].y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Repel"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->repel_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Repel_count",	nil]];	
	[plistDict setObject:it forKey:@"Repel"]; 
	
	id objr = [plistDict objectForKey:@"Repel"];
//	[objr setValue: [NSNumber numberWithInt:parms->repel_count] forKey:@"Repel_count"];
	for(int i = 0; i < parms->repel_count; i++) {
		id obj = [objr objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->irepel[i].type],
																	   [NSNumber numberWithInt:parms->irepel[i].pos.x],
																	   [NSNumber numberWithInt:parms->irepel[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Type",
																	  @"x",
																	  @"y",
																	  nil]];
			[objr setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->irepel[i].type] forKey:@"Type"];
			[obj setValue:[NSNumber numberWithInt:parms->irepel[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->irepel[i].pos.y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Spike"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->spike_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Spike_count",	nil]];	
	[plistDict setObject:it forKey:@"Spike"]; 
	
	id objs = [plistDict objectForKey:@"Spike"];
//	[objs setValue: [NSNumber numberWithInt:parms->spike_count] forKey:@"Spike_count"];
	for(int i = 0; i < parms->spike_count; i++) {
		id obj = [objs objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->ispike[i].angle],
																	   [NSNumber numberWithInt:parms->ispike[i].pos.x],
																	   [NSNumber numberWithInt:parms->ispike[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Angle",
																	  @"x",
																	  @"y",
																	  nil]];
			[objs setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->ispike[i].angle] forKey:@"Angle"];
			[obj setValue:[NSNumber numberWithInt:parms->ispike[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->ispike[i].pos.y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Hyper"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->hyper_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Hyper_count",	nil]];	
	[plistDict setObject:it forKey:@"Hyper"]; 
	id objh = [plistDict objectForKey:@"Hyper"];
//	[objh setValue: [NSNumber numberWithInt:parms->hyper_count] forKey:@"Hyper_count"];
	for(int i = 0; i < parms->hyper_count; i++) {
		id obj = [objh objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->ihyper[i].x],
																	   [NSNumber numberWithInt:parms->ihyper[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objh setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->ihyper[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->ihyper[i].y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Start"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->start_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Start_count",	nil]];	
	[plistDict setObject:it forKey:@"Start"]; 
	
	id objst = [plistDict objectForKey:@"Start"];
//	[objst setValue: [NSNumber numberWithInt:parms->start_count] forKey:@"Start_count"];
	for(int i = 0; i < parms->start_count; i++) {
		id obj = [objst objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->istart[i].balls],
																	   [NSNumber numberWithInt:parms->istart[i].pos.x],
																	   [NSNumber numberWithInt:parms->istart[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Balls_count",
																	  @"x",
																	  @"y",
																	  nil]];
			[objst setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->istart[i].balls] forKey:@"Balls_count"];
			[obj setValue:[NSNumber numberWithInt:parms->istart[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->istart[i].pos.y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Finish"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->finish_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Finish_count",	nil]];	
	[plistDict setObject:it forKey:@"Finish"]; 
	id objfi = [plistDict objectForKey:@"Finish"];
//	[objfi setValue: [NSNumber numberWithInt:parms->finish_count] forKey:@"Finish_count"];
	for(int i = 0; i < parms->finish_count; i++) {
		id obj = [objfi objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->ifinish[i].x],
																	   [NSNumber numberWithInt:parms->ifinish[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objfi setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->ifinish[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->ifinish[i].y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Transit"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->transit_count], nil]
												   forKeys:[NSArray arrayWithObjects: @"Transit_count",	nil]];	
	[plistDict setObject:it forKey:@"Transit"]; 
	id objt = [plistDict objectForKey:@"Transit"];
//	[objt setValue: [NSNumber numberWithInt:parms->transit_count] forKey:@"Transit_count"];
	for(int i = 0; i < parms->transit_count; i++) {
		id obj = [objt objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->itransit[i].x],
																	   [NSNumber numberWithInt:parms->itransit[i].y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"x",
																	  @"y",
																	  nil]];
			[objt setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->itransit[i].x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->itransit[i].y] forKey:@"y"];		
		}
	}


	[plistDict removeObjectForKey:@"Wind"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->wind_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Wind_count",	nil]];	
	[plistDict setObject:it forKey:@"Wind"]; 
	id objw = [plistDict objectForKey:@"Wind"];
//	[objw setValue: [NSNumber numberWithInt:parms->wind_count] forKey:@"Wind_count"];
	for(int i = 0; i < parms->wind_count; i++) {
		id obj = [objw objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
		NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
								[NSNumber numberWithInt:parms->iwind[i].angle],
								[NSNumber numberWithInt:parms->iwind[i].type],
								[NSNumber numberWithInt:parms->iwind[i].pos.x],
								[NSNumber numberWithInt:parms->iwind[i].pos.y],
							   nil]
							forKeys:[NSArray arrayWithObjects:
									 @"Angle",
									 @"Type",
									 @"x",
									 @"y",
									 nil]];
			[objw setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
		[obj setValue:[NSNumber numberWithInt:parms->iwind[i].angle] forKey:@"Angle"];
		[obj setValue:[NSNumber numberWithInt:parms->iwind[i].type] forKey:@"Type"];
		[obj setValue:[NSNumber numberWithInt:parms->iwind[i].pos.x] forKey:@"x"];
		[obj setValue:[NSNumber numberWithInt:parms->iwind[i].pos.y] forKey:@"y"];		
		}
	}

	[plistDict removeObjectForKey:@"Arrow"];
	it = [NSMutableDictionary dictionaryWithObjects: [NSArray arrayWithObjects: [NSNumber numberWithInt:parms->arrow_count], nil]
											forKeys:[NSArray arrayWithObjects: @"Arrow_count",	nil]];	
	[plistDict setObject:it forKey:@"Arrow"]; 
	
	id obja = [plistDict objectForKey:@"Arrow"];
//	[obja setValue: [NSNumber numberWithInt:parms->arrow_count] forKey:@"Arrow_count"];
	for(int i = 0; i < parms->arrow_count; i++) {
		id obj = [obja objectForKey:[NSString stringWithFormat:@"Item%d", i]];
		if(!obj) {
			NSDictionary *item = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:
																	   [NSNumber numberWithInt:parms->iarrow[i].angle],
																	   [NSNumber numberWithInt:parms->iarrow[i].pos.x],
																	   [NSNumber numberWithInt:parms->iarrow[i].pos.y],
																	   nil]
															 forKeys:[NSArray arrayWithObjects:
																	  @"Angle",
																	  @"x",
																	  @"y",
																	  nil]];
			[obja setObject:item forKey:[NSString stringWithFormat:@"Item%d", i]]; 
 		} else {
			[obj setValue:[NSNumber numberWithInt:parms->iarrow[i].angle] forKey:@"Angle"];
			[obj setValue:[NSNumber numberWithInt:parms->iarrow[i].pos.x] forKey:@"x"];
			[obj setValue:[NSNumber numberWithInt:parms->iarrow[i].pos.y] forKey:@"y"];		
		}
	}
	
	[plistDict writeToFile:filePath atomically: YES];
	[plistDict release];
	
}

- (void) resetGame {

	score = 0;
	gravityAngle = 0;
	
	gravity = [self getParams:@"Gravity"];
	strongwind = [self getParams:@"StrongWind"];
	weakwind = [self getParams:@"WeakWind"];
	ringspeed = [self getParams:@"Ringspeed"];
	ringspin = [self getParams:@"Ringspin"];
	shootkoeff = [self getParams:@"Shootkoeff"];
	tailcount = [self getParams:@"TailCount"];
	tailfadeout = [self getParams:@"TailFadeout"];
	bottomForce = [self getParams:@"BottomForce"];
	repelpower1 = [self getParams:@"RepelPower1"];
	repelpower2 = [self getParams:@"RepelPower2"];
	repelpower3 = [self getParams:@"RepelPower3"];
	
}

- (cpVect) getGravity {
	
	if(!gravityexists)
		return cpvzero;
	
	switch (gravityAngle) {
		case 0: return cpv(gravity, 0);
		case 90: return cpv(0, -gravity);
		case 180: return cpv(-gravity, 0);
		case 270: return cpv(0, gravity);
	}
	
return cpvzero;
}

- (void) setGravityAngle: (int)a {
	
	gravityAngle = a;
	back_sprite.rotation = a;
	back_sprite.visible = YES;
	
}

- (void) resetGravityAngle {
	
	gravityAngle = 90;
	back_sprite.visible = NO;
}

- (void) dealloc{

	[params release];

	[super dealloc];
	
}

@end