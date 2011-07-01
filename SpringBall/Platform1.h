//
//  Platform1.h
//  Springs
//
//  Created by Admin on 11.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

@interface Platform1 : CommonObj <Rotate> {
	
	cpFloat angle;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* type:(int)type*/;

@property (readonly) cpFloat angle;

@end
