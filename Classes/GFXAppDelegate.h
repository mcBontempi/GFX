//
//  GFXAppDelegate.h
//  GFX
//
//  Created by daren taylor on 07/04/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GFXViewController;

@interface GFXAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GFXViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GFXViewController *viewController;

@end

