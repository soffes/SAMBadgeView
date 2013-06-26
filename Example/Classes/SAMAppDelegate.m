//
//  SAMAppDelegate.m
//  SAMBadgeView
//
//  Created by Sam Soffes on 6/26/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMAppDelegate.h"
#import "SAMBadgeViewDemoViewController.h"

@implementation SAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

	SAMBadgeViewDemoViewController *viewController = [[SAMBadgeViewDemoViewController alloc] init];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
