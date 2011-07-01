//
//  Teleport.h
//  Springs
//
//  Created by вадим on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

#define TELEPORT_RADIUS 7

@interface Teleport : CommonObj {
	int number;	
	bool active;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space num:(int)num;

@property (readonly) int number;
@property (readwrite) bool active;

@end
