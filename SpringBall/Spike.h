//
//  Spike.h
//  Springs
//
//  Created by вадим on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

@interface Spike : CommonObj <Rotate> {

	cpFloat angle;

}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space;

@property (readonly) cpFloat angle;

@end
