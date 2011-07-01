//
//  Arrow.h
//  Springs
//
//  Created by вадим on 3/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonObj.h"

@interface Arrow : CommonObj <Rotate> {

	cpFloat angle;
//	int typ;
//	CCSprite* back_sprite;

}

- (id) initWithParams: (CCLayer*)lr space:(cpSpace*)space/* type:(int)type*/;

@property (readonly) cpFloat angle;

@end
