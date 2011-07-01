//
//  Nograv.h
//  Springs
//
//  Created by вадим on 3/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

#define NOGRAV_RADIUS 20

@interface Nograv : CommonObj {
	
	bool active;
	
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space;

- (void) hit;

@property (readonly) bool active;

@end
