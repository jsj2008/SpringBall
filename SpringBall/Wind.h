//
//  Wind.h
//  Springs
//
//  Created by вадим on 2/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

enum WIND_TYPE {WIND_EASY, WIND_STRONG};

@interface Wind : CommonObj {

	id anm_move1;
	id anm_move2;
	cpFloat angle;
	int typ;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type;
- (void) setAngle: (cpFloat)a;
- (int) getWindPower;

@property (readonly) cpFloat angle;
@property (readonly) int typ;

@end
