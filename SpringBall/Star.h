//
//  Star.h
//  Springs
//
//  Created by вадим on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

#define STAR_RADIUS 11

@interface Star : CommonObj {
	
	id fluct;
	id goout;
	bool active;
    id anm_star;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space;

- (void) act;
//- (void) actCallback;

@end
