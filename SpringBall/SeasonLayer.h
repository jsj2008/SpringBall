//
//  SeasonLayer.h
//  BestJumps
//
//  Created by вадим on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"


@interface SeasonLayer : CCLayer {
    
}

+ (CCScene *) scene;

- (void) summerBt;
- (void) autumnBt;
- (void) winterBt;
- (void) springBt;
- (void) backBt;

@end
