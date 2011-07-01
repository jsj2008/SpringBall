//
//  MassBody.h
//  Springs
//
//  Created by s1ip on 10.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

enum MassBodyType {MS_START, MS_FINISH, MS_TRANSIT};

#define MASSBODY_RADIUS 13

#import "CommonObj.h"

@interface MassBody : CommonObj {
	int type;
}
@property (readonly) int type;
- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* pos:(CGPoint)pos*/ type:(int)typ;

@end
