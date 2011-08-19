//
//  AppDelegate.h
//  SpringBall
//
//  Created by naceka on 01.07.11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

-(void) preloadSounds;
-(void) unloadSounds;

@end
