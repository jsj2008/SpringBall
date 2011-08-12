//
//  MenuLayer.h
//  BestJumps
//
//  Created by вадим on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"


@interface MenuLayer : CCLayer {
    
}

+ (CCScene *) scene;

- (void) startBt;
- (void) helpBt;
- (void) scoreBt;
- (void) soundBt: (id) sender;
- (void) init1;

@end
