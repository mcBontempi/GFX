//
//  GFXViewController.h
//  GFX
//
//  Created by daren taylor on 07/04/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AreaView.h"

@interface GFXViewController : UIViewController <CLLocationManagerDelegate, UIAccelerometerDelegate>   
{
	IBOutlet AreaView* areaView;
	
	CLLocationManager* locationManager;
	
	
	CLLocationCoordinate2D emulatedLocation;
}

-(void) startAccelerometer;
- (void)startUpdates;



@property (nonatomic, retain) IBOutlet AreaView* areaView;

@end

