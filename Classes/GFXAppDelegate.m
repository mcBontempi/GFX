//
//  GFXAppDelegate.m
//  GFX
//
//  Created by daren taylor on 07/04/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "GFXAppDelegate.h"
#import "GFXViewController.h"

@implementation GFXAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
