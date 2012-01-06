//
//  Saw.h
//  Springs
//
//  Created by вадим on 3/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

#define SAW_RADIUS 25

@interface Saw : CommonObj {

//    int typ;
    BOOL dir;
}

//- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space;
- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space type:(int)type;
- (void) changeDir;

@property (readonly) int typ;

@end
