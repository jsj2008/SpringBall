//
//  SpringsAppDelegate.h
//  Springs
//
//  Created by s1ip on 28.01.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface SpringsAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
    RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
