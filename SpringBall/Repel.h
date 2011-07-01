//
//  Repel.h
//  Springs
//
//  Created by вадим on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

#define REPEL_RADIUS 17

@interface Repel : CommonObj {
	
	int typ;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type;

@property (readonly) int typ;

- (void) ballon;
- (void) balloff;

@end
