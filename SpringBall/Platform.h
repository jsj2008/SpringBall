//
//  Platform.h
//  Springs
//
//  Created by вадим on 3/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

@interface Platform : CommonObj <Rotate> {
	
	cpFloat angle;
}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* type:(int)type*/;

@property (readonly) cpFloat angle;

@end
